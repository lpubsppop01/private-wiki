# emacs-w32
```
[2013-03-12 23:18] 

何時の間にか emacs-w32 24.2.93 というのが Cygwin インストーラで入れられるようになっていた。
たぶん mno-cygwin をつけずにビルドしたもの？

------------------------------------------------------------------------

依存関係の設定や後処理スクリプトなどがまずいようでいろいろ怒られたが、対処したら起動した。
* 依存関係は png やら jpg やら画像関係が多かった。先に emacs と emacs-x11 を入れておけばたぶんすんなりいった？
* /usr/lib/emacs/24.2.93 と /usr/share/emacs/24.2.93 がないので
  同じディレクトリの 24.2 を指すよう Cygwin スタイルのシンボリックリンクを貼る。
* gnutls でエラー。
  ---
  $ emacs-w32.exe
        0 [main] emacs-w32 5032 child_info_fork::abort: D:\opt\cygwin\bin\cyggnutls-28.dll: Loaded to different address: parent(0x14C0000) != child(0x1640000)
  $ emacs-w32.exe --debug-init
        1 [main] emacs-w32 220 child_info_fork::abort: D:\opt\cygwin\bin\cyggnutls-28.dll: Loaded to different address: parent(0x1690000) != child(0x14C0000)
  ---
  Cygwin 関連を全て終了して管理者権限で実行した Cygwin Terminal から rebaseall を実行。
  rebaseall が必要な状況は割りとあるらしいのだが、初めて遭遇した。
  <http://asm.at.webry.info/theme/b612986ab9.html>

------------------------------------------------------------------------

とりあえず NTEmacs 24 前提の init.el を適当に削って運用。
気づいたところ：

* w32-ime の設定でこける。IME でインライン入力はできる。

* XKeymacs がなぜか emacs-w32 を認識せずに標準設定を適用する。

* migemo がなぜか動かない（cmigemo バイナリは見つかっているっぽい）。

* アイコンが設定されてない。

* Windows から普通に実行すると DOS 窓が表示される。

------------------------------------------------------------------------

XKeymacs については emacs-w32 ではなく
"Google 日本語入力 IMM32 モジュール (GIMEJAIME)" を指定したら効いた。
Google 日本語入力で常に効かなくなったがまぁよし。

Cygwin 端末以外からの起動は ck.exe みたいに WSH/JScript から実行すれば OK。

------------------------------------------------------------------------

migemo は情報あった。

[http://webcache.googleusercontent.com/search?q=cache:MZKFGpdYBxoJ:i.cmaas.net/pc/Unix/1356319580+&cd=7&hl=ja&ct=clnk&gl=jp](http://webcache.googleusercontent.com/search?q=cache:MZKFGpdYBxoJ:i.cmaas.net/pc/Unix/1356319580+&amp;cd=7&amp;hl=ja&amp;ct=clnk&amp;gl=jp):
-----
214 ： 名無しさん＠お腹いっぱい。： ：2013/01/21(月) 02:21:16.34
    Emacs HEAD に、久々にMigemoを入れたんだけど
    うまく動かない。

    init.el は
    (setq migemo-command "cmigemo")
    (setq migemo-options '("-q" "--emacs" "-i" "\a"))
    (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
    (setq migemo-user-dictionary nil)
    (setq migemo-regex-dictionary nil)
    (setq migemo-use-pattern-alist t)
    (setq migemo-use-frequent-pattern-alist t)
    (setq migemo-pattern-alist-length 1000)
    (setq migemo-coding-system 'utf-8-unix)
    で、"j" と打つと「辞」とかの漢字はすべてハイライト
    されるから、辞書はうまく使えてると思うけどカーソルはなぜか
    アルファベットのところしか飛ばない。

    同じ現象に合っている人いません？
216 ： 名無しさん＠お腹いっぱい。： sage：2013/01/21(月) 05:34:33.11
    >>214
    Emacs24.3 の PRETEST を試したら俺もそうなった．
    一致している正規表現はハイライトされていたので，
    isearch の方になんか変更があったんではないかと思ってる．
    なんか解決策ないものか．
220 ： 名無しさん＠お腹いっぱい。： sage：2013/01/21(月) 17:18:31.17
    オリジナルのmigemoにいろいろ手を加えたものがgithubにありました．
    https://github.com/Hideyuki-SHIRAI/migemo-for-ruby1.9
    作者のtwitter曰く，24.3にも対応しているそうです．
    こちらで試してみてはいかがでしょうか．
223 ： 名無しさん＠お腹いっぱい。： ：2013/01/21(月) 21:25:23.69
    >>220
    おー、Emacs23.3.50＆cmigemoでも問題なく動いた。

    とはいえ、せっかく github に上げてくれたのだったら、
    少しは先頭コメントを変えて欲しかった。中身はいろいろ変えてあるけど
    先頭はバージョン1.7のまま（一応最新は1.8ということになってる）ので、
    知らない人は混乱するだろうし。
-----

記載通り改変版で改善した。

------------------------------------------------------------------------

上記では 29.2.93 だったが 29.3 に更新された。
バージョンが揃い後処理も行われるようになったため、手作業は不要になった。
アイコンもセットされている。

------------------------------------------------------------------------

/etc/fstab で ACL を無効化していると
emacs-server で /tmp/emacs${UID} ディレクトリが unsafe とか怒られる。
/tmp だけ有効にしておく。
[NTFS ACL を無効化](evernote:///view/6108060/s55/3d4e78fd-5e77-4bb2-ae5b-55927fd3ef5e/3d4e78fd-5e77-4bb2-ae5b-55927fd3ef5e/)
```

------------------------------------------------------------------------

Converted from Evernote content created at 2013-03-17T18:02:15+09:00