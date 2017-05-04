# less でシンタックスハイライト
```
[2012-12-28 00:59] 

source-highlight を使うと less でシンタックスハイライトしてくれる。
http://www.gnu.org/software/src-highlite/

Cygwin のインストーラにも何気なく入っている。
src-hilite-lesspipe.sh は /usr/bin/ に配置されるので
---
$ export LESSOPEN='| src-hilite-lesspipe.sh %s'
$ less -R hoge.c
---
とすればよい。

lv には LESSOPEN のようなギミックはないようなので
---
$ src-hilite-lesspipe.sh hoge.c | lv -c
---
とする他ない。

------------------------------------------------------------------------

その他に vim に付属している /usr/share/vim/vim73/macros/less.sh を
使う手もある。
http://qiita.com/items/45ed2605d769e2f0747a

こちらも十分に動くし vim なので今後も入手できなくなったりはしないだろう。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2013-03-18T00:05:09+09:00