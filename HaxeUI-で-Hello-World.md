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
そして結局だめだった。

---

どうも haxelib で入るのは 1 系で OpenFL の要求バージョンが古いらしい。
- [cannot use haxeui - Google グループ](https://groups.google.com/forum/#!topic/haxelang/pBCoUhGDvfY)
- [haxeui/haxeui-core: The core library of the HaxeUI framework -](https://github.com/haxeui/haxeui-core)