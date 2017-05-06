# generator-node-typescript で生成したプロジェクトでテストできない？
`yo node-typescript` で生成したプロジェクトで `npm run test` としてもエラーで動かない。
```
Using TypeScript
Version 2.3.2
Warning: Could not find any test files matching pattern: 'test/**/*-spec.ts'
No test files found

npm ERR! Windows_NT 10.0.14393
npm ERR! argv "C:\\Program Files\\nodejs\\node.exe" "C:\\Program Files\\nodejs\\node_modules\\npm\\bin\\npm-cli.js" "run" "test"
npm ERR! node v7.10.0
npm ERR! npm  v4.2.0
npm ERR! code ELIFECYCLE
npm ERR! errno 1
npm ERR! howm-js@0.0.0 test: `npm run build && mocha --compilers ts:ts-node/register --recursive 'test/**/*-spec.ts'`
npm ERR! Exit status 1
npm ERR!
npm ERR! Failed at the howm-js@0.0.0 test script 'npm run build && mocha --compilers ts:ts-node/register --recursive 'te
st/**/*-spec.ts''.
```

`**` は bash の拡張書式らしい。怪しいかと思ったが、全て外しても変わらなかった。
- [Wild card path with ** does not seems to be working for a lot of tools · Issue #18 · keithamus/npm-scripts-example · GitHub](https://github.com/keithamus/npm-scripts-example/issues/18)

しかし直接 mocha を実行するとちゃんと動く。node_modules にあるけど、PATH が通った場所にもないとだめなのか。
```
PS> node .\node_modules\mocha\bin\mocha --compilers ts:ts-node/register --recursive 'test/**/*-spec.ts'
```

`'test/**/*-spec.ts'` を展開しているのは mocha の方、と思う。しかし PowerShell では通る上のコマンドが cmd だと No test files found になる。謎だ。