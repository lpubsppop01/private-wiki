# Windows の標準機能で MD5 などハッシュ値を取得
```
md5sum 的なことが実は標準機能でできる。
---
PS> certutil -hashfile hoge.txt MD5
MD5 ハッシュ (ファイル hoge.txt):
b8 ea 95 0d 05 cf f9 19 dd 1f 97 81 de 1e 32 6a
CertUtil: -hashfile コマンドは正常に完了しました。
---

常用環境では Cygwin を入れるので使わないとは思うが、
他人の環境でちょっとハッシュチェックしたい、というような状況で使えそう。

Windows 標準コマンドで MD5/SHA1 チェック - Palm84 某所の日記:
http://d.hatena.ne.jp/palm84/20150909/1441743390
```

------------------------------------------------------------------------

Converted from Evernote content created at 2016-07-26T22:50:15+09:00