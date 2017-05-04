# EC2 で Gollum (2)
前回で動かすところまでは行ったのでしばらく Gollum 自体をあれこれ触ってみるつもりだけど、それとは別に環境面で解決したい問題など。
* 試しに作成した 2 番目のページの編集者が Anonymous になっている。
    + Upstart で動かしているときに Anonymous になるようだ。ec2-user のまま起動した状態だと git config で設定した lpubppop01 になる。
    + [Upstartでサービス（デーモン）化 - ただの雑記](http://beli.hatenablog.jp/entry/2016/02/13/Upstart%E3%81%A7%E3%82%B5%E3%83%BC%E3%83%93%E3%82%B9%EF%BC%88%E3%83%87%E3%83%BC%E3%83%A2%E3%83%B3%EF%BC%89%E5%8C%96)
    + Upstart のバージョンが 0.6.5 と古かったため、上記リンク先の方と同じ方法で設定。
      ```
      exec su -s /bin/sh -c 'exec "$0" "$@"' ec2-user -- gollum --config auth.rb >> /var/log/gollum.log
      ```
    + 改善した。
* OmniAuth 使いたい。
    + Ruby の新しいバージョンを入れる必要がある。ruby も AMI もよく知らないが、どうやるのが流儀に沿っているのだろう？
    + というか debian とか ubuntu のイメージもある。パッケージの古さに悩みたくないなら ubuntu か。
    + AMI は後から変更はできないので再作成になる。
* バックアップ体制（GitHub にリポジトリ作って clone して push）

使いながらで十分なこと。
* スタイルを整えたい。編集したくなる程度に。

当面考えないけど一応メモしておくこと。
* SSL
* ドメイン
* ポート（4567 でもいいけど）
---

以下をまねて日本語対応などをやりたい。

[PukiWiki の代わりに Gollum を導入してみた - あらびき日記](https://abicky.net/2014/09/15/121633/)

gollum と gollum-lib を fork して上記の改変版から cherry-pick とかなんとか。
Windows 環境ではやりづらそうだけど、とりあえずやってみる。だめそうだったら適当に Linux 環境作ろう。

GitHub で gollum, gollum-lib を fork して、まずローカルで動かすところまで。
- DevKit をインストール
  ```
  Admin-PS> cinst ruby ruby2.devkit
  ```
    - c:\tools\DevKit2\config.yml に - C:/tools/ruby23 と追記
    - 管理者権限端末で cd c:\tools\DevKit2; ruby dk.rb install
    - 参考: http://gozuk16.hatenablog.com/entry/2015/01/14/230315
- 自分のリポジトリにある gollum-lib をインストール
  ```
  PS> gem specific_install -l 'git@github.com:lpubsppop01/gollum-lib.git'
  ```
    - まだ charlock_holmes-0.7.3 のコンパイルに失敗するそうな。諦めた。

面倒になってきて派生？実装の Jingo も試してみたら、必要な機能が標準でサポートされてた。Ruby よりは Node.js の方が慣れているし、ここまでにしてそちら路線に切り替える。

------------------------------------------------------------------------

Converted from Evernote content created at 2017-04-25T22:39:18+09:00
