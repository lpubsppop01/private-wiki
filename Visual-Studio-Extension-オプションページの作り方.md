# Visual Studio Extension オプションページの作り方
```
普通に検索するとGridViewを使ったページを自動（Automation）で生成する方法がヒットする。
DialogPage を継承した HogeOptionPage クラスを作り、そこに必要な設定をプロパティで保持させる。
そのページクラスの型を Package の ProvideOptionPageAttribute で設定で OK。

漫坊亭: 7月 2014:
http://manbou404.blogspot.jp/2014_07_01_archive.html

Creating Options Pages By Using Managed Package Framework Classes:
https://msdn.microsoft.com/ja-jp/library/bb165039(v=vs.110).aspx

---

自前で UI を作成したい場合は DialogPage 実装クラスで Window をオーバーライド。
Forms の UserControl を返すようにする。
適用は OnApply() をオーバーライド。
メンバー自体は上記と同様 DialogPage 実装クラスにもつ。
下記ページではいろいろ Attribute を付けているが、たぶん全部は要らない。

Integration with Visual Studio Options Window using custom controls:
http://geekswithblogs.net/onlyutkarsh/archive/2013/06/30/integration-of-options-window-in-visual-studio-extension-with-custom.aspx

---

WPF で実装したい場合は UIElementDialogPage を継承する。
Child プロパティをオーバーライド。

Daniel Schroeder's (aka deadlydog) Programming Blog » Adding a WPF Settings Page To The Tools Options Dialog Window For Your Visual Studio Extension:
http://blog.danskingdom.com/adding-a-wpf-settings-page-to-the-tools-options-dialog-window-for-your-visual-studio-extension/

・OK して閉じた後、もう一度オプションダイアログを開いたときは Child には到達しない。
　破棄される場合もあるのかもしれないが、毎回の更新は当てにしてはいけない。
・OK、キャンセルは OnApply() の引数を見ればわかる。
　OnActivate() は該当ページが表示されるとき毎回到達する。

---

メニューコマンドの登録状況を変更するような設定を設けたい場合は
オプションダイアログは諦めないとだめかもしれない。
OleMenuCommandService が DialogPage では取得が難しいような気がするし、
Package から OptionPage の適用を拾うのも困難な気がする。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2017-03-13T22:28:19+09:00