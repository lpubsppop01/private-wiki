# JavaScriptでバイナリデータ
```
Cライクな言語で言うところの unsigned char 配列みたいなことをやる方法。

型付き配列（Typed Arrays）か DataView を使用する。
前者は高速だがネイティブのバイトオーダーがそのまま影響する。
後者の方はその辺りが使いやすくなっているが、いくらか低速であるらしい。

string については Blob（File のベースクラス）のコンストラクタに渡すと
UTF-8 になるのを利用した方が扱いやすい。

---

javascriptでバイナリを扱うために - Qiita:
http://qiita.com/yaegaki/items/909587a2dae20467c74a

DataView - JavaScript | MDN:
https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/DataView

文字列をUTF-8のArrayBufferに変換 - Qiita:
http://qiita.com/ukyo/items/1626defd020b2157e6bf
```

------------------------------------------------------------------------

Converted from Evernote content created at 2017-01-14T10:56:27+09:00