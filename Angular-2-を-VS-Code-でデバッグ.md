# Angular 2 を VS Code でデバッグ
事前準備として VS Code 拡張の Debugger for Chrome をインストール。クライアント側で動くコードのデバッグになるため、サーバーは `ng serve` などで動かしておく。

`.vscode/launch.json` を以下のような内容で作成：
```
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Launch localhost with sourcemaps",
            "type": "chrome",
            "request": "launch",
            "url": "http://localhost:4200/",
            "sourceMaps": true,
            "webRoot": "${workspaceRoot}"
        }
    ]
}
```

---

参考リンク：
- [angular - Debug & Run Angular2 Typescript with Visual Studio Code? - Stack Overflow](http://stackoverflow.com/questions/36494938/debug-run-angular2-typescript-with-visual-studio-code)