# Fullproof
```
Fullproof は JavaScript で実装された全文検索エンジン。
とりあえず日本語がいけるのか試したい。何となく無理っぽい気がするが…。

* bower からのインストールはこけた（Repository not found 的なメッセージだったので
  たぶんメンテされてない）ため、
  単にサイトからアーカイブをダウンロードしてきた。
* 添付されていた animals の data.csv の一部を日本語混じりの行にし、utf-8-dos で保存して試した。
  完全一致だとヒットするが、部分一致ではヒットせず。
  この挙動は英単語でも同様のようだ。どうもスペース区切りで見てる？
  ドキュメントにて
  > the BooleanEngine: works by intersecting result sets,
  > which means it only shows the results that match all the tokens from the query.
  とあるから、おそらく BooleanEngine ではこうなるのが正解なのだろう。

* Web サーバーは立てずにローカルファイルをブラウザで開く形で動かしていたのだが、
  Firefox では動いたが IE、Chrome では動かなかった。
  おそらくローカルリソースにアクセスする辺りで引っかかるのだろう。

動くけどいまいち期待したのと違う、という感じ。
望んでいるは N-gram みたいな言語に依存しないタイプのものな気がする。

---

https://reyesr.github.io/fullproof/
```

------------------------------------------------------------------------

Converted from Evernote content created at 2016-06-27T20:43:03+09:00