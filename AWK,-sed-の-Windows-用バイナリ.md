# AWK, sed の Windows 用バイナリ
2 番目リンク先の gawk に UTF-8 で流せば問題なく動作するっぽい。
- [corbieのブログ:Windows版gawk選び](http://blog.livedoor.jp/corbie/archives/3924154.html)
- [www.klabaster.com - Freeware Downloads](http://www.klabaster.com/freeware.htm)

---

日本語 sed。
- [GNU sed をWindowsで使う - Wiki 小さなそして広がっていく世界](http://ac206223.ppp.asahi-net.or.jp/adiary/memo/adiary.cgi/hirosugu/GNU%20sed%20%E3%82%92Windows%E3%81%A7%E4%BD%BF%E3%81%86)

日本語は未確認だけどとりあえず動作した。→UTF8でもOKだったが、エラーメッセージはSJISで出ているのでそちらがよさそう。
やはり Cygwin 版よりだいぶ軽い。4.3 以降はもっとはやいらしいんだけどバイナリが見つからない。

上記の実装だとなぜだか「端」という感じがパターンに含まれているとき動作しなかった。
gnuwin32 の方を試したら utf-8 で動作したためそちらの方がいいかも。下記のバイナリを全部同じフォルダに展開すれば OK。
- [sed for Windows](http://gnuwin32.sourceforge.net/packages/sed.htm)
    - [LibIconv for Windows](http://gnuwin32.sourceforge.net/packages/libiconv.htm)
    - [LibIntl for Windows](http://gnuwin32.sourceforge.net/packages/libintl.htm)
    - [Regex for Windows](http://gnuwin32.sourceforge.net/packages/regex.htm)

------------------------------------------------------------------------

Converted from Evernote content created at 2017-04-13T22:07:28+09:00