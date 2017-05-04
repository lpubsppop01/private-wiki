# PHP html2text はどの実装がいい？
html2text という名称のライブラリは Composer で検索すると 4 件ヒットする。
* html2text/html2text はおそらく [https://github.com/mtibben/html2text](https://github.com/mtibben/html2text) だと思う。しっかり動作はするがリンクを変換すると content[href] みたいな形になるため Markdown に移行したい場合は不都合。
* soundasleep/html2text は [https://github.com/soundasleep/html2text](https://github.com/soundasleep/html2text) だろう。こちらは content と href が一致する場合は片方のみ、不一致の場合は `[Content](URL)` の Markdown リンクを生成する。
    + 処理の早い段階で NBSP を半角スペースに変換するためコードブロックなどのインデントが崩れる。とりあえず変換する前に `&nbsp;` を `_NBSP_` に置換しておいて後で再置換する形で回避。