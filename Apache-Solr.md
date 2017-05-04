# Apache Solr
```
LAN 内向けにテキスト検索ページを提供したくて有名所らしい Apache Solr（ソーラー）をお試し。
検索エンジン部分が Apache Lucene（ルシーン）で
Solr は Lucene をコアとして管理画面などを盛り込んだ検索プラットフォームという感じ。
ここでは主に Windows 環境でのセットアップについてメモ。

Apache Solr:
http://lucene.apache.org/solr/http://lucene.apache.org/solr/

Apache Lucene:
https://lucene.apache.org/core/https://lucene.apache.org/core/

---

公式サイトの Download Binary 辺りのリンク経由で solr-5.3.1.tgz をダウンロード。
---
$ tar zxvf solr-5.3.1.tgz
$ cd solr-5.3.1/server
$ java -jar server.jar --module=http
---
で Jetty が起動する。
（Apache + Tomcat でももちろん動くらしいがとりあえず考えないでおこう。）
http://localhost:8983/solr/ をブラウザで開くと管理画面が表示される。

Solr は複数のデータベースを持つことができ、その管理単位を Core と呼ぶ。
管理画面にも表示されている通り初期状態だと Core がないため、
ひとつは追加する必要がある。たぶん。

lucene - How to create new core in Solr 5? - Stack Overflow:
http://stackoverflow.com/questions/29070505/how-to-create-new-core-in-solr-5http://stackoverflow.com/questions/29070505/how-to-create-new-core-in-solr-5

5 系では bin/solr で Core を追加するようになっているらしい。
-> JAVA_HOME の設定がよろしくないらしく怒られた。
   んー。JVM がたくさん入っててよくわからん…。一度掃除した方がいいのか。
    -> 1.8 系を使うように修正したら動いた。
-> ひょっとしてサーバーの起動もこっちでできるっぽい？

---
$ cd solr-5.3.1/server
$ ../bin/solr create -c test_core -p 8983
---

最終的にはクエリを投げているらしく URL を含むログが出力される。

todo: インデックスにファイルを追加
```

------------------------------------------------------------------------

Converted from Evernote content created at 2015-11-03T17:48:24+09:00