# Pandoc お試し
```
最近はやりの Markdown 処理系を調べていて出てきたツール。
Markdown と HTML 間だけでなく多用なフォーマットに対応している。

Haskell を嗜む開発者ならば Haskell Platform というパッケージマネージャからインストールするのが便利らしい。
自分はそうでもないので素直に本家から入手できる Windows 用インストーラを使用した。
インストール時点で PATH への追加もされており Cygwin から問題なく利用できた。

---------------------------------------------------------------

用途の都合で必要だったのがテーブルと CSS 指定のサポート。
Pandoc はテーブルはデフォルトで有効になっている。
CSS の指定は以下のように:
---
$ pandoc index.md -c style.css -o index.html
---

試してはいないが --self-contained オプションで
CSS、スクリプト、画像ファイルなどを全て data: URI スキームで埋め込んでくれるらしい。
動作するなら資料配布にかなり便利だと思う。
また docx での出力も対応している。

※Python Markdown（"pip install markdown" で入るパッケージ）も試したが、そちらは CSS 指定をサポートしてなかった。

---------------------------------------------------------------

Latest release:
https://github.com/jgm/pandoc/releases/latest

多様なフォーマットに対応！ドキュメント変換ツールPandocを知ろう - Qiita:
http://qiita.com/sky_y/items/80bcd0f353ef5b8980ee

Pandoc で Windows に作るmarkdown to html, docx 環境 - Qiita:
http://qiita.com/tsujimitsu/items/907d7a2fae2057d0fb1fhttp://qiita.com/tsujimitsu/items/907d7a2fae2057d0fb1f

Pandoc で github 風 CSS を使った standalone な html を生成 - Qiita:
http://qiita.com/griffin_stewie/items/95026360fdfca1bd8e33
```

------------------------------------------------------------------------

Converted from Evernote content created at 2016-04-25T00:06:03+09:00