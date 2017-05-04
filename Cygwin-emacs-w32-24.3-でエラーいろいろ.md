# Cygwin emacs-w32 24.3 でエラーいろいろ
```
Cygwin emacs-w32 24.3 にて気になるところ。

まっさらな状態から dotfiles を clone したらいろいろ出てきたので、
環境は関係ないかもしれない。

------------------------------------------------------------------------

以下のようなエラーが出て elscreen（オリジナル版）が動かない。

---
Error in post-command-hook (elscreen-run-screen-update-hook): (error "Variable binding depth exceeds max-specpdl-size")
Error in post-command-hook (elscreen-run-screen-update-hook): (error "Lisp nesting exceeds `max-lisp-eval-depth'")
---

…と思ったら desktop-save してから再起動したら出なくなった。

------------------------------------------------------------------------

シンボリックリンク経由で el ファイルを開くと

---
Buffer "init.el" has a running process; kill it?
---

と聞かれる。

el ファイル限定なところを見ると flymake-elisp 関連？

------------------------------------------------------------------------

helm を el-get でインストールしようとすると byte-compile に失敗する。
w3m-cookie がロードできないとか。
そういえば w3m は site-lisp の方に入れているけど。
el-get から入れたら何か不都合があったような覚えが…。

el-get 版に変更したら問題なく完了した。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2013-04-03T22:34:04+09:00