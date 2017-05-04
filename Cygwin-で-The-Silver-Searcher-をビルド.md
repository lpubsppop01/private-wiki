# Cygwin で The Silver Searcher をビルド
```
zlib-devel, libpcre-devel, pkg-config 辺りを Cygwin インストーラーで入れておく。

試したときには libpcre-devel 以外はすでに入っていた。

後は通常の手順通り。Windows 用の Makefile.w32 ではなく build.sh を実行する。

---
$ git clone git://github.com/ggreer/the_silver_searcher.git
$ cd the_silver_searcher/
$ ./build.sh
$ make install

---

インストール先は /usr/local になっている。
実行ファイル以外に Bash の補完設定ファイルと man がコピーされる。

参考:
http://d.hatena.ne.jp/zqwell-ss/20130325/1364232704
```

------------------------------------------------------------------------

Converted from Evernote content created at 2013-04-08T00:01:06+09:00