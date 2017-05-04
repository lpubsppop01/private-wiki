# シェルで OS を判定
```
[2012-12-28 13:58] 

CYGWIN 関連のメモでも書いた通り
---
if uname | grep -q '^CYGWIN'; then
    ...
fi
---
のように可能。

他に利用するところだと Darwin, Linux くらい。
Cygwin の uname は "CYGWIN_NT-6.2-WOW64" のような内容を出力するので
上記のように grep するか case 構文を使う。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2013-03-17T23:59:34+09:00