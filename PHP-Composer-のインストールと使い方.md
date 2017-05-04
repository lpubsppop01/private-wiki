# PHP Composer のインストールと使い方
Composer は PHP で利用できるパッケージマネージャ。
* ビルド・実行に必要な依存ライブラリを引っ張ってくれる、npm や Nuget に近い位置付けのツール。
* PHP 向けのパッケージマネージャとしては pear もあるけど、そちらは gem のようなシステムスコープのパッケージ管理に向いた仕様で、開発用だと Composer 一択。

PHP スクリプトを拡張するのに他のライブラリを使いたかったので、基本的な使い方をメモ。

[Composerで始める PHPのライブラリ管理 - Hack Your Design!](http://blog.toshimaru.net/how-to-use-composer-autoload/)

## インストール
以下を実行するとカレントディレクトリに `composer.phar` というファイルができる、らしい。しかし cinst した php と Cygwin の curl で実行したら openssl extension がないと怒られた。
```
$ curl -s https://getcomposer.org/installer | php
```

OpenSSL Extension が別パッケージで提供されてないかなと Chocolatey の方で検索したら Composer 自体があった。
```
Admin-PS> cinst composer
```

## 使い方
使い方はこれ系のツールのお約束通り。
```
$ composer サブコマンド サブコマンド引数
```

検索なら `search`、取得なら `require`。
`require` すると `composer.json` が生成される。
```
$ composer search html2text # 検索
$ composer require html2text/html2text # 取得
```