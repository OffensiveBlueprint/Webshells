# Webshells

Various custom built webshells for penetration testing and red teaming.



## List of webshells in repository

| Name                                                                                                                     | Language           | Description                                                                                                                                                                                               | Usage                                                                                        |
| ------------------------------------------------------------------------------------------------------------------------ | ------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| [webshell_h.php](https://github.com/OffensiveBlueprint/Webshells/blob/main/php/webshell_h.php "webshell_h.php")      | PHP                | Webshell that allows to interact with OS, by sending base64 encoded payloads in "X-Authorization-Bearer" header value. This webshell uses uncommon **proc_open()** for execution (less commonly flagged).    | curl -H "X-Authorization-Bearer: $(echo -n 'Command' \| base64)" http://target.com/shell     |
| [webshell_neth.cs](https://github.com/OffensiveBlueprint/Webshells/blob/main/dotnet/webshell_neth.cs "webshell_neth.cs") | C# (.NET)          | Webshell that allows to interact with OS, by sending base64 encoded payloads in "X-Authorization-Bearer" header value. This webshell uses **ProcessStartInfo** to reduce detection.                       | curl -H "X-Authorization-Bearer: $(echo -n 'Command' \| base64)" http://target.com/shell<br> |
| [webshell_h.java](https://github.com/OffensiveBlueprint/Webshells/blob/main/java/webshell_h.java "webshell_h.java")      | Java (Spring Boot) | Webshell that allows to interact with OS, by sending base64 encoded payloads in "X-Authorization-Bearer" header value. Uses a **Servlet Filter** to hijack all requests **without modifying controllers**. | curl -H "X-Authorization-Bearer: $(echo -n 'Command' \| base64)" http://target.com/shell     |
