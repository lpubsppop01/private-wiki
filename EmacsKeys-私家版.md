# EmacsKeys 私家版
自分用に手を入れて使うように fork したリポジトリが以下：
- [lpubsppop01/EmacsKeys: Emacs key bindings for Visual Studio](https://github.com/lpubsppop01/EmacsKeys)

変更点をここにメモしておく：
- vs2017 に移行（vs2013 以降で動作するように）
- kill-line 後にペーストすると挿入される内容が古い
    - 以前から使用している私家版では対策しているが下記の通り問題あり
- コピー＆ペーストしたとき意図しない内容が挿入される場合がある
    - おそらくコピーとペーストが別々のビューのときに起こりうる
    - キルされた文字列のバッファ（以下、キルバッファ）、マークはビュー毎に管理されている
        - `ITextView.Properties.GetOrCreateSingletonProperty()`
    - ClipboardRing（kill-ring）は全体でひとつ（Service として取得された EmacsCommandsManager がひとつだけ保持）
    - 使用中の私家版はペースト前にキルバッファをフラッシュしているため、ペーストするビューのバッファに何か入っているとその内容で上書きされる、と考えられる
    - ビューからフォーカスが外れた時にもフラッシュするようにした