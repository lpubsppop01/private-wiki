# Node.jsをポータブルに使う
```
職場での HTML→PDF 変換に electron-pdf を紹介したいのだが、
各自で Node.js をインストールして npm で electron-pdf を入れてもらうというのが
ちょっと無理がある気がするので調査。
（定番の wkhtmltopdf はどうもレイアウトが崩れるしフォント反映もいけてない。）

ポータブル版を配布しているサイトはいくつかあるから潜在的には普通に動く。
おそらく自分のマシンの c:\Program Files\nodejs をコピーして、
環境変数 PATH と NODE_HOME だけ用意するスクリプトで設定すれば OK っぽい。

DoSomethingWithPortableNodeJS.ps1
---
# ./nodejs を優先して使用する設定
$myNodeJSDirPath = Join-Path (Split-Path $MyInvocation.MyCommand.Path) "nodejs"
$env:Path = "${myNodeJSDirPath};${env:Path}"
$env:NODE_PATH = Join-Path $myNodeJSDirPath "node_modules\npm"

# ./nodejs に npm install -g でパッケージをインストールするとき用
#npm config set prefix $myNodeJSDirPath # レジストリ変更
#npm config rm prefix # 削除でデフォルトに戻る
---

自宅マシンでは問題なく electron-pdf まで動作した。しかしこれ Markdown から PDF も直でいけるのね…。
nodejs のサイズは作業後で 200MB いかない程度だったので問題ないだろう。

---

node.jsとnpmをポータブルで使う（Windows版） | ウェブゴト
http://webgoto.net/239/
```

------------------------------------------------------------------------

Converted from Evernote content created at 2017-04-20T23:22:54+09:00