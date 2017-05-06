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
npm ERR! Make sure you have the latest version of node.js and npm installed.
npm ERR! If you do, this is most likely a problem with the howm-js package,
npm ERR! not with npm itself.
npm ERR! Tell the author that this fails on your system:
npm ERR!     npm run build && mocha --compilers ts:ts-node/register --recursive 'test/**/*-spec.ts'
npm ERR! You can get information on how to open an issue for this project with:
npm ERR!     npm bugs howm-js
npm ERR! Or if that isn't available, you can get their info via:
npm ERR!     npm owner ls howm-js
npm ERR! There is likely additional logging output above.

npm ERR! Please include the following file with any support request:
npm ERR!     C:\Users\kotaro\AppData\Roaming\npm-cache\_logs\2017-05-06T04_28_10_563Z-debug.log
```

`**` は bash の拡張書式らしい。使ったことないけどたぶん descendants。
* [Wild card path with ** does not seems to be working for a lot of tools · Issue #18 · keithamus/npm-scripts-example · GitHub](https://github.com/keithamus/npm-scripts-example/issues/18)

どうしたものか。