# NTFS ACL を無効化
```
[2013-01-09 01:56] 

Cygwin 環境で NTFS ACL (Access Control List?) アクセス制御リストを無効化する方法。
理屈はよくわからないが、Windows アプリケーション（NTEmacs を含む）で
ファイルを更新したときに実行許可が立つのはこれのせいらしい。

/etc/fstab にて noacl をつけてマウントするように設定。
/tmp だけは ACL を有効にしておかないと Cygwin emacs-w32 で都合が悪い。
---
# NTFS ACL を無効化
D:/opt/cygwin/bin       /usr/bin        ntfs            binary,noacl                    0 0
D:/opt/cygwin/lib       /usr/lib        ntfs            binary,noacl                    0 0
D:/opt/cygwin/tmp       /tmp            ntfs            binary,acl                      0 0
D:/opt/cygwin           /               ntfs            override,binary,noacl           0 0
none                    /cygdrive       cygdrive        binary,noacl,posix=0,user       0 0
---
```

------------------------------------------------------------------------

Converted from Evernote content created at 2013-03-17T18:35:52+09:00