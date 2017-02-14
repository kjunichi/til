# wget

```ps1
(new-object System.Net.WebClient).Downloadfile("http://host/path", "c:\hoge.txt")
```
# モジュールを扱う

所定のフォルダに格納していれば、スクリプト名のみでロードできた。

```ps1
import-module hoge.psm1
```

## Add-Type -AssemblyName System.Speechの意味

アセンブリをロードする命令らしい。VBScriptでどうとうの処理は出来るのか？

# Link

- [OS X `say` command for Windows - Super User](http://superuser.com/questions/223913/os-x-say-command-for-windows)
