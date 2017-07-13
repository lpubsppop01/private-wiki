# Windows Subsystem for Linux
今更ながら Windows Subsystem for Linux をインストール。
- [Windows Update の設定]-[開発者向け] で [開発者モード] にする。
- [Windows の機能の有効化または無効化] で [Windows Subsystem for Linux (Beta)] をオン。
- 再起動。
- コマンドを指定して実行などで "bash" を実行。
Ubuntu のインストールが行われる。ユーザー毎らしい。
- スタートメニューに "Bash on Ubuntu on Windows" が追加されているのでここから起動。

参考リンク：
- [Installation Guide | MSDN](https://msdn.microsoft.com/ja-jp/commandline/wsl/install_guide)
- [Windows 10 The Latest：Windows 10でUbuntuのシェル「Bash」が動き始める！ だが日本語はどうなる？ (1/2) - ＠IT](http://www.atmarkit.co.jp/ait/articles/1604/11/news031.html)

---

2017/07/13
Windows 上での Python があまりに扱いづらいので実用を目指してまた使ってみる。
X 動かせば GUI もいけるらしい。
- ロケールが日本語だと化けるため `sudo update-locale LANG=en_US.UTF8` で英語に変更。
- Windows 用の X サーバとしては VcXsrv というのが流行りらしい。Chocolatey にパッケージもあり。
- `sudo: unable to resolve host` は `/etc/hosts` に追記で改善する。
- X で端末を表示。あっさり動いた。
    - Windows 側で `cinst vcxsrv`
    - `apt-get install fluxbox mlterm`
        - fluxbox は不要だった。どうも VcXsrv だけで Windows のウィンドウマネージャと統合した動きになっている。
    - `export DISPLAY=localhost:0.0`
        - `~/.bashrc` に追記しておく。
    - `mlterm &`
- VS Code をインストールしてみたが画面に表示されず。Electron がまだ NG らしい。
    - [LinuxでVisual Studio Codeを起動する | VS Code Docs](https://vscode-doc-jp.github.io/docs/setup/linux.html)
    - 起動時のエラーメッセージに従い `libx11-xcb1` と `libxss` をインストールしたが結局無言で終了するようになった

------------------------------------------------------------------------

Converted from Evernote content created at 2016-08-17T22:25:27+09:00