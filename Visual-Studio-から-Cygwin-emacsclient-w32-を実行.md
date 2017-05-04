# Visual Studio から Cygwin emacsclient-w32 を実行
```
Visual Studio から外部ツールとして Cygwin emacsclient-w32 を実行したいが

パス変換が必要なのでラッパーをかませる。

emacsclient-w32.js:
---
/* global WScript */
if (WScript.Arguments.Length > 0) {
    var arg = WScript.Arguments(0);
    var command =
        "d:/opt/cygwin/bin/bash.exe --login -c \"/bin/emacsclient-w32.exe \\\"$(cygpath -u '" + arg +
        "')\\\"\"";
    var shell =  WScript.CreateObject("WScript.Shell");
    shell.Run(command, 0, false);
}
---

これを Cygwin の /bin に配置し、Visual Studio の外部ツールに登録。

* コマンド: C:\Windows\System32\wscript.exe
* 引数: D:\opt\cygwin\bin\emacsclient-w32.js $(ItemPath)
```

------------------------------------------------------------------------

Converted from Evernote content created at 2013-04-11T00:15:38+09:00