# Octave インストール周り
```
Chocolatey でインストールした Octave のトラブルメモ。
Win10Pro で Cygwin あり環境。

・Chocolatey の Octave パッケージは以下ふたつあるが、前者は 3.6.4 と古くメンテされてないっぽい。
  https://chocolatey.org/packages/Octave
  https://chocolatey.org/packages/octave.portable
　後者の方は zip 版をダウンロード・展開するのだが、
　展開に時間がかかりすぎてタイムアウトするので以下のようにオプション指定が必要だった。
　> choco install octave.portable --execution-timeout 36000

以下は気づかずに 3.6.4 でやっていたときのメモなので 4.2 では当てはまらないかも。

・Chocolatey でインストールした Octave がシンタックスエラー時にそのまま cmd ごと閉じてしまう対策。
　-i --line-editing オプションを足す。プロンプトが表示されないのも同時に改善した。よくわからん。

　Problems with Octave on Windows 8: crashes after any error - Stack Overflow
　http://stackoverflow.com/questions/17513864/problems-with-octave-on-windows-8-crashes-after-any-error

・画像出力に Ghostscript が必要？なのだが、Chocolatey の依存関係では入らない。
　choco install ghostscript で入るものでとりあえず問題ないが、PATH 設定は手動で必要。
　日本語は怪しい（cjk フォント入れてない）はずだが、
　そもそも Octave が日本語はじくので他用途で使わないならこれで十分。

2017/04/23
Octave Online というのがあった。
https://octave-online.net
マシン個別に入れないでもたぶんこれで足りる。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2017-03-20T14:12:05+09:00