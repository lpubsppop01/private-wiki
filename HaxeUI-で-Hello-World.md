# HaxeUI で Hello World
以下を参考に：
- [Getting Started · ianharrigan/haxeui Wiki](https://github.com/ianharrigan/haxeui/wiki/Getting-Started)
- [Hello World Example · ianharrigan/haxeui Wiki](https://github.com/ianharrigan/haxeui/wiki/Hello-World-Example)

HaxeUI は OpenFL で描画する仕組みだそうで、本体以外にもいくつかインストールしておく必要があるらしい。
```
> haxelib install haxeui
> haxelib install openfl
> haxelib install nme # これ要らないのかも
> haxelib run openfl setup
```
数分では済まないくらいには時間がかかている。
そして結局だめだった。Toolkit クラスが見つからないとか。

---

どうも haxelib で入るのは 1 系で OpenFL の要求バージョンが古いらしい。
- [cannot use haxeui - Google グループ](https://groups.google.com/forum/#!topic/haxelang/pBCoUhGDvfY)
- [haxeui/haxeui-core: The core library of the HaxeUI framework -](https://github.com/haxeui/haxeui-core)

多少の手直しは必要だったが FlashDevelop の OpenFL プロジェクトテンプレートに上記の hello_world に含まれる Main.hx と main.xml、snippet.xml を混ぜて動作を確認した。
html5、flash、windows の３つで動作を確認。
windows 構成だと exe を生成できたが、どうも OpenFL に関係するモジュールも一通りコンパイルしたらしく時間がかかった（たぶん10分くらい）。
全部表示がぼやけた感じだったのが気になったが、これは DPI 大きめのノートで作業していたからかもしれない。

IME は flash のみ問題ない。windows は IME 入力を確定すると謎の空白が入力された。html5 は入力した文字が 2 個追加された。
残念ながらこれでは使えないか。あっさり複数のプラットホームで動作したのはよかったけど。