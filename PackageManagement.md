# PackageManagement
```
PackageManagement（OneGet より改称）は Windows 10 に標準で搭載されている
パッケージ管理ツール。
公式版 Chocolatey のようなもの。

---------------------------------------------------------------

あらかじめ Set-ExecutionPolicy RemoteSigned は行っておく必要あり。
とりあえず Chocolaty のリポジトリを参照するようにする。
---
> Get-PackageProvider Chocolaty
---

パッケージの検索・インストール・アンインストールは以下。
---
> Find-Package Firefox
> Install-Package Firefox
> Uninstall-Package Firefox
---

Firefox は日本語版 x64 がインストールされたが
Dropbox はどうなったのか一見わからない。
-> ダウンロードだけしてインストーラが動かない模様。
   インストールスクリプトで特殊なことをしているものはダメなんじゃないかと。
   まだ実用段階ではなさそうだ。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2016-05-21T17:40:18+09:00