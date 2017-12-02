# VS Code 拡張の作り方
Emacs の time-stamp みたいなことをするシンプルな拡張を作る。

- `yo` でプロジェクトを生成できる。
    - [Visual Studio Code はじめての拡張機能開発 - Qiita](https://qiita.com/rma/items/8c53077d1355ab8fa4c6)
- [Run on Save](https://github.com/emeraldwalk/vscode-runonsave) で近いことはできるし、参考にもなる。
- タイミングは onWillSaveTextDocument になるはずだがサンプルコードがなかなかヒットしない。
    - [vscode-final-newline/extension.ts at master · SamVerschueren/vscode-final-newline](https://github.com/SamVerschueren/vscode-final-newline/blob/master/extension.ts#L41-L54)
- アクティベーション（ロード）のタイミングは package.json で指定する。今の場合は `*` しかない。