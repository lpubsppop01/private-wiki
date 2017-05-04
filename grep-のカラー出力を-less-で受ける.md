# grep のカラー出力を less で受ける
```
[2012-12-28 00:21] 

---
$ grep --color=always pattern target.txt | less -R
---

lv -c でも同じはずなのだが grep の吐き出す制御コードが行儀悪い？らしく
うまくいかない。

たぶん便利？
---
function grep-less() {
    grep --color=always $* | less -R
}
---
```

------------------------------------------------------------------------

Converted from Evernote content created at 2013-03-18T00:02:02+09:00