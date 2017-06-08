# Feedly の Read Later をエクスポート
Feedly のエクスポート機能は登録したエントリを出力するだけで、Read Later は対象外。
これを転用できる形で取り出す方法について。

1. 開発ツールとしてインスペクターが備わっているブラウザ（最近はどれでもありそう）で Read Later を開き、最後までスクロール。マウスホイールクリックでスクロールするようにしてしばらく放置がいい。
2. 最後までスクロールしたら該当部分の div をインスペクターでコピーしてテキストエディタに貼り付け。非常に重い。
    - 別解として全選択からソースを表示・保存という手段もあるらしいけど、実際やったら終わらなかった。
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

PowerShell で URL だけ取り出すなら以下のように：
```
PS> $xml = [xml](gc read_later.txt)
PS> $xml.div.div | select data-alternate-link | 
```

しかしどう扱ったものか。

---

参考：
- [Feedlyの「Saved for later」をEvernoteにエクスポートする方法 | いけいけどんどん](http://kazlog.jp/archives/2750)
- [FeedlyのSaved For LaterをエクスポートしてPocketへ移行する方法](http://tsukuba42195.top/?p=927)