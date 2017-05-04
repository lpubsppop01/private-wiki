# Visual Studio Extension メニューコマンドのテキストを動的に変更
```
vsct ファイルの CommandFlag で TextChanges を指定し、
Package.Initialize() などで OleMenuCommand.Text を変更すれば OK。

合わせて DefaultInvisible と  DynamicVisibility を指定しておくことで
MenuCommandService.AddCommand() するまでは非表示にしておける。
これを起動時に行うようにすればシリアライズされた設定情報に基づいてメニュー項目名を設定できたりする。
[Visual Studio Extension Package.Initialize() が VS 開始時に呼ばれるようにする](evernote:///view/6108060/s55/bf22fb00-d484-47c7-83e7-f7faea3a3335/bf22fb00-d484-47c7-83e7-f7faea3a3335/)

---

visual studio - VSPackage: Modify toolbar button text/tooltip at runtime - Stack Overflow:
http://stackoverflow.com/questions/4014822/vspackage-modify-toolbar-button-text-tooltip-at-runtime
```

------------------------------------------------------------------------

Converted from Evernote content created at 2017-03-22T23:30:37+09:00