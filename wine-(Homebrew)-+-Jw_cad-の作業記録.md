# wine (Homebrew) + Jw_cad の作業記録
```
※Homebrew のパッケージが見通しの悪い状態になっていたので、作業前に全て remove してから入れ直した。

Homebrew で wine と winetricks をインストール。
wine は 1.4.1（最新安定版）が入った。

    $ sudo brew install wine       # wine_gecko とかインストールしてたような？
    $ sudo brew install winetricks

winetricks を適当に走らせて ~/.wine を作成。

    $ winetricks list

ダウンロードした jww711.exe を wine に引数で与えて実行してインストール。

    $ wine ~/Downloads/jww711.exe

スタートメニューへの追加は失敗したが無視。
Jw_win.exe を wine に引数として与えてテスト起動。

    $ wine ~/.wine/drive_c/opt/jww/Jw_win.exe & 

この段階でも問題なく動いていそうだったが、
ターミナルに mfc42.dll がない旨が出力されていたので winetricks でインストール。

    $ winetricks mfc42

日本語も表示されているので大きな問題はなさそうだが、フォントが汚い。
後は実行用のスクリプトがほしいくらいか。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2013-06-15T00:40:29+09:00