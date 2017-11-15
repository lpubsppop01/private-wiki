# Haxe 開発環境
例によって VS Code を使うつもり。
- [Haxe - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=nadako.vshaxe)
- [Haxe Debug - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=vshaxe.haxe-debug)
    - 準備が必要だけど説明はしっかりしている
    - Flash のデバッガーが exe を直にダウンロードなのにちょっとびっくりした
    - Java は Chocolatey で jdk9 をインストール
    - 単純な trace を置いただけの main ではブレークできなかった
- [jcward/vscode-hxcpp-debug: VSC debug adapter for Haxe hxcpp runtime](https://github.com/jcward/vscode-hxcpp-debug)
    - C++ 版だけど日付を見るに開発停止してそう
- [Unit testing](https://haxe.org/manual/std-unit-testing.html)
    - 標準ライブラリにシンプルな単体テストフレームワークが含まれている
    - この感じだとデバッガとの組み合わせも簡単そう