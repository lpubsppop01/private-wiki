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

Angular 2 をほどほどに勉強してきた：
- [[Angular 2 の学習]]

次は Electron との組み合わせ。いろいろやり方はあるようだけど `ng` が気に入ったので生かす方向で。
- [Electron + Angular2でHello, World! | backport](http://backport.net/blog/2017/02/26/electron_meets_angular2/)
- [Integrating Electron with angular CLI : Angular2](https://www.reddit.com/r/Angular2/comments/56p5wm/integrating_electron_with_angular_cli/)

手順は以下のように：
```
$ ng new project-name
$ cd project-name
$ npm install electron --save
$ npm install electron-packager --save-dev
```

あれこれ：
- 開発・デバッグ中は `ng serve` した URL を `BrowserWindow.loadURL()` で開く。
- `ng new` が生成する `src/index.html` の `<base href="/">` を削除すると `BrowserWindow.loadURL()` にファイルパスを指定しても動作するようになる。
- electron-packager で生成した exe を実行するとエラーが出るのが未解決。
    - electron-packager は指定したディレクトリの中の node_modules を同梱するため、普通に npm build した dist ディレクトリに node_modules がないのが原因か？と思ったがコピーではだめだった。
    - electron 用の package.json を dist にコピーする？

---

その他の参考リンク：
- [Angular.jsのディレクトリ構成のベストプラクティスを探る - Qiita](http://qiita.com/n0bisuke/items/6a79d3ee63020f771260)
- [ElectronとAngular2でHello World | キャスレーコンサルティング　技術ブログ](http://www.casleyconsulting.co.jp/blog-engineer/linux/electron%E3%81%A8angular2%E3%81%A7hello-world/)
- [Angular2で書いたコードをElectronで動かしたら値がバインドできなかった話 - Qiita](http://qiita.com/amaya4869/items/38c846a470d0528e1aeb)
- [Electron + Angular2でMarkdownでスライドを作れるプレゼンテーションツールを作っている - Please Drive Faster](http://joe-re.hatenablog.com/entry/2016/04/12/095931)
- [React.js + Photon.css + Webpack で Electronのサンプルアプリを作ってみた - yuumi3のお仕事日記](http://yuumi3.hatenablog.com/entry/2016/05/23/112850)