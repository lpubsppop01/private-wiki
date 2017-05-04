# Node.js でテキストファイル・標準入力読込
```
いろいろ方法はあるが１行単位なら readline を使うのが簡単なようだ。

Node.js でファイルを一行ずつ読み込む - すぱぶろ:
http://superbrothers.hatenablog.com/entry/2012/12/11/003310

標準入力（特にパイプ）についても同様だが、
close イベントが取れないから process.stdin の end イベントで代用する。
今日確認した v6.2.2 でも直っていなかったのでたぶんこのままだろう。

Node.jsの標準入力と - Qiita:
http://qiita.com/hiroqn@github/items/c927bc97780c34eda562
```

------------------------------------------------------------------------

Converted from Evernote content created at 2016-07-02T21:34:29+09:00