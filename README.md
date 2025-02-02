# Webshells

Various custom built webshells for penetration testing and red teaming.



## List of webshells in repository

| Name                                                                                                                     | Language           | Description                                                                                                                                                                                               | Usage                                                                                        |
| ------------------------------------------------------------------------------------------------------------------------ | ------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| [webshell_h.php](https://github.com/OffensiveBlueprint/Webshells/blob/main/php/webshell_h.php "webshell_h.php")      | PHP                | Webshell that allows to interact with OS, by sending base64 encoded payloads in "X-Authorization-Bearer" header value. This webshell uses uncommon **proc_open()** for execution (less commonly flagged).    | curl -H "X-Authorization-Bearer: $(echo -n 'Command' \| base64)" http://target.com/shell     |
| [webshell_h.aspx](https://github.com/OffensiveBlueprint/Webshells/blob/main/aspx/webshell_h.aspx "webshell_h.aspx") | C# (.NET)          | Webshell that allows to interact with OS, by sending base64 encoded payloads in "X-Authorization-Bearer" header value. This webshell uses ProcessStartInfo with RedirectStandardOutput to evade detection.                       | curl -H "X-Authorization-Bearer: $(echo -n 'Command' \| base64)" http://target.com/shell<br> |
| [webshell_h.java](https://github.com/OffensiveBlueprint/Webshells/blob/main/java/webshell_h.java "webshell_h.java")      | Java (Spring Boot) | Webshell that allows to interact with OS, by sending base64 encoded payloads in "X-Authorization-Bearer" header value. Uses a **Servlet Filter** to hijack all requests **without modifying controllers**. | curl -H "X-Authorization-Bearer: $(echo -n 'Command' \| base64)" http://target.com/shell     |
