# Mono XWT  で Hello World
vs2017 on win10pro にてあれこれ。
- [mono/xwt: A cross-platform UI toolkit for creating desktop applications with .NET and Mono](https://github.com/mono/xwt)
- NuGet から Xwt.WPF を追加
    - Xwt.Gtk3 も動作確認したが、別途 gtk-sharp をインストールして libgobject-2.0-0.dll などを出力フォルダにコピーしないとだめだった
- サイトにあるサンプルコードはそのままだとウィンドウを閉じてもプロセスが終わらない
    - `mainWindow.Closed` で `Application.Exit()` を呼べば OK
- mono の xbuild でもビルドできたが実行は OutOfMemoryException でだめ

Eto も試してよさそうな感じだったのだけど、拡張が vs2015 で止まっているのが気になった。