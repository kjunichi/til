# access to self-signed ssl site

```vb
Set oXMLHTTP = CreateObject("Msxml2.ServerXMLHTTP")
oXMLHTTP.open "POST", strURL, False, user, passwd
oXMLHTTP.setOption 2, 13056
oXMLHTTP.send contents
```

- using Msxml2.ServerXMLHTTP
- Msxml2.ServerXMLHTTP#setOption 2, 13056
