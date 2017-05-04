# プロキシ環境で Chocolatey
```
プロキシ環境での Chocolatey インストール・運用設定。
まだ試してない。

## インストール
環境変数を設定してからインストールスクリプトを実行。
-> これはだめだったので下の方に書いたリンク先のスクリプトを使った。
---
PS> $env:chocolateyProxyLocation = 'https://local/proxy/server'
PS> $env:chocolateyProxyUser = 'username'
PS> $env:chocolateyProxyPassword = 'password'
PS> iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
---

## 運用設定
---
PS> choco config set proxy <locationandport>
PS> choco config set proxyUser <username>
PS> choco config set proxyPassword <passwordThatGetsEncryptedInFile>
---

---------------------------------------------------------------

Chocolatey - Installation:
https://chocolatey.org/install

Proxy Settings for Chocolatey · chocolatey/choco Wiki · GitHub:
https://github.com/chocolatey/choco/wiki/Proxy-Settings-for-Chocolatey

---------------------------------------------------------------

上の手段でインストールできない場合は以下を試す。

NTLM認証Proxy環境下でのChocolateyのインストール
https://opcdiary.net/?p=30332
```

------------------------------------------------------------------------

Converted from Evernote content created at 2016-07-07T22:45:36+09:00