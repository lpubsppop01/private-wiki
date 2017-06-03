# EmacsKeys 私家版
自分用に手を入れて使うように fork したリポジトリが以下：
- [lpubsppop01/EmacsKeys: Emacs key bindings for Visual Studio](https://github.com/lpubsppop01/EmacsKeys)

変更点をここにメモしておく：
- vs2017 に移行（vs2013 以降で動作するように）
- kill-line 後にペーストすると挿入される内容が古い
    - 以前から使用している私家版ではこの対策をしているが、下記の通り問題があったようだ
- （未）コピー＆ペーストしたとき意図しない内容が挿入される場合がある
    - おそらくコピーとペーストが別々のビューのときに起こりうる
    - kill-ring の管理はビュー毎（使わないから憶測だけど Emacs がバッファ毎に管理なのかも）
    - 使用中の私家版はペースト前にバッファをフラッシュしているため、ペーストするビューのバッファに何か入っているとその内容で上書きされる、と考えられる
    - クリップボードを監視してバッファをクリアする？
        - [NuGet Gallery | ClipboardMonitor 0.3.0](https://www.nuget.org/packages/ClipboardMonitor/)
            - Listener の登録を解除してない気がする
        - [プログラミングTips : クリップボードの変化の検知を簡単に](http://www.geocities.jp/iooiau/tips/watchclipboard.html)
    - しかし kill-ring 自体オミットした方がいい結果になるような気もする
        - いや、この問題は kill-ring ではなくバッファの問題だから関係ないか