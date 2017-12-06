# FlashDevelop プラグインの作り方
FlashDevelop のプラグインの作り方調査。目標は Emacs ライクキーバインドを実装できる程度。
- 参考リンク
  - [Plugin Development - FlashDevelop](http://www.flashdevelop.org/wikidocs/index.php?title=Plugin_Development)
  - [ianharrigan/HaxeUILayoutPreview: FlashDevelop plugin to enable previewing and live editing of HaxeUI xml layouts](https://github.com/ianharrigan/HaxeUILayoutPreview)
  - [gamedevsam/PerforcePlugin: FlashDevelop Perforce Plugin](https://github.com/gamedevsam/PerforcePlugin)
- FlashDevelop.exe と同じフォルダにある PluginCore.dll という .NET DLL をリンクする。
  - ILSpy で中を見るといろいろ詰め込まれている中に ScintillaNet というのがある。
  - ScintillaNet.ScintillaControl がエディタっぽい。有名らしい。
  - これのインスタンスを取得できればいい？UITools.Manager.OnTextChanged の引数に普通にある。あまりラップされている感じではない。
  - UITools の HandleKeys() に `PluginBase.MainForm.CallCommand("InsertSnippet", "null");` という呼び出しがある。コマンドはこう呼びだされる？
  - いやひょっとしてコマンド云々はあまり関係なくて、`EventType.Keys` を捕まえればそれでいいのか？
    - UITools 自体もプラグインと同じレベルでイベントを拾っているっぽい。
    - プラグインは EventManager.eventObjectsSnapshot 配列に入ってる？直ではないかもだけど。
  - 方針は IPlugin を実装したプラグイン実装クラスに HandleEvent メソッドを設けてキーイベントを拾う、でよさそう。しかしデバッグ実行がやりづらそう。一応止まるけどコードとの対応付けができてないっぽい。