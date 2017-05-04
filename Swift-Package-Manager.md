# Swift Package Manager
```
Swift OSS 版および ver3.0 にはパッケージマネージャが付属しているということでお試し。
環境は Mac OS X EI Capitan。

まず XCode 7.3 に付属している Swift 2.2 には目当てのパッケージマネージャはまだない。
そのため現状だと Swift.org<https://swift.org/download/> から
新しい Toolchain を入手する必要がある（OSS 版なら ver2 系でもある？）。
さらに beta 3 で試したら以下のように怒られたので XCode 8 も必要。
一応 8/7 版も試したが同様だった。
---
<unknown>:0: error: Swift does not support the SDK 'MacOSX10.11.sdk'
---

XCode 8 は https://developer.apple.com/download/ から beta 5 を入手。
"XCode betaを検証中…" でバーが MAX まで行っても起動しないので調べたところ、Gatekeeper による検証で設定でパスできるらしい。
http://qiita.com/gooichi/items/5463ef7134723858f77a
xattr は sudo なしだとパーミッションで怒られた。
xattr もかなり時間がかかる。
完了後、使用する XCode を切り替えるため以下を実行。
---
$ sudo xcode-select -s /Applications/Xcode-beta.app
---
http://stackoverflow.com/questions/38037971/run-swift-3-from-command-line-using-xcode-8-beta

以下にパスを通すと最新バージョンのコマンドが実行される。

/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin

いろいろエラー・ワーニングが出たがなんとか起動した。

エラーは Python の six というパッケージがないためらしい。
pip で six を入れたらきれいに動くようになった。
http://qiita.com/dondoko-susumu/items/c89718ddfe2132309f8e

---

それでも動かないので諦めて brew で HEAD を入れてみる。
---
$ brew install swift --HEAD
---
cmake, ninja, swift がインストールされ…ない。
---
build-script: error: unknown argument: --build-jobs
---
ぬう。タイミングが悪かったか。

---

インストールは散々遠回りして結局解決してないが、チュートリアルは充実している。
はやく試したい。
https://swift.org/getting-started/https://swift.org/getting-started/

---

チュートリアルにはないテストを含めた構成例:
https://ankit.im/swift/2016/02/17/swift-package-manager-testing-preview/

ただ Mac で試してみたところ build が終わらない。
環境全体が重くなり使いものにならない感じだった。
現時点では別途ビルドツールを用立てないと無理そう。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2016-08-12T20:32:52+09:00