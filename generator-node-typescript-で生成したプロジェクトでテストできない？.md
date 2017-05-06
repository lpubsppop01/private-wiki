# generator-node-typescript で生成したプロジェクトでテストできない？
`yo node-typescript` で生成したプロジェクトで `npm run test` としてもエラーで動かない。どうも Windows だとだめなやつっぽい。
```
Warning: Could not find any test files matching pattern: 'test/**/*-spec.ts'
No test files found
...
npm ERR! howm-js@0.0.0 test: `npm run build && mocha --compilers ts:ts-node/register --recursive 'test/**/*-spec.ts'`
npm ERR! Exit status 1
```

mocha の実行部分を cmd で実行してみたところ `'test/**/*-spec.ts'` だとマッチせず `"test/**/*-spec.ts"` では OK だった（PowerShell では両方 OK）。
なので package.json の test を以下のように書き換えると動くようになる。
```
 "test": "npm run build && mocha --compilers ts:ts-node/register --recursive \"test/**/*-spec.ts\""
```

なお、node_modules の下の mocha を実行できているのは `node_modules/.bin` に自動で PATH が通るかららしい。
- [npm で依存もタスクも一元化する - Qiita](http://qiita.com/Jxck_/items/efaff21b977ddc782971)