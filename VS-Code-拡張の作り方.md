# VS Code 拡張の作り方
Emacs の time-stamp みたいなことをするシンプルな拡張を作る。

- `yo` でプロジェクトを生成できる。
    - [Visual Studio Code はじめての拡張機能開発 - Qiita](https://qiita.com/rma/items/8c53077d1355ab8fa4c6)
- [Run on Save](https://github.com/emeraldwalk/vscode-runonsave) で近いことはできるし、参考にもなる。
- タイミングは onWillSaveTextDocument になるはずだがサンプルコードがなかなかヒットしない。
    - [vscode-final-newline/extension.ts at master · SamVerschueren/vscode-final-newline](https://github.com/SamVerschueren/vscode-final-newline/blob/master/extension.ts#L41-L54)
- アクティベーション（ロード）のタイミングは package.json で指定する。今の場合は `*` しかない。
- 設定まわりは上記の Run on Save がわかりやすい。ロードはコードだが雛形は package.json で記述する。
- ストアを経由しないインストール手段として vsix ファイルを作成できる。
    - [Packaging Extensions](https://code.visualstudio.com/docs/extensions/publish-extension#_packaging-extensions)
    - [Install from a VSIX](https://code.visualstudio.com/docs/editor/extension-gallery#_install-from-a-vsix)
        - 本体 GUI にも「VSIX からのインストール…」がある。
- とりあえず初版ができた。しばらく使って様子見。
    - [lpubsppop01/vscode-auto-timestamp: A Visual Studio Code extension that update timestamp field when saving document.](https://github.com/lpubsppop01/vscode-auto-timestamp)