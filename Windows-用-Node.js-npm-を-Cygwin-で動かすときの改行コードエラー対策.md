# Windows 用 Node.js npm を Cygwin で動かすときの改行コードエラー対策
```
スクリプトの改行コードが CRLF なのだが、Cygwin で動かすと LF のつもりで実行してこけるらしい。
というかシェルスクリプトで CRLF を期待する処理系はあるのだろうか。
---
$ npm install tsd
/cygdrive/c/Program Files (x86)/nodejs/npm: line 2: $'\r': コマンドが見つかりません
/cygdrive/c/Program Files (x86)/nodejs/npm: line 4: $'\r': コマンドが見つかりません
/cygdrive/c/Program Files (x86)/nodejs/npm: line 5: 期待してない token `$'in\r'' のあたりにシンタックスエラー
'cygdrive/c/Program Files (x86)/nodejs/npm: line 5: `case `uname` in
---

ググったらファイルの改行コードを書き換える方法しか出てこなかった。いいんかな。
相対パスで Node.js のファイルを見るため、他の場所にコピーを置くのではだめらしい。

------------------------------------------------------------------------

Node.jsをWindowsインストーラで入れたら、Cygwinのシェルでnpmがエラーになる - 死ぬまでの暇潰し:
http://aki2o.hatenablog.jp/entry/2013/08/16/Node.js%E3%82%92Windows%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%A9%E3%81%A7%E5%85%A5%E3%82%8C%E3%81%9F%E3%82%89%E3%80%81Cygwin%E3%81%AE%E3%82%B7%E3%82%A7%E3%83%AB%E3%81%A7npm%E3%81%8C%E3%82%A8

npm script has Windows newlines · Issue #5912 · joyent/node · GitHub:
https://github.com/joyent/node/issues/5912
```

------------------------------------------------------------------------

Converted from Evernote content created at 2014-07-13T17:30:14+09:00