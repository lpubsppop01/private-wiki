# EC2 で Gollum
Evernote の技術メモの移行先として Amazon EC2 で Gollum（git ベースの Wiki）を動かすというのを試してみる。
* 最初は IBM の Bluemix が無料枠で済むかもでいいかなと思っていたのだけど、
ググったら EC2 で動かしたというブログポストが複数引っかかったのでそちらに流れてみる。経験不足だからはまらない方がいい。
* メモリ 512MB の nano で満足に動くようなら月 500 円くらいでいける（加えて最初の１年間は無料）。
* AWS は言葉だけでよく知らなかったけど、仮想マシンの EC2 とストレージの S3 が個人で使う機会がそれなりにあるみたい。

とりあえず以下を参考にやってみる。
* [wikiエンジン"gollum"をEC2上にインストールしてカスタマイズするまで - Qiita](http://qiita.com/shohei1913/items/9498fbd9d9e2c5b97c2c)

---

しかしその前にまず AWS にアカウントを登録しなければ。以下を参考に。
* [AWS（amazon web services）へ新規登録する方法 【日本語解説】 - usedoor](http://usedoor.jp/howto/web/aws/amazon-web-services-touroku/)
* [AWSアカウントを取得したら速攻でやっておくべき初期設定まとめ - Qiita](http://qiita.com/tmknom/items/303db2d1d928db720888)

２段階認証だけは早めに設定しておいた方がよさそうだ。
* 個人、Basic プランで登録完了。概ねひとつめのリンク先の通りだったが、自動音声は英語だった。PINを入力して、というだけだから困らなかったけど。
* コンソールからセキュリティ認証情報のページを開くと
IAM ユーザーを作成するのがベストプラクティス、みたいな案内が表示された。
    + どうも登録時に作成したアカウント情報（ルートアカウント、AWS アカウントと呼称）は普段は使わず、IAM ユーザーアカウントという制限されたアカウントを使用するのが鉄板らしい。
    + とりあえず MFA (Multi-Factor Authenticaion) を有効化。仮想 MFA デバイスを選択して手持ちのデバイスの Google 認証システムと紐づけ。
    + 今回はここまでにして次に行く。
* コンソールから EC2 インスタンスの迅速な起動を選択。とりあえず推奨設定でインスタンスを作る「使用を開始」でやってみる。
    + 名称：WorkInstance
    + OS：Amazon Linux AMI 2016.03.0
    + インスタンスタイプ：t2.micro
        - nano にする予定だったのだが、無料枠は micro だけとのことで。
    + ログイン用キーペア（pem ファイル）をダウンロード・保存。
    + インスタンスを保護するため現在の IP アドレスからの接続のみ受け入れるセキュリティグループを設定しました、とのこと。

Public にするにはそれなりの設定が必要だろうけど、ひとまずここまでにして次へ。

---

gollum を動かすところまでいきたい。
* EC2 コンソールで上の方にある「接続」ボタンを押すと ssh での接続方法が案内される。先ほどダウンロードした pem ファイルを使ってログインする。
* git はインストールされていなかった。yum はある。バージョンは 2.7.4 と古いけど、とりあえず yum でいけるところまでいってみる。
  ```
  sudo yum install git
  sudo yum install gcc gcc-c++ libicu-devel ruby-devel zlib-devel
  sudo gem install gollum --no-document
  sudo gem install github-markdown --no-document
  ```
    + 最初 --no-document を付けずに実行したら終わる兆しがなかった。実質的に必須オプション。
        - [gemのインストールで--no-documentを付けると77倍早い - Qiita](http://qiita.com/ginpei/items/49f2c749c2b12098718e)
    + [ruby - How to remove installed ri and rdoc? - Stack Overflow](http://stackoverflow.com/questions/2941005/how-to-remove-installed-ri-and-rdoc)
* セキュリティグループが作業した環境の IP アドレスからの ssh だけ許可になっているので、
Web サーバー用に開けておく必要がある。80 にしようとしたら gollum の方がパーミッションエラーになったのでひとまず 4567 を空けて試行。OK。

時間切れ。動かすことはできた。

---

続き。デーモンで動作させる＋認証の導入。
* 作業しづらいのでセキュリティグループのインバウンド ssh を任意 IP アドレスに変更。
* vim で編集する流れなので ~~/.vimrc で set nobackup だけ設定。
* まずはデーモン化。上記リンク先の通りに作業。
    + /etc/init/private-wiki.conf を作成。
      ```
      description "private-wiki"
      author "lpubsppop01"
      
      start on runlevel [2345]
      stop on runlevel [016]
      
      # ここは後の作業で入れた
      env GITHUB_OAUTH_CLIENT_ID="{Client ID}"
      env GITHUB_OAUTH_SECRET="{Client Secret}"
      
      chdir /home/ec2-user/private-wiki
      exec gollum >> /var/log/gollum.log
      
      respawn
      ```
    + `$ sudo initctl reload-configuration`
    + `$ sudo initctl start private-wiki`
* 次に認証。omnigollum を使用して GitHub アカウントで認証できるように。
    + これも上記リンク先の通り GitHub の OAuth Applications の登録。
    + 取得した Client ID と Client Secret を先ほどの private-wiki.conf に追記（上記）。
    + gem で omnigollumn と omniauth-github をインストール…と思ったのだが、omnigollum が ruby のバージョン 2.1.9 以上とのこと。入っているのは 2.0.0。
    + とりあえずベーシック認証で。
        - [ぼっちWikiに最適なGollumについてのメモ - Qiita](http://qiita.com/tatzyr/items/5ea6328719d72135c6c3)

予定とは違ったけど認証まで行ったので完了。
[Private Wiki](http://ec2-54-68-5-251.us-west-2.compute.amazonaws.com:4567)

------------------------------------------------------------------------

Converted from Evernote content created at 2017-04-24T20:31:37+09:00
