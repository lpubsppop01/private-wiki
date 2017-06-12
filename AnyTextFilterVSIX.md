# AnyTextFilterVSIX
Visual Studio のコードエディタにて選択テキストを外部コマンドでフィルタする拡張を作成。
Emacs の scratch バッファみたいな感じに気楽に C# を実行して出力をコードテキストに挿入とかしたい、というところからスタートしたのだが、だいぶ汎用的になった。
名称の遷移：EditTextWith → PartialEditWith → AnyFilterVSIX → AnyTextFilterVSIX

リポジトリ：
- [lpubsppop01/AnyTextFilterVSIX: Visual Studio Extension that provides external text filters for target ranges.](https://github.com/lpubsppop01/AnyTextFilterVSIX)

---

プロトタイプ作成。
- [x] Package
- [x] OptionPage →メニュー更新の都合で没
- [x] 設定・シリアライズ
- [x] テスト用 MyEcho コマンド
- [x] コマンド実行
- [x] OptionPage をやめて通常の MenuCommand から WPF Window を開く形に変更
- [x] 設定に応じてメニューコマンド登録

整えていく。
- [x] テンプレート機能（レジストリではサイズ制限があるはず。ファイルパス指定で対応）
- [x] ユーザー入力モード（sed などを結果をプレビューしながら入力できるように）
- [x] サンプル値の設定
- [x] 置換・次行挿入の挙動を整理
- [x] 改行コード・文字コードの設定
- [x] UI、設定の変数名を見直し
- [x] 選択なしのとき現在行を対象とする
- [x] ユーザー入力ウィンドウのフォント
- [x] ユーザー入力ウィンドウ Emacs キーバインド
- [x] 設定の Set Sample を Add と統合（ダイアログ）
- [x] ビルドバージョンの自動インクリメント（Publish時のみ）
- [x] 名前を変更
- [x] コマンド数を20くらいに増加
- [x] Settingsダイアログのリストボックスで番号を表示（キーバインド設定の都合で番号が見えないと厳しい）
- [x] Readme.md、ライセンス表記など整備
- [x] github にコミット
- [x] UserInputTempFilePath を追加＋複数行入力（sedが動くのがゴール）
- [x] 国際化（WPF）→済み。動的変更の仕掛けもOK。後は切り替えのコンボをどこかに置いとく。
- [x] UserInputで差分表示（範囲が大きいと必須）
- [x] UserInput差分表示で次へ・前へ
- [x] UserInput差分表示でプレビューと元エディタのスクロール位置を同期（結果確認に使えるし、うまくいけばmigemoを使ったかな検索にも応用できる）
- [x] UserInput差分表示の設定保存（フィルタ毎に分けた方がいい？）
- [x] 選択範囲がないときの動きを選択できるように（今は現在行だがsedではバッファ全体の方が嬉しい）→動いたけどUI表記がまだ変。
- [x] 国際化（VSIX、コマンドラベルなど）
- [x] インポート・エクスポート
- [x] migemo検索
- [x] フィルタにメモ・コメント欄を追加。ファイルの取得元とか。
- [x] ドキュメントに自動作成するフォルダ構成（Programs とか Exported とか）
- [x] 説明文を更新。選択範囲ではなく対象範囲。
- [x] 改名。しないとしてもアセンブリ名に lpubsppop01 を含めるように。
- [x] 一時ファイル置き場を切り替えできるように対応（Tempだと内容確認が面倒なことが多い）
- [x] About ダイアログの README.md 表示をリッチなものに変更
- [x] ビルドを AppVayor に移行
- [x] 標準の機能で本当に同等のことができないかよく確認
    - [[Visual Studio 外部ツールの挙動確認（VS2017）]]
- [ ] ユーザー入力ウィンドウをツールウィンドウ化
    - フォーカスを得たタイミングで対象を再取得でだいたい辻褄が合う？
    - フォーカスを得たとき、現状におけるコマンド実行と同等の処理を実行することになる。結構変更が必要。
- [ ] デモ動画（gifパラパラアニメの勉強）
- [ ] しばらくバグ出し
- [ ] Develop分岐
- [ ] vs marketplaceにアップ

- デジタル署名→正攻法だと高いし、やめとく。人気のある XAML Regions もデジタル署名はされてない。
- Nugetをやめてスクリプトでダウンロード・ビルド
    - 可能なことは確認したが、Markdown XAML の使用予定がなくなったので Nugetのままでいいだろう。

やりたいけど現実味がまだないもの。
- [ ] ExtractCodeSnippet
- [ ] 動的補完（置換のときとか）

---

バグ
- [x] ユーザー入力ウィンドウをリサイズしたときの挙動
- [x] Cygwin bash で一時ファイルに出力した InputText の改行コードが設定に従ってない？ 
    - Writer.NewLineはWriteLineにしか反映されない。
- [x] 置き換えた後、後ろの改行が減ってることがある？選択範囲の最後が改行のとき。
- [x] resxファイルの説明文を短めに。
    - 一通り直した。VSIXにライセンスが埋め込まれるように対応した。
- [x] UserInput でヒントテキストが邪魔して入力テキストボックスをクリックできない。
    - IsHitTestVisibleをFalseに。しかしほんとはヒント機能つきテキストボックスを作るのがよさげ。
- [x] Popupを表示した状態でSettingsウィンドウを動かすとPopupが置き去りになる。
- [x] LICENSE.txtをリンクに変更。
    - うまくいった。GUI からはうまくいかなかったので Find In Solution Explorer を参考に csproj を書き換えた。
　　- 改行コードについては結局現状維持したがメモする必要がある。
　　    - Find In Solution Explorer は .gitattributes で text=auto を指定している。改行コードの自動変換を積極的に使っている。
　　    - cygwin で git clone したら C# コードも LF になった。
　　    - AnyFilter .gitignore だけ CRLF なのが気になったので LF に変更した。他は想定通り。
- [x] readmeのfeature detailsは言い過ぎ。featuresで。
- [x] UserInputのプレビューでタブサイズが大きい。フォントと同様にエディタからコピーしたいところ。
- [x] README.md を UserInput に流したらなぜか行高が大きい。というか二重改行？LFなのが影響している？
　　- span.GetText() で返るテキストの改行コードがソースのままで来る。ということは書き戻しもまずい。
- [x] 複数行のときCtrl-eで最後の行末まで行っちゃう。
    - 開発機だと動いてる？古かっただけか？
- [x] UserInputで処理中に書き換えたとき、実行中のタスクをキャンセルできないだろうか？
    - できた。差分取得はさほどかかってないようなのでProcessの方だけ対応で終わりにする。しかしCygwin遅い。
- [x] 入力エンコーディングをシフトJISに変更しようとしたら例外。その後適当にまた変更しようとしたらVSごと落ちた。
- [x] 「現在の行の後に…」は選択なしのときの挙動を定めた現状だと間違った説明。元からか。
- [x] Cygwin awk に空行流すと変な動き？これでよかったっけ？→単なる知識不足だった。/./{ print $1 } とかすればOK。
- [x] WPF デザイナのとき使うとスペース足りん。
- [x] キャレット位置だとやはり例外が出る？
    - 問題なさそう。
- [x] EmacsキーバインドでC-kしたときクリップボードに出力してほしい。C-k以外の操作をしたら連続解除。
- [x] EmacsキーバインドC-y対応。マークまでは要らないとは思う。
- [x] 編集結果を置き換える範囲が上にずれることがあった。下が残り、上が消える感じ。タブインデントだったのが怪しいかもだが再現しない。
    - リージョン内が選択なしだと拾えないらしい。
- [x] エクスポートのIsEnabledが制御されてない。
- [x] エクスポート・インポートでドキュメントフォルダも絶対パスで扱われているが、これでは不便。

---

以下、雑多なメモ。

- 標準の外部コマンドみたいに変数を設ければ捗りそう。まずは $(InputTempFilePath)、$(InputText) 辺り。

- メニューコマンドの挙動は vsct ファイルの CommandFlag でいろいろ変わる。コードだけでは完結しないっぽい。
　  - https://social.msdn.microsoft.com/Forums/vstudio/en-US/ceb30305-cc4a-4327-8aca-77bbaea9a7d0/vspackage-command-without-menu-only-with-short-cut?forum=vsx
　  - https://github.com/Microsoft/VSSDK-Extensibility-Samples

- Roslyn で作った EvaluateCSharpScript.exe は遅い。JIT コンパイルに時間がかかっている？
　mono 付属の csharp.bat の方がだいぶ速い。

- ユーザー入力モードを作ってみたが、Cygwin bashだと速度的にきつい。
　  - 最終的に非同期＋実行中にリクエストが来たら終わってから再実行で良い動きになった。

- 設定が複雑化してきたのでひな形を兼ねたサンプル値ロード機能がほしい。

- Output 側の改行コードは考慮不要みたい。実際 sed の出力がちゃんと１行ごとに入ってきた。
　  - http://stackoverflow.com/questions/33716580/process-output-redirection-on-a-single-console-line

- sed 引数で日本語を渡すとこける。引数の方の文字コードが問題？
　  - 日本語が入るとスペースによる区切りがスルーされて全体がファイル名とみなされるっぽい。
　　  bash の解釈がまずいのか？普通の対話モードやシェルスクリプトでは問題ないのに。
　  - テンプレートファイルにも UserInput を入れられるようにすればいい？さすがにシェルスクリプトならいけるはず。
　　- 動作を確認した。cygpath を挟む必要があったりしてシンプルではない。

- 設定がレジストリだとバックアップや共有に不都合ではある。ファイルにするにしても格納場所をまじめに考えすぎるとVSのバージョンごとに分かれてしまう。
　  - とりあえずエクスポート・インポートとか。
　　  インポートで対象を選べれば共有にも使える。

- ビルド後イベントでビルドバージョンをインクリメントするようにしてみた。
　ずいぶん面倒だったが、これで更新インストールができるようになった。
　今は毎回になっているが Rerease だけでいい。
　引数で構成を渡して判断すればいい。

- bashはできることが多すぎて危険なのでsedやawkをプリセットに加えよう。
　と思ったがsedスクリプトは複数行が普通なのか。

- テスト用VSIXの取得元をDropboxのソースフォルダ直にしたい。
　Publishビルド後にコピー走らせてbin以外に置けばいいはず。
　  - 出力フォルダを設けて、Dropboxのバックアップフォルダ中の出力フォルダに共有設定をかけた。
　  - github から取得できるようにしたため sln と同じフォルダにコピーするようにした。

- シェルの使い方がだいぶわからなくなっている。
　標準入力から受けた内容を繰り返すのってどうやるんだ。
　  - パイプの後はサブシェル、つまり別プロセスのため変数の変更は途切れる。
　　  たぶん bash テンプレートで InputText を一旦変数にいれておき、標準入力と変数のどちらでも処理できるようにするのがいいかな。むしろ一時ファイルか。
　  - 変数で十分動く。サンプル設定のテンプレートの中身だけ変更でいい。→済

- テキストの差分取得に DiffMatchPatch F# ポート版を使用予定。
　オリジナルは Google の人なのだけど Nuget に置かれてない。
　F# 版は Nuget にあるし、ポートしたのが日本の方。
　  - http://pocketberserker.hatenablog.com/entry/2016/05/31/183000
　  - https://github.com/pocketberserker/Diff.Match.Patch
　  - Nugetから取得したアセンブリは厳密名署名されていない。署名オフにすればいけるけど…。
　　  動作はあっさりだったが。

- 色分けはWPFのRichTextBoxで。これ仕事でも使ったことない。
　  - http://stackoverflow.com/questions/5442067/change-color-and-font-for-some-part-of-text-in-wpf-c-sharp
　  - RichTextBox.Documentは依存関係プロパティではない。
　　  イベントハンドラなどで Document を更新しようとするといつもの例外が出るが、
  　　こいつの場合は UI だけでなく FlowDocument の方も別スレッドから触れないらしい。
　  　なのでUIとFlowDocumentが両方同じスレッドに存在するように
  　　Dispatcher.Invoke した Action 側で FlowDocument を生成しないとだめ。

- ライセンス表記。Readmeの方は固まったのだが、これをUIにも入れて毎度更新するのはうざいので
　Markdown XAML を使って README.md を表示したい。
　ライセンスについてではなく AnyFilter についてにすればいい。
　  - 残念ながら Markdown XAML は Nuget パッケージがないようだったので
　　  面倒になってプレーンテキストを表示するようにしておいた。ライセンスはたぶん守れているはず。
　　そのうち何とかしたい。

- WPF RichTextView のスクロールは BringIntoView(), IWpfTextView の方は EnsureSpanVisible() と
　コントロールや指定範囲を表示するようにスクロールするメソッドを使ってできた。便利。

- UserInputWindowを少し透過させてみたが、重いのとWindowStyleがNone固定のため役に立ちそうにない。
　元が分からなくなるのは別の方法を考えよう。

- アイコンを Segoe フォントで表示？使っても次へ前へくらいだけど。

- http://labs.gree.jp/blog/2013/12/9773/
　gitの運用を真面目にやる前にci的なものがほしい。ここまでで見かけたそれらしいワードを調べてみる。
　  - [Travis CI](https://travis-ci.org/)
　  - [AppVeyor](https://www.appveyor.com/)

　  - [AppVeyorを使ってCI環境構築してみた - 亀岡的プログラマ日記](http://posaune.hatenablog.com/entry/2014/05/02/201403)

　  - .NETならAppVeyorがよさげ。Travisはunixライク系。
　  - 少し見て回った感じだと小さいソフトでわざわざdevelop branch切ってるのは稀だけど、どうすべきか。

- RichTextBox にはタブサイズを設定する方法がないとか。
　よく考えたらプレビュー用なのだからスペースに置換で問題ない。

- スニペットは登録含めていつかやりたい。

- プレビューだけツールウィンドウとするとすっきりしそうだが、モーダルとは行かなくなるのでどうしたものか。
　選択範囲の解除を拾えるなら可かな。編集結果が予想できないような状態にならなければいい。
　安全なのは今みたいにモーダルでやることだけど。まだ先か。
- しかし現行UIでもビューの下の方にフィットさせる感じでダイアログを出せばましになる？
　  - できる範囲でやってみた。動きはモーダルダイアログだけど、まぁまぁいい感じ。

- VS のテーマに合わせようとしてみたが、割に合わな過ぎてやめた。

- コマンド実装の中にある対象取得→フィルタ実行までの流れをクラスに切り出したいが、名称が浮かばない。FilterRunner はすでにあるし、対象を選択するのは Runner ではない。Cordinater とか Process とか。FilterRunningProcess が FilterRunner を呼び出すのはあんまり直観的ではない気がする。逆な気が。

---

VSCode だけど以下はほぼ同じコンセプトの先達。
- [Filter Text - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=yhirose.FilterText)


------------------------------------------------------------------------

Converted from Evernote content created at 2017-03-23T00:17:53+09:00