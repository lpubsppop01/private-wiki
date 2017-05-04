# Homebrew で Inkscape のビルドが通らない
```
以下のように Inkscape のビルドが失敗する:
---
...
==> ./configure --prefix=/usr/local/Cellar/inkscape/0.48.4 --enable-lcms --disab
==> make install
/usr/local/Cellar/glibmm/2.36.0/include/glibmm-2.4/glibmm/valuearray.h:198: error: ‘Value’ is not a template
/usr/local/Cellar/glibmm/2.36.0/include/glibmm-2.4/glibmm/valuearray.h:198: error: ‘Glib::Value’ is not a template type
make[1]: *** [color-profile.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [install-recursive] Error 1
...

---

メンテが止まっているというわけではなくタイムリーな問題らしい。

https://gist.github.com/urielshaolin/5428629
https://gist.github.com/rinopo/5428429

Gentoo Forum でも同様の問題が話題になっており、
とりあえずの回避策として gtkmm のバージョンを 2.24.2 にするというのが
挙げられている（最新は 2.24.3）。

http://forums.gentoo.org/viewtopic-p-7287866.html

------------------------------------------------------------------------

上を参考にして 2.24.3 をアンインストール後に 2.24.2, Inkspace をインストールする。

---
$ sudo brew remove gtkmm
$ cd /usr/local
$ git log Library/Formula/gtkmm.rb # 2.24.3 になるひとつ前のコミット番号？を確認
$ sudo git checkout a2d4d9d832e60e2b007990f394b22e77b6dfa3ba Library/Formula/gtkmm.rb
$ sudo git install gtkmm
$ sudo git install inkscape
---

Homebrew install specific version of formula? - Stack Overflow: 
http://stackoverflow.com/questions/3987683/homebrew-install-specific-version-of-formula
```

------------------------------------------------------------------------

Converted from Evernote content created at 2013-04-29T20:27:23+09:00