# Microsoft Azure 無料評価版で Node.js
```
仕事で使えるか気になったので今更ながら試してみる。
Windows Azure -> Microsoft Azure に改称したはずだが、まだ表記がぶれているようだ。

* 以下参考サイト。一番上はその通りには進められない（2 番目の記事で触れられている通り）。
  Windows AzureでNode.jsを実行しよう （1/5）：CodeZine:
  http://codezine.jp/article/detail/6440
  初めて触るWindows Azureでnode.jsとSocket.IOを動かしてみた « 東方を目指すためのブログ:
  http://blog.uzoumuzou.net/2012/09/08/184409
  Node.js application using Socket.io - Azure tutorial:
  http://azure.microsoft.com/en-us/documentation/articles/cloud-services-nodejs-chat-app-socketio/

* 私用アカウントで無料評価版（30 日）を利用した。
  無料評価版でもクレジットカードの登録は必要。

  会社の MSDN サブスクリプションには Azure 無料枠があるので仕事ではそちらを使えばいい。

* 以下から Node.js の Windows 用インストーラをダウンロードする。
  Windows Azure SDK とツールのダウンロード | Windows Azure:
  http://azure.microsoft.com/ja-jp/downloads/

* Windows Azure PowerShell を管理者権限で起動して以下を実行。
  実行後は c:\NodeSample に移動する。
  > New-AzureServiceProject NodeSample
  > Add-AzureNodeWebRole

* エミュレータを起動。Launch オプションは起動するとブラウザを起動の意。
  インストール直後の状態ではうまく動作しなかったが、再起動後は問題なし。
  > Start-AzureEmulator -Launch
  終了は以下。
  > Stop-AzureEmulator

* Azure にデプロイするためサブスクリプション設定情報をインポートする。
  以下を実行するとブラウザが開きファイルの保存先を聞かれる。
  > Get-AzurePublishSettingsFile
  保存したファイルをインポート。
  > Import-AzurePublishSettingsFile $(保存先)\無料評価版-4-20-2014-credentials.publishsettings
  ダウンロードしたファイルは削除しておく。

* デプロイは以下のように実行。サービス名はユニークである必要あり。アンダースコアは使えない。
  > Publish-AzureServiceProject -ServiceName Lpubsppop01NodeSample -Location "East Asia" -Launch
  それなりに時間がかかるので注意。
  サービス名はユニークである必要があり、スペースやアンダースコアは使えない。
  上記実行後、クラウドサービスとストレージサービスが登録されていた。

* 削除は以下のように実行。
  > Remove-AzureService
  Stop- だと課金対象のままだそうで Remove- の方が無難とのこと。
  しかしこれだとストレージサービスの方は残ったままだった。
  仕方ないので↓の通り Web サイトから削除しておいた。

* デプロイしたサービスは Web サイトからも操作できる。
  Windows Azure:
  https://manage.windowsazure.com/

（ここから参考情報）

* SSL 証明書は既定のものが用意されているらしい。開発中はこれで問題ないだろう。
  Windows Azure Web サイトに WebSocket を導入する - Microsoft Azure Japan Team Blog (ブログ) - Site Home - MSDN Blogs:
  http://blogs.msdn.com/b/windowsazurej/archive/2013/11/25/blog-introduction-to-websockets-on-windows-azure-web-sites.aspx

 New-AzureServiceProject NodeSample
  動作するサンプルコードが
しておく必要がある
```

------------------------------------------------------------------------

Converted from Evernote content created at 2014-04-19T18:37:46+09:00