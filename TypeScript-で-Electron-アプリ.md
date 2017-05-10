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

generator-node-typescript で作ったプロジェクトで必要なパッケージを入れて試す。electron の方は初回はファイルのダウンロードに失敗したらしかったけど２回目で成功。
```
$ npm install electron --save
$ npm install @types/electron --save
```

import まわりの構文で迷ったが、以下の書き方は通用した。
* [electron-typescript-sample/main.ts at master · sourcechord/electron-typescript-sample · GitHub](https://github.com/sourcechord/electron-typescript-sample/blob/master/main.ts)