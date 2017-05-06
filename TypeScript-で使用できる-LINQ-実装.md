# TypeScript で使用できる LINQ 実装
実装がたくさんある。とりあえず以前からある linq.js を使うけど、他も試すかもなので一応メモ。
- [linq.js](http://neue.cc/reference.htm)
    - npm：[linq](https://www.npmjs.com/package/linq)
    - たしかこれが最初に登場した実装。登場したとき話題になっていた。
    - TypeScript も考慮されている。
        - [neue cc - linq.jsのTypeScript対応とTypeScript雑感](http://neue.cc/2012/10/12_382.html)
    - メソッド名が小文字からになっているのはこの実装だけ。
    - TypeScript からは `import * as Enumerable from "linq";` で利用できる
- [LinQ for TypeScript](https://github.com/kutyel/linq.ts)
    - npm：[linqts](https://www.npmjs.com/package/linqts)
- [TypeScript - LINQ for ECMAScript 2015](https://github.com/lord-saumagen/TypeScript-LINQ)
    - npm：[typescript-linq](https://www.npmjs.com/package/typescript-linq)
- [linq-es2015](https://github.com/ENikS/LINQ)
    - npm：[linq-es2015](https://www.npmjs.com/package/linq-es2015)