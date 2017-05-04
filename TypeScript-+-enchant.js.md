# TypeScript + enchant.js
```
どんなものなのかなーととりあえずググッてみた感じ:

---
TypeScriptでenchant.jsを使う。 - Qiita:

http://qiita.com/hirotoshi/items/20c0a1da4ae786b9f2cb

結論：enchant.js を書くのに TypeScript を使うのは多大な労力(=非TypeScript的コードですべて書く)がかかるためやめたほうがいい。 sample.js を元に sample.ts を作成。 しかし enchant.Class.create を使ってクラスの定義をしているわけではないので必要な初期化処理が動いていないらしく動作しなかった。 enchant.jsをTypeScriptで書くための型定義を結構頑張って書いたんだけどね…。:
https://gist.github.com/vvakame/5377662

typescriptでenchant.jsのハローワールドやってみた - mizchi log:
http://d.hatena.ne.jp/mizchi/20121008/1349683129

enchant.jsをTypescriptで書いた。これはイイ！｜Diary｜なおしむ論:
http://naosim.syoyu.net/diary/enchant.js%E3%82%92typescript%E3%81%A7%E6%9B%B8%E3%81%84%E3%81%9F%E3%80%82%E3%81%93%E3%82%8C%E3%81%AF%E3%82%A4%E3%82%A4%EF%BC%81

TypeScriptでenchant.js - jsdo.it - Share JavaScript, HTML5 and CSS:
http://jsdo.it/nishink/1H0W

enchant.js interface on typescript:
https://gist.github.com/mizchi/3848981
---

単に declare で宣言だけすれば最低限使えるが TypeScript の利点が活かせない。
インターフェースを定義するのが TypeScript に適した手法だが、手間がかかる。
そのため、定番といえるインターフェース定義がどこかから手に入ればいい感じ、と言ったところ。
…日付からしてブームはもうさってる模様だが。

まぁ利点が活かせないとはいっても enchant.js を直に触るところだけの話なので、
まずは declare だけする手法で試すのがよいかな。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2015-01-13T22:49:00+09:00