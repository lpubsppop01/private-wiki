# Feedly の Read Later をエクスポート
Feedly のエクスポート機能は登録したエントリを出力するだけで、Read Later は対象外。
これを転用できる形で取り出す方法について。

1. 開発ツールとしてインスペクターが備わっているブラウザ（最近はどれでもありそう）で Read Later を開き、最後までスクロール。マウスホイールクリックでスクロールするようにしてしばらく放置がいい。
2. 最後までスクロールしたら該当部分の div をコピーしてテキストエディタに貼り付け。非常に重い。
3. テキストファイルとして保存。
4. 適当な言語で XML としてパースして URL などを取り出す

構造としては `<div class="list-entries">` の下に各エントリの `<div>` が並んでいる。属性は以下のような感じ：
```
id                  : HiiLeJmt8ZIHZsgr3qPcBv/WarRYsZ6zkuLqu783sIg=_1586f668da0:211bbdd:1e99f69f_main
class               : entry quicklisted read u4 density-29
data-alternate-link : https://hardware.srad.jp/story/16/11/16/1419240/
data-dot            : first-story
data-entryid        : HiiLeJmt8ZIHZsgr3qPcBv/WarRYsZ6zkuLqu783sIg=_1586f668da0:211bbdd:1e99f69f
data-navigation     : inline
data-title          : Samsung、JBLやAKGなどで知られるHarmanを買収
data-inlineentryid  : HiiLeJmt8ZIHZsgr3qPcBv/WarRYsZ6zkuLqu783sIg=_1586f668da0:211bbdd:1e99f69f
data-u              : 4
div                 : {div, div}

```