# Windows 8 に Cygwin をインストールした際の問題
```
[2013-01-09 00:00] 

ユーザーのデフォルトグループが 513 (なし) になっている。
英語版だと None とのこと。バグらしい。
http://superuser.com/questions/397288/using-cygwin-in-windows-8-chmod-600-does-not-work-as-expected

None だと chmod できないために ssh で問題がおこるし、そもそも不便。

デフォルトグループを変更するには *NIX 的には newgrp を使うらしい（忘れた）が、
Cygwin の場合は /etc/passwd を編集して 545 (Users) に変更。
すでにあるファイル・ディレクトリについては chgrp -R Users * すれば OK。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2013-03-17T18:54:01+09:00