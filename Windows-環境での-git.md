# Windows 環境での git
```
使っていてストレスがなくなってきた気がするのでメモしておく。
使用頻度が低いツールは無理してコマンドラインで使うよりも GUI 頼みの方がいいと思う。

* "> choco install git" でインストールされるもので問題ない。
  gitk（エクスプローラの Git GUI Here）も使える。
　→あれは gitk ではなく Git GUI らしい。そして Git GUI の方が使いやすいと思う。

    + Emacs からは Cygwin の git を呼び出しているが、
       これも choco 版の方でよいかも？

* diff の文字化け対策とコミットで怒られない最低限の設定。
  > git config --global gui.encoding utf-8
  > git config --global user.email "メールアドレス"
  > git config --global user.name "名前"

* 後は必要に応じて。
    + [git の改行コード自動変換](evernote:///view/6108060/s55/550ed268-b39a-4e9c-899e-7506d91ebbda/550ed268-b39a-4e9c-899e-7506d91ebbda/)
    + [git プロトコルが通らない環境での el-get](evernote:///view/6108060/s55/90c05268-ae53-464f-ae47-81c84ce151f1/90c05268-ae53-464f-ae47-81c84ce151f1/)
```

------------------------------------------------------------------------

Converted from Evernote content created at 2016-07-03T20:11:52+09:00