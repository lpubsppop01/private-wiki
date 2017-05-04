# Explorer のコンテキストメニューから Cygwin 端末を開く
```
[2012-12-28 14:05] 

chere を使うのが一番容易そう。
http://d.hatena.ne.jp/eggtoothcroc/20100830/p1
http://unlearned-superficial-knowledge.blogspot.jp/2009/02/mintty.html

---
# chere -ian1 -t mintty -s bash
---
でいい感じになった。

レジストリを手でいじる方法もある。
http://www.sixnine.net/cygwin/cygwin-doc/smalltips.html
http://d.hatena.ne.jp/lf1310/20050424/1114354392

フォルダーの背景で右クリックしたときにも表示するには
手で編集するしかないようだ。
とりあえず chere だけにしておく。

------------------------------------------------------------------------

アンインストールはうまくいかなかった。環境が変わったせいかもしれない。
regedit で "Bash Prompt Here" を検索して cygwin_bash を削除した。アンインストール情報も。
なお 64 ビット版だと cygwin64_bash になる模様。

Windows - エクスプローラの右クリックメニューをカスタマイズする - Qiita:
http://qiita.com/tueda/items/0036ee8e9280f70f04f0

------------------------------------------------------------------------

↑で「フォルダーの背景で右クリックしたとき…」とあるが、
chere した時点でメニューに出ていた（レジストリもそれらしくなっていた）。
しかし、背景のメニュー経由だと環境変数が適切に設定されない。フォルダー右クリックは問題なし。
ということで背景関連の方は手で削除しておいた。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2013-03-17T19:14:19+09:00