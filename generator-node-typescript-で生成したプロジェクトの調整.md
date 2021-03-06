# generator-node-typescript で生成したプロジェクトの調整
`yo node-typescript` で生成したプロジェクトで `npm test` としてもエラーで動かない。どうも Windows だとだめなやつっぽい。
```
Warning: Could not find any test files matching pattern: 'test/**/*-spec.ts'
No test files found
...
npm ERR! howm-js@0.0.0 test: `npm run build && mocha --compilers ts:ts-node/register --recursive 'test/**/*-spec.ts'`
npm ERR! Exit status 1
```

mocha の実行部分を cmd で実行してみたところ `'test/**/*-spec.ts'` だとマッチせず `"test/**/*-spec.ts"` では OK だった（PowerShell は両方 OK）。
なので package.json の test を以下のように書き換えると動くようになる。
```
 "test": "npm run build && mocha --compilers ts:ts-node/register --recursive \"test/**/*-spec.ts\""
```

node_modules の下の mocha を実行できているのは `node_modules/.bin` に自動で PATH が通るかららしい。
- [npm で依存もタスクも一元化する - Qiita](http://qiita.com/Jxck_/items/efaff21b977ddc782971)

---

デフォルトでは TSLint が１ファイル１クラスを要求してくるけど、細かいモデルクラスくらい１ファイルに押し込めておきたいので設定ファイル `tslint.json` を変更。あとプロパティのアクセス修飾子必須をオフ。
```
{
  "extends": "tslint:latest",
  "rules": {
    "max-classes-per-file": false,
    "member-access": false,
    "object-literal-sort-keys": false,
    "trailing-comma": false
  }
}
```

"use strict" については TypeScript は自動で付けてくれるようになったため不要。
- [TypeScript (1.8) のモジュール・クラス・型定義の書き方 - Qiita](http://qiita.com/gaaamii/items/84ef50277d962fa2c73d)

---

テストに失敗したときに npm が詳細なエラーメッセージを付け加えるのだけど、普段は邪魔なので消したい。
- [mocha vs npm test · Issue #457 · mochajs/mocha · GitHub](https://github.com/mochajs/mocha/issues/457)

`npm test -s` で loglevel が silent になる。常に silent にしたい場合は `npm config set loglevel silent` とする。

`npm config set loglevel win` は実際やってみたら invalid と怒られた。今は名称が変わったのだと思う。`warn` は valid ではあったけどメッセージは抑制されなかった。

とりあえず `npm config set loglevel silent -g` としておいた。