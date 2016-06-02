# How to get hostname

```bash
uname -n
```

# How to browse

```bash
dns-sd -B _ssh
```

- DNSServiceBrowse API is called internally.

## Get Info from Instance Name

```bash
dns-sd -L "僕のMac" _ssh
```

- DNSServiceResolve API is called internally.

# Header file

- /usr/include/dns_sd.h

