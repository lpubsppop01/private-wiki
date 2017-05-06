# electron-howm 開発メモ
[howm](http://howm.osdn.jp/index-j.html) のメニュー・一覧に相当する機能を提供するツール。
テキスト編集はエディタを使う感じ。
整備された Emacs がなくてもそれなりにメモの作成・編集・検索ができるように。

その他妄想：
- TypeScript + Electron で作ってみたい（タイトルに入っちゃってるけど）
- n-gram 索引（実験用）

howm の詳細ページを改めて読むとすごく多機能。これは electron-howm-subset かな。
- [README.ja.rd](http://howm.osdn.jp/README-j.html)

---

まずはパーサーを作成。