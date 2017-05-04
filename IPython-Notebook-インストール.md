# IPython Notebook インストール
```
環境は Cygwin x86 on Windows 7.1 x64。
virtualenv や Pythonz などは使用せず。

前提として zeromq をインストールしておく必要がある。

Code Connected - zeromq:
http://zeromq.org/

Cygwin パッケージはないのでソースからビルドする。
注意点は以下 2 点:
* Cygwin インストーラで libtool をインストールしておく。
* ソースの修正が必要。
  make - How to build zeromq on windows with cygwin? - Stack Overflow:
  http://stackoverflow.com/questions/21017296/how-to-build-zeromq-on-windows-with-cygwin
  ---
  $ cd zeromq-4.0.4
  $ ./configure --prefix=/usr/local
  $ mv tools/curve_keygen.c tools/curve_keygen.cpp
  $ sed -i 's/\.c\>/&pp/' tools/Makefile.am
  $ rm -f tools/.deps/curve_keygen.Po
  $ ./autogen.sh
  $ LANG=C make
  $ LANG=C make install
  ---

後は pip でインストール:
---
$ pip install ipython
$ pip install jinja2
$ pip install tornado
$ pip install pyzmq
---

そしてエラー…。sys/epoll.h は glibc で提供されており、Cygwin ではたぶん無理。
---
bundled/zeromq/src/epoll.hpp:28:23: 致命的エラー: sys/epoll.h: No such file or directory

 #include <sys/epoll.h>
---

しかしビルド成功している人がいるようなので、何か手順が足りてないか間違っているのだろう。
どうしてくれよう。

------------------------------------------------------------------------

以下参考サイト。

IPython Notebookでかっこいいグラフを書く — MemoBlog:
http://yymm.bitbucket.org/blog/html/2013/10/03/ipython_entrance.html
```

------------------------------------------------------------------------

Converted from Evernote content created at 2014-04-26T18:38:35+09:00