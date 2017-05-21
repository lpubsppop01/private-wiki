# TypeScript で Electron アプリ
[[TypeScript による Node.js モジュールのプロジェクト管理について]] の続きで Electron アプリの開発方法。
* [.NET使いが始めるElectron開発環境構築 - Qiita](http://qiita.com/misumame/items/9196eb8ad9473c79d22b)
* [TypeScriptでElectronアプリを書いてみる - Qiita](http://qiita.com/JunSuzukiJapan/items/4a1a0274a2771cdc0ae2)
* [TypeScript+Electronでデスクトップアプリを作ってみる - SourceChord](http://sourcechord.hatenablog.com/entry/2015/10/19/004044)

どういう方向でいこうか。
- インストールするパッケージは `electron` でいいらしい。
- UI を提供するあたりが影響してか、Augular2 などのフロントエンド向けフレームワークと組み合わせるのが主流になっている？
    - シンプルなプロジェクトジェネレータが見つからない
    - Angular2 か React が主流か？

とりあえずハローワールドを書いてみて、また考えよう。

---

generator-node-typescript をベースに試行したが、たぶん以下のサンプルを clone して試した方がよかった。シンプルかつ現在も通用する書き方になってる。
- [GitHub - sourcechord/electron-typescript-sample: Sample for 'Electron + TypeScript App'](https://github.com/sourcechord/electron-typescript-sample)
    - 他にもよさそうなサンプルがある。Monaco とか完全に忘れてた。

必要なパッケージは以下のふたつ。electron の方は初回はファイルのダウンロードに失敗したらしかったけど２回目で成功。
```
$ npm install electron --save
$ npm install @types/electron --save
```

- import は `import * as electron from "electron";` と `import {app, BrowserWindow} from "electron";` くらいで OK
- `__dirname` は Node.js を実行したディレクトリから main の js ファイルへの相対パスのため、TypeScript の場合はコンパイルされた js ファイルの位置に注意

---

ローカル完結の Web アプリを作ってるという捉え方の方がいいのか？とも思ったけど、いちいちサーバーと通信しなくても Node.js の機能を使ってローカルリソースにアクセスできたりする手っ取り早いところもまた利点らしい。Web アプリをそのまま動かすこともできるみたいだけど、その場合は普通にポートを使うことになるし。

---

Angular 2 をほどほどに勉強してきた：
- [[Angular 2 の学習]]

次は Electron との組み合わせ。
- [ElectronとAngular2でHello World | キャスレーコンサルティング　技術ブログ](http://www.casleyconsulting.co.jp/blog-engineer/linux/electron%E3%81%A8angular2%E3%81%A7hello-world/)
- [Angular2で書いたコードをElectronで動かしたら値がバインドできなかった話 - Qiita](http://qiita.com/amaya4869/items/38c846a470d0528e1aeb)
- [Electron + Angular2でMarkdownでスライドを作れるプレゼンテーションツールを作っている - Please Drive Faster](http://joe-re.hatenablog.com/entry/2016/04/12/095931)

---

その他の参考リンク：
- [Angular.jsのディレクトリ構成のベストプラクティスを探る - Qiita](http://qiita.com/n0bisuke/items/6a79d3ee63020f771260)