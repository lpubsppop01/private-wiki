# sudo-for-cygwin
```
[2012-12-28 15:49] 

試行してみる。
https://github.com/nu774/sudo-for-cygwin

Cygwin の Python 環境で動作。
Python の greenlet と eventlet というパッケージが必要。

------------------------------------------------------------------------

pip も easy_install も入れてなかったのでそこから。
easy_install は setuptools に含まれている。

配布元より setuptools-0.6c11-py2.7.egg を取得して sh に食べさせる。
/usr/bin に入るのが気持ち悪いが仕方ない。
http://pypi.python.org/pypi/setuptools#files

pip, greenlet, eventlet をインストール。
---
$ easy_install pip
$ pip install greenlet eventlet
---

sudo, sudoserver.py を /usr/local/bin にコピーして動作テスト。
---
$ sudoserver.py &
$ sudo ls
---
試したのは Windows 8 Pro x64 上で特に問題なし。

タスクスケジューラーに登録。
配布元の README によると:
---
    Action: "Start a program"
    Triggers: "At log on"
    "Run with highest privileges": checked.
    "Program/script": C:\cygwin\bin\python.exe
    "Add arguments(optional)": /path/to/sudoserver.py
---
加えて実行時に使うユーザーアカウントの設定を
「ユーザーがログオンしているかどうかにかかわらず実行する」にしておく。
（DOS 窓が表示されるのはうれしくないので。）

たいへん便利。
Cygwin 環境なら Start++ よりもこちらの方が適してそう。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2013-03-17T19:03:34+09:00