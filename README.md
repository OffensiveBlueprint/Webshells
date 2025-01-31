# Webshells

Various custom built webshells for penetration testing and red teaming.



## List of webshells in repository

| Name           | Language | Description                                                                                                            | Usage                                                                                                                   |
| -------------- | -------- | ---------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| Webshell_h.php | PHP      | Webshell that allows to interact with OS, by sending base64 encoded payloads in "X-Authorization-Bearer" header value. | echo -n "Command" \| base64 -> curl -H "X-Authorization-Bearer: base64 Encoded command" http://target.com/Webhell_h.php |
