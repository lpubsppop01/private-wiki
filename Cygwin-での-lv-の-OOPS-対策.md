# Cygwin での lv の OOPS 対策
```
[2012-12-28 00:19] 

TERM=cygwin で改善するらしい。

しかし常に TERM=cygwin にしてしまうと C-l によるクリアが効かなくなる。
他にもたぶん弊害があるだろう。

なので現実的にはこんな感じにする:
---
# cygwin で Shift-JIS テキストを表示したときの OOPS 対策
if uname | grep -q '^CYGWIN'; then
    alias lv='TERM=cygwin lv'
    export PAGER='TERM=cygwin lv'
fi
---
```

------------------------------------------------------------------------

Converted from Evernote content created at 2013-03-18T00:01:10+09:00