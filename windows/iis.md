# Add an Exception to Your Proxy Settings

```xml
<system.net>
  <defaultProxy>
    <proxy usesystemdefault="false" proxyaddress="http://192.168.0.1:8080" bypassonlocal="true" />
    <bypasslist>
      <add address="hostname.local.lan" />
      <add address="192.168.1.11" />
    </bypasslist>
  </defaultProxy>
</system.net>
```
