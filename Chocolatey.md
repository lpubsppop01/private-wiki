# Chocolatey
```
Chocolatey は Windows 環境用のパッケージ管理ツール。
apt-get や yum のようなもの。
PackageManagement がまだまだ安定しないようだったので定番のこちらを試してみる。

---------------------------------------------------------------

インストールは管理者権限の cmd にて以下を実行（本家サイトからコピペ）。
---
> @powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
---

2016/05/21 時点だとインストール先は c:\ProgramData\chocolatey となる。
ProgramData 自体が隠しフォルダなので見ようとしないと見えない。

パッケージのインストールは以下のようにするが、管理者権限を要する。この辺は apt-get と同じ感じ。
---
> choco install firefox
> choco install evernote
> choco install dropbox
> choco install flashplayerplugin # これは NPAPI 版で ActiveX 版と PPAPI 版もある
---
こちらの Dropbox は問題なくインストールされた。
また PackageManagement のときは結局インストーラのダイアログが出ていたのだが
こちらはない。
Dropbox はログインがあるためそこだけ表示されたが、あとはすべてスクリプトで完結する。

ビデオカードのドライバまで最新版があった。調子に乗って試してみた。
---
> choco install geforce-game-ready-driver
---
何も問題なく成功した。この安定感はすばらしい。

後はインストールしたものをメモしておくことにする。
というか xml ファイルに書いておくと復元できるんだったか？
---
k-litecodecpackmega
AdobeAIR # 更新が止まっているから手動の方がいい
VisualStudio2015Community # 大きすぎるしVerUPに追いついてないから手動がいい
Emacs # IME パッチが当たってないので常用は厳しい
---
```

------------------------------------------------------------------------

Converted from Evernote content created at 2016-05-21T20:04:59+09:00