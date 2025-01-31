# Webshells

Various custom built webshells for penetration testing and red teaming.



## List of webshells in repository

| Name                                                                                           | Language | Description                                                                                                                                                                                            | Usage                                                                                                                   |
| ---------------------------------------------------------------------------------------------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------- |
| [Webshell_h.php](https://github.com/OffensiveBlueprint/Webshells/blob/main/php/Webshell_h.php) | PHP      | Webshell that allows to interact with OS, by sending base64 encoded payloads in "X-Authorization-Bearer" header value. This webshell uses uncommon "proc_open() for execution (less commonly flagged). | echo -n "Command" \| base64 -> curl -H "X-Authorization-Bearer: base64 Encoded command" http://target.com/Webhell_h.php |
|                                                                                                |          |                                                                                                                                                                                                        |                                                                                                                         |
