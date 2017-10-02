# GrepGUI
ripgrep は超高速でナイスなんだけど、いけてる GUI ラッパーがほしくなった。
- VS Code は検索用に起動するには大物感があるし、検索結果があまり見やすくない。
- 非プログラマには勧めづらい。
- 秀丸 grep も案外遅いようなのでそういう人にも使ってもらえるように。

毎度 WPF ばかりで飽きたのでまた TypeScript でやってみようかと。
まず .NET の Process クラスっぽいことを Node.js でできないか。
- [Node.jsで子プロセスの標準入出力を処理する - 情報アイランド](http://info-i.net/child-process-spawn-stdio)
- [Child Process | Node.js v8.6.0 Documentation](https://nodejs.org/api/child_process.html)