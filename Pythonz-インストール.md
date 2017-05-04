# Pythonz インストール
```
※結局問題が解決できず使用をやめた。
環境は Cygwin x86 on Windows 8.1 x64。
以前 Mac でもインストールしてたらしいのだがメモが残っていない。

Cygwin インストーラでインストール:
libz-devel, libbz2-devel, ncurses-devel, openssl-devel,

libsqlite3-devel, libgdbm-develreadline,
readline, intltool, # intltool は不要かも？
patch

なしでも CPython のビルドは通ってしまうが関連モジュールが使えなくなるらしい。
少なくとも zlib-devel はないと setuptools のインストールでこける。

Pythonz と CPython-2.7.6 のインストール:
---
$ curl -kL https://raw.github.com/saghul/pythonz/master/pythonz-install | bash
$ ./.pythonz/bin/pythonz install 2.7.6
---

virtualenv と併用すると切り替えなど便利らしいが、普段切り替えることがないので単に ~/.bashrc で設定。

~/.bashrc:
---
# Pythonz
if [ -s $HOME/.pythonz/etc/bashrc ]; then
    source $HOME/.pythonz/etc/bashrc
fi
if [ -d $HOME/.pythonz/pythons/CPython-2.7.6/bin ]; then
    export PATH=$HOME/.pythonz/pythons/CPython-2.7.6/bin:$PATH
fi
---

eash_install をインストール:
---
$ curl https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py -o - | python
---
でうまくいかなかったので、落とされた setuptools-3.4.4.zip を展開して setup.py を使用。
---
$ unzip setuptools-3.4.4.zip
$ cd setuptools-3.4.4
$ python setup.py install
---

素直に pip をインストール:
---
$ easy_install pip
---

readline をインストール…が失敗する。
rebaseall しても効果なし（.pythonz 下についても FileList.txt を作成して実行した）。
Cygwin パッケージの方は問題ないのでライブラリが見えてないのだと思うが、
もう面倒になったので諦める。
---
  File "/home/Kotaro/.pythonz/pythons/CPython-2.7.6/lib/python2.7/subprocess.py", line 1222, in _execute_child
    self.pid = os.fork()
OSError: [Errno 11] Resource temporarily unavailable
---
知らんがな…。

------------------------------------------------------------------------

以下本家＆参考サイト。

saghul/pythonz - GitHub:
https://github.com/saghul/pythonz

PythonzでPython2.7.3をインストール　謎のテクノロジー - cloverrose's blog:
http://cloverrose.hateblo.jp/entry/2012/10/04/002127
```

------------------------------------------------------------------------

Converted from Evernote content created at 2014-04-26T17:52:01+09:00