# private-wiki 用の EC2 インスタンス再作成
先日は Amazon Linux で作成したのを Ubuntu Server で作り直す。
- AMI: Ubuntu Server 16.04 LTS (HVM), SSD Volume Type - ami-efd0428f
- キーペアは前回と同じとしたがユーザー名が ec2 ではなく ubuntu になる。

Jingo をインストール。
- `sudo apt-get nodejs nodejs-legacy npm`
- `sudo npm install jingo`
    - /usr/local/lib/node_modules に配置される

git push をパスワードを聞かれずにできるように設定。
- 秘密鍵をアップロードして所定の位置 `~/.ssh/id_rsa` に配置
- ~/.ssh/config を以下の内容で作成
  ```
  Host github.com
      HostName github.com
      IdentityFile ~/.ssh/id_rsa
      User lpubsppop01
  ```
- リポジトリを https で作成していたため ssh に変更
    - [githubから httpsでcloneしてしまったリポジトリの originを sshに変更する - ブログ - ワルブリックス株式会社](https://www.walbrix.com/jp/blog/2013-11-github-https-ssh.html)

自動 Push を設定。
- Jingo の config.yaml において applications.remote に `"origin"` を設定。
- とりあえず以下のようにバックグラウンドで動かしてログアウトする運用でいく。
  ```
  $ eval `ssh-agent`
  $ ssh-add ~/.ssh/id_rsa
  $ cd ~/private-wiki
  $ nohup jingo -c config.yaml > /dev/null &
  ```
  
---
  
インデントまわりに不備があったため一度作り直したのだけど、試しに `*.md` をサブディレクトリに置くのを試してうまくいかなかったのでメモ。
  - 格納先は config.yaml の application.subDocdir で設定できる。
  - しかし列挙のソート順が更新日時に従わない。
  - そもそも git の ls-tree は必ずしも更新日時順にはならないっぽい？