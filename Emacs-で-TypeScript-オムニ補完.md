# Emacs で TypeScript オムニ補完
```
el-get で　tss をインストール。
---
(el-get 'sync '(tss json-mode))
---
tss に typescript-mode.el の改変版が含まれているので、TypeScript の編集自体これだけでよし。
json-mode は依存先に抜けているようで、本来は tss だけでいい。

tss は typescript-tools というのを使用するため npm でインストールしておく。
---
> npm install -g typescript-tools
---

init ファイルに以下を追加。
---
;; 同梱されたtypescript.elを使う場合
(require 'typescript)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

(require 'tss)

;; キーバインド
(setq tss-popup-help-key "C-:")
(setq tss-jump-to-definition-key "C->")

;; 必要に応じて適宜カスタマイズして下さい。以下のS式を評価することで項目についての情報が得られます。
;; (customize-group "tss")

;; 推奨設定を行う
(tss-config-default)
---

とりあえず少し試した分には安定してそうだったが、
ちょっと入力時にカクついた（gnupack emacs 2.4 on Windows 8.1 x64）。

関係ないが、いつの間にか helm の検索が早くなってたのが作業中うれしかった。
とても快適。

------------------------------------------------------------------------

EmacsでTypescript編集時、auto-complete.el/flymake.elを使って入力補完/文法チェックができるtss.elを作りました - 死ぬまでの暇潰し:
http://aki2o.hatenablog.jp/entry/2013/08/11/Emacs%E3%81%A7Typescript%E7%B7%A8%E9%9B%86%E6%99%82%E3%80%81auto-complete.el/flymake.el%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6%E5%85%A5%E5%8A%9B%E8%A3%9C%E5%AE%8C/%E6%96%87%E6%B3%95%E3%83%81%E3%82%A7%E3%83%83

emacs-tss/README-ja.md at master - aki2o/emacs-tss - GitHub:
https://github.com/aki2o/emacs-tss/blob/master/README-ja.md

clausreinke/typescript-tools - GitHub:
https://github.com/clausreinke/typescript-tools
```

------------------------------------------------------------------------

Converted from Evernote content created at 2014-07-12T23:37:52+09:00