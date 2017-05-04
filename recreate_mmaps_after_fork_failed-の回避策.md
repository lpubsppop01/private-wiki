# recreate_mmaps_after_fork_failed の回避策
```
[2013-01-08 21:34]

Windows 8 環境で Cygwin を動かしているとそれなりの頻度で
"recreate_mmaps_after_fork_failed" というエラーが発生する。
gcc とか make とかが多い。

なぜか LANG=C すると収まる。
http://d.hatena.ne.jp/lukewarm/20120904
https://twitter.com/lpproj/status/242637033372274688

---

未だにこの問題が頻発している（2014/10/04）。
rebase 問題と同じらしいのだが、LANG=C 以外では改善が確認できない。
普段からそれやってしまうと日本語表示できなくなるし、これでも解消しない場合もある。

http://comments.gmane.org/gmane.os.cygwin/144760
http://stackoverflow.com/questions/9300722/cygwin-error-bash-fork-retry-resource-temporarily-unavailable
http://www002.upp.so-net.ne.jp/tinynealy/cygwin.html#rebase
http://www.mk-mode.com/octopress/2012/06/12/12002009/
http://rcmdnk.github.io/blog/2013/07/05/computer-windows-cygwin-git/

以下のページでは ListDLLs を使用して問題が発生している DLL を特定する方法が提示されている。
しかしメッセージに示されたアドレス（0xFFEA0000）が出力結果に含まれないのでは
どうしようもない（この辺も 2 番目のページで触れられており、解決策は示されていない）。
http://stackoverflow.com/questions/5014554/git-svn-error-under-cygwin
https://groups.google.com/a/chromium.org/forum/#!msg/chromium-dev/8U3736ychvA/4xDntSyk_k4J

以下ページコメントにて "rebaseall -v -b0x60000000" というのが示されている。
これは perl.exe に対して効果があったが、完全に動くところまではいかなかった。
いまいち意味もわかってない。
https://code.google.com/p/chromium/wiki/CygwinDllRemappingFailurehttps://code.google.com/p/chromium/wiki/CygwinDllRemappingFailure
https://code.google.com/p/chromium/wiki/CygwinDllRemappingFailure
---

Cygwin x64 を別途インストールしてみたら、そちらの git svn はまともに動き、
Emacs の el-get からも問題なく利用できた（元々これに困って調べてたので助かった）。
単にインストール直後のクリーンさの影響かもしれないが、移行を考えてみる。

---

その後 Cygwin x86 を（元々あったフォルダー [c:/cygwin](file:///c:/cygwin) はリネームして）再インストールしたが、
やはり動かなかった。
もう諦めて x86_64 版に移行することにする。

留意点:
* chere のクリアと再設定 [Explorer のコンテキストメニューから Cygwin 端末を開く](evernote:///view/6108060/s55/9f707c0b-0b3d-49f0-ae7e-a8f82e000bf4/9f707c0b-0b3d-49f0-ae7e-a8f82e000bf4/)
* /etc/fstab [NTFS ACL を無効化](evernote:///view/6108060/s55/3d4e78fd-5e77-4bb2-ae5b-55927fd3ef5e/3d4e78fd-5e77-4bb2-ae5b-55927fd3ef5e/)
* /etc/passwd の編集 [Windows 8 に Cygwin をインストールした際の問題](evernote:///view/6108060/s55/001a288f-ec3d-492d-9c57-f426ae17b1af/001a288f-ec3d-492d-9c57-f426ae17b1af/)
* HOME の下にあるシンボリックリンクの貼り直し
  -> 相対パスにしていたので問題なかった。
* HOME 環境変数の変更

最近 Evernote クライアントが XKeymacs を素通りしてしまい使いづらさが増している…。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2013-03-17T17:59:02+09:00