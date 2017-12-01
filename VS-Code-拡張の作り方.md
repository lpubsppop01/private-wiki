# VS Code 拡張の作り方
Emacs の time-stamp みたいなことをするシンプルな拡張を作る。

- `yo` でプロジェクトを生成できる。
- [Run on Save](https://github.com/emeraldwalk/vscode-runonsave) で近いことはできるし、参考にもなる。
- タイミングは onWillSaveTextDocument になるはずだがサンプルコードがほんとにヒットしない。
- アクティベーション（ロード）のタイミングは package.json で指定する。今の場合は `*` しかない。