# Microsoft Azure 無料評価版で Node.js + Passport
```
Azure の Node.js で Passport を使用した認証を行うメモ。
Azure に関係なく可能なのかもしれないが、詳しくないのでとりあえずこのノリで書いておく。

* Web App with Express (Node.js) - Azure Tutorial:
  http://azure.microsoft.com/en-us/documentation/articles/cloud-services-nodejs-develop-deploy-express-app/

* Azure Active Directory の SSO 開発 (Node.js 編) - 松崎 剛 Blog - Site Home - MSDN Blogs:
[  http://blogs.msdn.com/b/tsmatsuz/archive/2014/03/23/azure-ad-and-node-js-sso-federation-using-passport.aspx](http://blogs.msdn.com/b/tsmatsuz/archive/2014/03/23/azure-ad-and-node-js-sso-federation-using-passport.aspx)

* とりあえず通常の手順？でロール作成まで行う。
  > New-AzureServiceProject PassportSample
  > Add-AzureNodeWebRole

* Express Framework をインストール（これはプロジェクトでなくシステムに展開されるのか？）。
  > npm install express
  ...
  npm ERR! Error: SSL Error: SELF_SIGNED_CERT_IN_CHAIN
  npm のバージョンが古いらしい。

* npm をアップグレードしてみる。
  node.js - receiving error: 'Error: SSL Error: SELF_SIGNED_CERT_IN_CHAIN' while using npm - Stack Overflow:
  http://stackoverflow.com/questions/9626990/receiving-error-error-ssl-error-self-signed-cert-in-chain-while-using-npm
  > npm config set ca ""
  > npm install npm -g
  ...
  npm WARN engine npm@1.4.7: wanted: {"node":">=0.8","npm":"1"} (current: {"node":"0.6.20","npm":"1.1.37"})
  なんと npm が動作しなくなった。先に node を更新すべきだった…。
  というかそういうことは先に警告して…。

* Node.js 公式サイトから 0.10.26 x86 のインストーラをダウンロード。
  Azure SDK で入った 1.1.37 をアンインストールしてからインストール。
  x86 版にしておくとインストール先が同じになり、Azure の PowerShell で問題が出ない。

* 改めて npm install express -g したら問題なく入った。
  -g オプションはグローバルの意で AppData の下にインストールされる。

* しかし express コマンドがない。以下によると express-generator に分離されたらしい。
  windows 7 - Express not found after npm install - Stack Overflow:
  http://stackoverflow.com/questions/23006804/express-not-found-after-npm-install
  上記に従って npm install express-generator -g でインストール。

* Express のひな形を作成し、必要なパッケージをダウンロード。
  > cd c:\PassportSample
  > mkdir Express01
  > express -e .\Express01
  > cd .\Express01
  > npm install

* とりあえず Node.js で動かしてみる。
  > node app.js
  …こいつはどこのポートで動いてんだ…。わからん。
  →どうも動いてないらしい。以下を app.js の末尾に追記後、動作を確認した。
  ---
  app.set('port', process.env.port || 80);
  var http = require('http');
  http.createServer(app).listen(app.get('port'), function(){
    console.log('Express server listening on port ' + app.get('port'));
  });
  ---

* Azure で動かす設定。
    + Express01 フォルダーに config ファイルが必要。
      通常の手順で Role を作成したときに生成された Web.config と Web.cloud.config をコピー。
      server.js -> app.js に置換して利用する。
      どちらかのファイルしか使わないような気はする…。
    + PassportSample フォルダーの以下のファイルを編集してロールとして認識させる。
      名称と EndPoint のポート番号辺り。
        - ServiceConfiguration.Cloud.cscfg
        - ServiceConfiguration.Local.cscfg
        - ServiceDefinition.csdef
  うん、動かない。

* やめて、自動生成された Role のフォルダー内で express コマンドを叩く方向に変更。
  app.js -> server.js に改名して手軽に完了。
  port 番号でややトラブルがあったが、上記のように process.env.port で待機すればおけ。

* URL の確認が必要なので、ひとまずデプロイする。
  > Publish-AzureServiceProject -ServiceName Lpubsppop01Sample02 -Location "East Asia" -Launch
  サービス名の長さ制限が地味にきつい。何度か怒られた。

* Azure の管理サイトからディレクトリを追加し、そこに組織で開発しているアプリケーションの追加。
  名前:     
  サインオン URL: http://lpubsppop01sample02.cloudapp.net/
  アプリケーション ID/URI: http://lpubsppop01sample02.cloudapp.net/
  適当にユーザーも追加しておく。

* 自己証明書を作成して登録。長いので以下を参考に。
  iOS7.1から企業内アプリ配布にSSLが必須となったので自己証明書でなんとかしてみた - spiratesta's diary:
  http://spiratesta.hatenablog.com/entry/2014/03/17/161702

  pfx ファイルを Azure の管理サイトのクラウドサービスで登録。
  …なんか違うような。

* npm install passport; npm install passport-azure-ad

もう混乱してきたので今日はあきらめる…。
やはり何をやるにしても認証はやっかいだなー。

Lpubsppop01PassportSample
```

------------------------------------------------------------------------

Converted from Evernote content created at 2014-04-20T17:56:17+09:00