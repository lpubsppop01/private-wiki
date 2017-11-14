# Haxe お試し
以前に [[曲線・曲面表現]] を調べたときに気になっていたが、結局そのまま触ってなかった。
- ActionScript を流れをくむ言語
- Web フロントエンド寄り（しかしその分野では TypeScript の方がいい感じ）

いろいろリンク：
- [Haxe - Wikipedia](https://ja.wikipedia.org/wiki/Haxe)
- [HaxeとOpenFLでお絵描きしてみる - kitao's blog](http://tkitao.hatenablog.com/entry/2016/04/03/221807)
- [普通のフロントエンドを書くのにHaxeをしばらく使っての所感 - タオルケット体操](http://hachibeechan.hateblo.jp/entry/2015/01/05/%E6%99%AE%E9%80%9A%E3%81%AE%E3%83%95%E3%83%AD%E3%83%B3%E3%83%88%E3%82%A8%E3%83%B3%E3%83%89%E3%82%92%E6%9B%B8%E3%81%8F%E3%81%AE%E3%81%ABHaxe%E3%82%92%E3%81%97%E3%81%B0%E3%82%89%E3%81%8F%E4%BD%BF)

---

Chocolatey にパッケージがあるのでそれをインストール。
```
Admin-PS> cinst haxe
```
何か既視感があるので一度トライしたのかも。
後は公式の C# 向けチュートリアルを参考に。
- [Targeting the C# Platform - Haxe](http://old.haxe.org/doc/targets/csharp)

特に問題なくソースと exe まで生成されたが、ソースの方は unchecked を使った強引な実装になっていた。ちょっときついかも。