# Haxe 開発環境
例によって VS Code を使うつもり。
- [Haxe - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=nadako.vshaxe)
- [Haxe Debug - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=vshaxe.haxe-debug)
    - 準備が必要だけど説明はしっかりしている
    - Flash のデバッガーが exe を直にダウンロードなのにちょっとびっくりした
    - Java は Chocolatey で jdk9 をインストール
    - queueSend が定義されてないとかのエラーでブレークできなかった
- [jcward/vscode-hxcpp-debug: VSC debug adapter for Haxe hxcpp runtime](https://github.com/jcward/vscode-hxcpp-debug)
    - C++ 版だけど日付を見るに開発停止してそう
    - サンプルの "test cli" をコピーして正常動作を確認した
    - C++ 版は初回ビルド時間が長いが、プロジェクト内のファイルを編集しただけなら 2 回目以降は速い
- [Unit testing](https://haxe.org/manual/std-unit-testing.html)
    - 標準ライブラリにシンプルな単体テストフレームワークが含まれている
    - この感じだとデバッガとの組み合わせも簡単そう

---

しばらく VS Code で howm-parser を使ってみたが難が大きい。
- rename がローカル変数名くらいしか効かない
- C++ デバッガが高頻度でアタッチに失敗する（プロトタイプ段階みたいだから仕方ないが）


FlashDevelop がかなりよくできているらしい（実際プロジェクト内の rename はちゃんと効いた）。
SDK のパッケージ管理が Chocolatey と競合しそうなのが少し残念だけど、移行を考え中。

---

FlashDevelop は本家からインストーラか zip アーカイブをダウンロード。
- Chocolatey の FlashDevelop はパッケージが古いままになっている。
- Java は Haxe でも必要なときがあるので JRE 8 x86 をインストール（JRE 9 には x64 しかない）。
    - `JAVA_HOME` を　x86 の方に通しておく。
- Japanese も選べるが English にしてみた。
- Chocolatey の Haxe は検出されない。おとなしく FlashDevelop からもインストール。
- 5.3 系は Flash デバッガが動作しない。（[jni4net のバグ？](https://github.com/fdorg/flashdevelop/issues/1787)）
    - 直るまでに時間がかかる感じ？この分だとインストーラより zip で過去バージョンを残しながら使った方がいい。
- 5.2 系なら Flash デバッガが動くが、結構ふらふらした感じなので試行錯誤するための前提知識は必要。とはいえ VS Code ほど不安定ではない。
    - [この操作に対して指定されたファイルには、アプリケーションが関連付けられていません。｜四十にして惑わない為に三十にして立ってみる。](https://ameblo.jp/yoshimoto-eiji/entry-10443552983.html)