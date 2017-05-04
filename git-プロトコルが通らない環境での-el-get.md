# git プロトコルが通らない環境での el-get
```
git プロトコルが通らない環境では el-get でパッケージのインストールがいろいろ失敗して困るので対策。

------------------------------------------------------------------------

git の設定で git:// を https:// に置き換える。

---
$ git config --global url."https://".insteadOf git://
$ cat ~/.gitconfig
[url "https://"]
    insteadOf = git://
---

github 限定なら git://github.com/ とする。

参考:
http://stackoverflow.com/questions/1722807/git-convert-git-urls-to-http-urls

push は Corkskrew を使ってあれこれすれば可能らしいが、とりあえず clone だけできれば OK。

------------------------------------------------------------------------

el-get の設定でデフォルトのプロトコルを https にする方法もあるが、
submodule の url で git プロトコルが使われているところは考慮してくれない。

---
(setq el-get-github-default-url-type 'https)
---

参考:
http://www.gfd-dennou.org/member/uwabami/cc-env/EmacsBasic.html
```

------------------------------------------------------------------------

Converted from Evernote content created at 2013-04-03T21:01:06+09:00