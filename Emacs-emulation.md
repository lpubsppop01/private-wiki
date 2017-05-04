# Emacs emulation
```
Emacs emulation:
http://visualstudiogallery.msdn.microsoft.com/09dc58c4-6f47-413a-9176-742be7463f92

Visual Studio 2010 で Emacs スキームを利用できるエクステンション。
いろいろと妙な動きや制限があるがだいたい運用で回避できる。
詳しくは以下を参照。
[Visual Studio 2010のキーバインド設定](evernote:///view/6108060/s55/90a977e3-e851-4fec-b7b5-5a31ac54e84c/90a977e3-e851-4fec-b7b5-5a31ac54e84c/)

------------------------------------------------------------------------

Visual Studio 2012 でも引き続き Emacs スキームは標準添付されず、
かつ上記の Emacs emulation の 2012 版は提供されていない。
しかし、vsik ファイルを zip 展開して内容を改変することで 2012 でも利用可能。

実際試したところ、リンク先説明にあるように Emacs.vsk を
C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE にコピーする必要があった。

Emacs Keybindings in Visual Studio 2012 - Stack Overflow:
http://stackoverflow.com/questions/13884953/emacs-keybindings-in-visual-studio-2012/14087731#14087731

------------------------------------------------------------------------

2016/07/16
先日知ったのだが github でソースが公開されている。
https://github.com/zbrad/EmacsKeys
最新のソースをVS2015でビルドして動作を確認したところ、
OSのクリップボードとの連携問題が解消しているような気配。
kill-line 後に yank 可能になるまでの間がやや引っかかるが、他はスムーズな感じ。
https://www.dropbox.com/sh/3glln1cxumub6rw/AAAP0KdB5SDZCj8x40AJHMupa?dl=0

2016/07/17
kill-line 後に yank が可能になるまでに間がある件を調査。
kill-region などは ClipboardRing（kill-ring に相当）への追加＋標準コマンドの呼び出しで実装されている。
kill-line のような Emacs 特有の挙動をするコマンドはコマンド実行（Command.Execute(...)）の中ではなく
後でフラッシュ（ITextViewExtensions.FlushKillString(...)）が実行される。
さらに kill 系コマンド（IsKillCommand フラグオン）の場合はバッファリングが行われるため即座にはフラッシュされない。
このおかげで複数行連続で kill-line したときにまとめてクリップボードに入るようになる、はず。
kill 系でないコマンドを実行（Ctrl-g くらいでいい）するとフラッシュされるため運用で回避できる。
しかしせっかくソースをいじれるので PasteCommand の場合は Execute 前にフラッシュするようにしてみた。
今のところいい感じ。
上記のバイナリはこの私家版に置き換えておく。

2016/08/28
前回作ったバイナリは VS2013 では動作しなかったため、VS2013 でビルドし直した。
今回のバイナリで VS2015 もカバーできるはずだが一応前回分も残しておく。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2013-04-10T22:31:54+09:00