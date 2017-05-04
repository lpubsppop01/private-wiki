# Makefile for Swift
```
ネイティブコンパイル言語なら Makefile でやれないか？と思ったら普通にヒットした。

Swiftで分割コンパイル - Qiita:
http://qiita.com/satoshia/items/c338bf2a51df78b559e1

swiftc は swift を呼び出すフロントエンド？のようだ。
swift コマンドの方をビルドにも使えば問題ない。

依存関係のチェックが動かない…。
おそらく一回ビルド通ってから見る想定で、なぜか main を要求されてエラーっている。

3.0 が出るまでは Silver で遊んでいよう。
これ進まなすぎてだめだ。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2016-08-20T19:01:43+09:00