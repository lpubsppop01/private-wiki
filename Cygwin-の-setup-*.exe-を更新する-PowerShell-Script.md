# Cygwin の setup-*.exe を更新する PowerShell Script
Cygwin のインストールフォルダに setup-x86_64.exe を置いてパッケージマネージャとして使っているのだけど、たまにこのインストーラ自体が古いと怒られる。
たまにならいいかーと毎度 Web サイトを訪ねて更新していたのだけど、何となく面倒になったので。

```
# UpdateSetup.ps1
Invoke-WebRequest -Uri "https://www.cygwin.com/setup-x86_64.exe" -OutFile "setup-x86_64.exe"
```