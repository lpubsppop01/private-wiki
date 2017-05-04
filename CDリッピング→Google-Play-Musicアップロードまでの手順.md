# CDリッピング→Google Play Musicアップロードまでの手順
```
久しぶり過ぎて使っていたツールの近況とかわからなくなっていたのでメモ。
環境はWindows 10 Pro x64。
・CDexは今の環境ではリッピング開始後間もなく落ちるため実用外。
・EACはリッピングだけは可。日本語freedbからのタグ取得がうまくいかなかった。
・Mp3tagは正常に日本語freedbからタグ取得できた。
・BonkEncは問題なく動作した。最新版は改名されているようだが試していない。

手順：
- EACでリッピング。形式はFLAC。タグは設定しない。
- Mp3tagでタグ設定。失敗したらCDソースで。
- そのままMp3tagでタグからファイル名変更。
- BonkEncで再生用のMP3を作成。
- Mp3tagでカバー画像を設定。
- Mp3gainで音量ノーマライズ。

Mp3tagのタグ設定はID3v2.3のみ書き込むようにしておいた方がいい？
確か前に乗っていた車の車載オーディオに合わせて調整した覚えがあるが、
今は車が変わっているので気にしなくてもいいかもしれない。

---

Mp3gainのGUI版を実行しようとしたらmscomctl.ocxがないと怒られた。
下記の通り作業して改善。

mscomctl.ocxとcomctl32.ocxはいずこ？ | DOOM! DOOMER!! DOOMEST!?:
http://g-taki.com/wordpress/web/6141.html
---

- 32bitのDLLだからsyswow64で登録させることは想像がついたが、肝心な最新バージョンのファイルの入手先がよくわからない。
検索でそれらしくヒットした[Microsoftダウンロードのサイト](http://www.microsoft.com/downloads/ja-jp/details.aspx?familyid=25437d98-51d0-41c1-bb14-64662f5f62fe)から、VisualBasic6-KB896559-v1-JPN.exeをとってくる。
- EXPLZHなどを使って、ファイルを解凍。
欲しいのはmscomctl.ocxと念のためcomctl32.ocx。
- エクスプローラで、c:\windows\syswow64に二つのファイルをコピー。管理者権限が必要なので、対応はそれなりに。
- コマンドプロンプトを管理者として実行。これも権限は必要。
- コマンドプロンプトで以下を入力してocxを登録する。

cd \windows\syswow64
regsvr32 mscomctl2.ocx
regsvr32 comctl32.ocx

---
```

------------------------------------------------------------------------

Converted from Evernote content created at 2016-12-13T00:01:30+09:00