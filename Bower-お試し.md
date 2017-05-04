# Bower お試し
```
Web ベースプロダクトのクライアント側向けパッケージマネージャ。
以前に勉強会でちらっと見たのをお試し。
---------------------------------------------------------------

インストールは Node.js の npm コマンドから:
---
$ npm install -g bower
---

例えば以下のように使用できる:
---
$ bower install jquery
---

Cygwin bash から Windows 版 Node.js の npm を呼ぶ変則パターンでも特に問題なく動作した。
メッセージを見るに git は Cygwin のものが使用されていたみたい。
---------------------------------------------------------------

実用上は作業ディレクトリのトップに bower.json というファイルを置いて
使用する JavaScript パッケージを記述する。
jquery と linq.js、bootstrap を使用する例:
---
{
  "name": "dqxchourisozai",
  "version": "1.0.0",
  "dependencies": {
    "jquery": "^2.2.3",
    "linqjs": "^3.0.5",
    "bootstrap": "^3.3.6"
  }
}
---
後は "bower install" とか "bower update" とかすればここで挙げたパッケージがダウンロードされる。
手書きでもいいが "bower init" とすると上記ファイルの雛形が生成され、
"--save" オプション付きでインストールすると勝手に追加されていく模様。

このままインストールすると bower_components というディレクトリに配置されるが、
これが嫌な場合は .bowerrc というファイルを置いて以下のように指定する:
---
{
  "directory": "js/bower_components",
  "json": "bower.json"
}
---

とりあえずこれだけでも手間削減にはなりそうだ。
---------------------------------------------------------------

パッケージマネージャー「Bower」が大変便利で捗りそうです - Mach3.laBlog:
http://blog.mach3.jp/2013/01/29/bower.html

bowerのdependenciesのインストール先を指定する - Qiita:
http://qiita.com/sys1yagi/items/0a7b13395cf5c16ecd57

Node.jsのpackage.jsonのバージョン指定の"~（チルダ）"と"^（キャレット）"の違い - Qiita:
http://qiita.com/kondei/items/9ee1bd9bc15c86a63070
```

------------------------------------------------------------------------

Converted from Evernote content created at 2016-04-26T23:59:35+09:00