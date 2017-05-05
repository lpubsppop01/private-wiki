# nohup でデーモン化するシェルスクリプト
`nohup PROGRAM &` とするとプログラムをログアウト後も動く（`SIGHUP` で停止しない）形でバックグラウンド実行できる。デーモンというと /etc の下の init 的なあれこれでどうにかする印象だったけど、
* 特定のユーザー権限で動かしたい
* `ssh-agent` に秘密鍵を登録した状態で動かしたい
* OS 環境になるべく依存させたくない（Unix-like な環境）

というような条件では nohup でデーモン化する方が合っているみたい。

Windows は PowerShell に近いコマンドレットがあるとか、そもそも親プロセスが死んだとき子プロセスが死ぬのが通常の動きではないから必要ないとか書かれている。未確認。
- [Windows(PowerShell)でプログラムをnohupのようにバックグラウンド実行させる | 俺的備忘録 ...](https://orebibou.com/2015/11/windowspowershellでプログラムをnohupのようにバックグラウンド/)
- [What's the nohup on Windows? - Stack Overflow](http://stackoverflow.com/questions/3382082/whats-the-nohup-on-windows)

たぶんいろんな人が書いているはず（というか自分も学生のとき書いてるんじゃないか？）だけど、とりあえず作業中に以下がヒットした。こういうのがほしい。
[プログラムをnohupでデーモン化する - Qiita](http://qiita.com/geta6/items/9472f6f192976670c93f)

使いまわせるような形で作成中…