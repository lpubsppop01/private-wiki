# TypeScript による Node.js モジュールのプロジェクト管理について
ゴールは Visual Studio Code + TypeScript で Node.js モジュールを作成すること。2017/05 に調査。

まずそもそもの Node.js モジュールについて。ライブラリを書くなら package.json と lib/index.js を用意する感じ。
- [3分でできるnpmモジュール - Qiita](http://qiita.com/fnobi/items/f6b1574fb9f4518ed520)

Node.js のモジュールの仕組みは CommonJS という仕様に基づいており、新しい ES Modules（ES2015 のモジュール仕様）にどう対応するのかというのが昨年のホットな話題だったらしい。現時点でどうなっているのかはよくわからない。
- [ES Modules と Node.js について - from scratch](http://yosuke-furukawa.hatenablog.com/entry/2016/05/10/111102)

ときどき出てくる gulp はビルドツールのこと。
- [現場で使えるgulp入門 - gulpとは何か | CodeGrid](https://app.codegrid.net/entry/gulp-1)

---

TypeScript での Node.js モジュールの扱いについて。
- [TypeScript のモジュールの使い方 - 鷲ノ巣](http://tech.blog.aerie.jp/entry/2015/12/11/000000)

増える要素としては以下があるみたい。
- tsconfig.json プロジェクト定義ファイル
- JavaScript モジュールに対して静的な型チェックを有効にするための型定義ファイル

型定義ファイルの管理ツールとして現在は Typeings が推奨されている。
- [TypeScriptの型定義管理ツールTypingsについて - Qiita](http://qiita.com/literalice/items/d83249a5646abcb0bec6)

---

VS Code で開発を行う場合には何か増えることはあるか。
- [Visual Studio Code で TypeScript をはじめよう](https://r2.ag/vscode-typescript/)

VS Code に特有のファイルとしては以下。
- `.vscode/tasks.json`：タスク（task runner）の設定。ビルドなどを VS Code から実行できる。
- `.vscode/launch.json`：デバッガの設定。

---

単体テストフレームワークでメジャーなのは mocha、karma、jasmine 辺り。
- [TypeScript でユニットテストする。カバレッジもねっ!! - Syati.info](http://blog.syati.info/post/typescript_coverage/)
- [Karma, Mocha, Chaiを使ってTypeScriptでのテスト環境を構築する - $shibayu36->blog;](http://blog.shibayu36.org/entry/2016/04/12/180000)
- [Chaiをやめてpower-assertを使うことにした - WEB SALAD](http://web-salad.hateblo.jp/entry/2016/01/26/083000)

どれかを使うというのではなく組み合わせるらしい。
- Mocha は単体テストフレームワークだけど Assertion ライブラリは含まれていない。
    - リンク先で使用している Assertion ライブラリは power-assert と Chai。
    - Mocha には test runner も含まれているが、機能面で Karma に及ばないため組み合わせるのが定石らしい？
- Jasmine も単体テストフレームワーク。ググった感じでは Mocha の方が優勢に感じる。
- Karma はテスト実行環境（test runner）。テスト前にビルドするとかの面倒を見てくれる。

ひとまず Mocha + power-assert でシンプルに始めればいいか。

---

プロジェクトテンプレートまわり。giter8 的なやつ。どうも Yeoman がそうらしい。
https://www.slideshare.net/mobile/girigiribauer/20130629-yeoman

generator-generator と npm link で自分用のお手軽テンプレートができる。これに限らず npm link は覚えておこう。

---

TODO: 結局どういうファイル構成になるのか？

---

その他の参考リンク。
- [javascript - Writing NPM modules in Typescript - Stack Overflow](http://stackoverflow.com/questions/30928253/writing-npm-modules-in-typescript)
- [GitHub - bitjson/typescript-starter](https://github.com/bitjson/typescript-starter)
- [GitHub - Codesleuth/vscode-typescript-boilerplate](https://github.com/Codesleuth/vscode-typescript-boilerplate)