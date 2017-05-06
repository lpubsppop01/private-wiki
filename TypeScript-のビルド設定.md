# TypeScript のビルド設定
TypeScript のビルド（JavaScript への変換）に関する設定は tsconfig.json で行う。書式は以下の感じ。
- [TypeScriptのビルド設定をES5からES6に変えた時にエラーが発生した時の解決 - Qiita](http://qiita.com/nyamogera/items/560ad4aeeb7e31578795)

出力される JavaScript は target の値に従う。VS Code のツールチップによれば target の選択肢は es3、es5、es2015、es2016、es2017、esnext とのこと。

処理系のサポート状況を考慮しないとだめなものだからむやみに上げてはだめなのだろうけど、とりあえず上げると使えるものがある。
- es2015（= ECMAScript2015/6）にすると String.startsWith() が使える。