# Haxe 開発環境
例によって VS Code を使うつもり。
使用する拡張：
- [Haxe - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=nadako.vshaxe)
- [Haxe Debug - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=vshaxe.haxe-debug)
    - 準備が必要だけど説明はしっかりしている
    - Flash のデバッガーが exe を直にダウンロードなのにちょっとびっくりした
    - Java は Chocolatey で jdk9 をインストール
    - 単純な trace を置いただけの main ではブレークできなかった
- [jcward/vscode-hxcpp-debug: VSC debug adapter for Haxe hxcpp runtime](https://github.com/jcward/vscode-hxcpp-debug)
    - C++ 版だけど日付を見るに開発停止してそう
- [Manual - Haxe - The Cross-platform Toolkit](https://haxe.org/manual/std-unit-testing.html)
    - 標準ライブラリに含まれている単体テストフレームワーク
    - この感じだとデバッガとの組み合わせも簡単そう