# Visual Studio なしでの TypeScript ビルド
```
何を使うのが標準的なのかよくわからないが、メモっておく。

* Sublime Text には TypeScript コンパイル用のアドイン？があるらしい。
* tsc にオプションをテキストファイルから読み取るオプション？がある。
  ---
  $ cat build.txt
  --sourcemap js/model.ts
  --sourcemap js/index.ts

  $ tsc @build.txt
  ---
* TypeScript の処理系自体は Makefile でビルドするらしい。
* mono 由来の msbuild 実装（xbuild？）は NuGet 参照を扱えるけど
  パッケージ側で PowerShell を使っているとそこは無視されるらしい。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2014-07-13T11:46:44+09:00