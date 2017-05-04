# a2ps
```
テキストファイルを PDF 化するのに a2ps + ps2pdf でやりたいなーと思って調べたメモ。

大学のとき共用の Solaris 環境で使っていた a2ps はおそらく perl 版。
よく知らずに使っていたが歌代さんという方が作成されたとのことで歌代版とも。
古いものだからか公式の配布元がどこかはっきりしないが、少なくとも以下から入手可能。
ftp://ftp.sra.co.jp/pub/lang/perl/scripts/utashiro-scripts/

そのままでは難があるので以下を修正:
* /usr/local/bin/perl を使うようになってるので /usr/bin/perl 辺りに変更。
* 実行すると "$# is no longer supported at /usr/local/bin/a2ps.pl line 195." という
  メッセージが表示される。
  通常使用には影響ないらしいのでコメントアウト。
  http://markmail.org/message/pawghgg577x2txvp

実行してファイルにリダイレクトしようとすると
"Legacy library flush.pl will be removed from the Perl core distribution in the next major release. Please install it from the CPAN distribution Perl4::CoreLibs."
とメッセージ。
cpan はすでにインストールされていたのでそちらからインストール:
---
$ cpan
cpan[1]> install Perl4::CoreLibs
---

~/.bashrc に以下を追記（自動で追記される内容では不十分なので消して以下を使用）:
---
eval $(perl -I ~/perl5/lib/perl5 -Mlocal::lib)
---
PERL5LIBなどの環境変数をセットするワンライナー - 麹町で働くWebエンジニアのメモ帳:
http://togattti.hateblo.jp/entry/2014/02/26/071016

まだエラーメッセージは表示されるがもう知らない。
出力結果を Acrobat Distiller で pdf に変換して表示されることを確認した。
日本語フォントは埋め込まれずに Ryumin-Light になっていた。

---

Acrobat Distiller は自宅のメインマシンでしか使えない。
Cygwin 環境で ps2pdf を動かす元気がなくなったので GSView を動かしてみた。

Ghostscript 9.15 and GSview 5.0 J (Official Site):
http://www.khotta.org/ghost/

インストール含めて非常にスムーズ。
gsprint.exe はいきなりプリンタに投げそうな雰囲気だったので素直に gsview を使う方がよさそう。

こんなところかな。
-> スクリプト化するなら gswin32c.exe の方でいけるみたい。

---

上記の perl 版 a2ps だとラベル（ファイル名）に日本語が入った時正しく出力されないようだ。
改変で行けるか試してみる。

出力された ps ファイルをいじって分かった点:
* printheader と printfooter の "fname show" がヘッダー・フッターのファイル名を出力している箇所。
* 日本語を含む文字列は show では出力できない。
  本文中の日本語は ks で出力されている（本文中の ASCII 文字は s で出力されている）。
* ks や kfontarray の登場箇所を見ると、fonttype に 0 開始のインデックスが入っており
  予め用意されたフォント配列からインデックスに応じたフォントが得られるようになっている。
* R、B、I は fonttype を利用した書体の切り替えを行う。
* 以上を踏まえて、日本語文字列をゴシック体でヘッダー・フッターに表示できることは確認した。
  ファイル名用の日本語フォント関連の変数（バインディングというべき？）を設けて、
  ファイル名用の ks を作成。

次はソースの方:
* perl きつい…。
* np() で出力している $label を本文と同様に処理すればよいはず。
  英文と和文が分けて処理されているということは、引数がコレクションになる…。
  辞書の配列が妥当か。一応動きそうだ。
* 末尾付近のテンプレート文字列を上記 ps ファイルの感じで編集すればいけるはず。
* まじ perl きつい…。デフォルト変数があると何やってるかわかりにくい…。

---

一旦やめて、変換を介さない単純な方法を検討してみる。
http://d.hatena.ne.jp/sirocco/20120821/1345554887
上記に倣って filenamefontname と footerfont の /Helvetica-Bold を /GothicBBB-Medium-EUC-H に変更。
-> 成功。アルファベット部分も GothicBBB になるので不格好だが、まぁあり。
   ただし body の方の Ryumin-Light と GothicBBB-Medium はそのままにしておかないと
   逆に文字化けする。あちらは EUC-JP ではないので。

このくらいの変更なら a2ps.pl 側の変更も容易なので、これで対応しておく。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2015-02-05T21:17:33+09:00