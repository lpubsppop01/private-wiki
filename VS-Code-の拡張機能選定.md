# VS Code の拡張機能選定
まずキーバインド：
- Emacs Keymap：よく紹介されているがあまり好きではない
    - `C-x h` がないなど機能的に１段劣る
    - kill-ring 優先でクリップボードを使うコピー＆ペーストが別コマンド
- Emacs Friendly Keymap が頭ひとつ抜けているように思う
    - kill-ring をやめてシステムクリップボードを使用（ナイス判断）
    - `C-x 2` などのバッファ分割をサポート

Ctrl-l でスクロール：
- keyboard-scroll：よく紹介されており必要十分

モードライン：
- Modelines：Emacs で作成したファイルを開くとき便利なはず

EditorConfig：
- EditorConfig for VS Code：初めて使ったので比較できないけど、まともに動作してる

Git まわり：
- Git History (git log)：便利だけどこれくらい標準でほしいと思っちゃう