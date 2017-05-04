# JavaScript で日本語全文検索（調査）
```
単一インデックスを普通にロードする方式。
デモはどれも好印象だが、インデックスが巨大になると問題が出てくる。
どれも10年以上前とは思えない洗練度合なのが心に来る。

Hugo に全文検索を取り付けた | the right stuff:
http://rs.luminousspice.com/hugo-site-search/

最速インターフェース研究会 :: JavaScriptにBlogの全文検索をやらせてみる:
http://la.ma.la/blog/diary_200506252348.htmhttp://la.ma.la/blog/diary_200506252348.htm

ホの字５ - 更新案内メモ - 超高速全文検索を作ってみた:
http://hon5.com/up2date/200507061029.phphttp://hon5.com/up2date/200507061029.phphttp://hon5.com/up2date/200507061029.php

インデックスを部分的にダウンロードする方式。
デモはもう見れないみたい。     

JavaScriptによる全文検索エンジン - llameradaの日記:
http://d.hatena.ne.jp/llamerada/20070123/1169566034http://d.hatena.ne.jp/llamerada/20070123/1169566034http://d.hatena.ne.jp/llamerada/20070123/1169566034

これもう自作するしかないかなと思い始めてまず N-gram。

第5回 N-gramのしくみ：検索エンジンを作る｜gihyo.jp … 技術評論社:
http://gihyo.jp/dev/serial/01/make-findspot/0005?page=2http://gihyo.jp/dev/serial/01/make-findspot/0005?page=2http://gihyo.jp/dev/serial/01/make-findspot/0005?page=2

参考にして一応 node.js で動作するインデックス生成器はできた。
ただ文字種の限定とか考えるとまだ実用段階ではない。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2016-07-02T20:52:48+09:00