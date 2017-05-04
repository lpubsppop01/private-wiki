# git の改行コード自動変換
```
core.autocrlf が true または input になっていると改行コードの変換が行われる。
Windows 環境でも LF で取得したいので false にするしかない。

SourceTree の内臓 git を使用している場合でも環境変数 HOME が設定されていれば
~/.gitconfig を見に行くことになる。
なので Cygwin がインストールされている環境ではそちらの ~/.gitconfig と共用する形になる。

git での改行コード:
http://qiita.com/shuhei/items/2da839de8803cb335f86
```

------------------------------------------------------------------------

Converted from Evernote content created at 2014-10-05T22:50:12+09:00