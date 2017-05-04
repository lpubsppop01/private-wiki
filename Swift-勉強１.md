# Swift 勉強１
```
2016/08/11
まずは XCode で様子を見てみた。教材は以下など:
http://tea-leaves.jp/swift/http://tea-leaves.jp/swift/

lazy プロパティなど C# でもあると便利なのになーという感じの機能がちらほら。
書式は scala に近い感じだがあそこまで振り切れてない、ほどよい雰囲気。
enum の case 部分はちょっとやり過ぎな感はあるが。

昔作った幾何ライブラリを移植しようと思ってたので
Framework & Library の Cocoa Framework を選択した。
これはどうやら正しいようだ。import できるのは Framework。
Extension がテストモジュールから見えないでエラーが続いていたのだが、
何かの拍子に動くようになった。
演算子定義はさすがにモジュール越しでは動作しないようだ。
Generic は本当に問題あったらしい。今は未確認。
https://github.com/pNre/ExSwift/issues/82
http://stackoverflow.com/questions/24175596/swift-framework-does-not-include-symbols-from-extensions-to-generic-structs#comment37316276_24175596

DBL_EPSILON など誤差定数が標準で定義されていて驚いた。使わないが。
http://koze.hatenablog.jp/entry/2015/06/25/230000

その他参考。

予定がないのでiOSにおけるユニットテストについてまとめる その１ - Qiita:
http://qiita.com/jumbOS5/items/3dcf051061fcf576dcd0

Swiftの通常版とオープンソース版の違いについて - Qiita:
http://qiita.com/glayash/items/a4b1b1ffef97e649395bhttp://qiita.com/glayash/items/a4b1b1ffef97e649395b
* 標準ライブラリ的なものは Foundation モジュールで提供されているらしい。

Swiftのアプリ設計時に決めることメモ - Qiita:
http://qiita.com/syou007/items/85e18a7f3555edd96946

Swiftの「エクステンション」と「プロトコル」～ 機能と役割、Objective-Cとの違いを知る (1/4)：CodeZine（コードジン）:
https://codezine.jp/article/detail/8293
    
```

------------------------------------------------------------------------

Converted from Evernote content created at 2016-08-11T23:19:54+09:00