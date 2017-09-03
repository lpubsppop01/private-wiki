# Visual Studio 2010 のキーバインド設定
```
[2009-10-24 22:02] 

Emacs スキームを利用する前提。
Visual Studio 2008 では標準で使用できる（Express では Visual C++ に付属）。
Visual Studio 2010/2012 では以下を参照。
[[Emacs emulation]]

全てのコントロールで Emacs キーバインドになるわけではないので、
XKeymacs で移動系と C-h、IME オンオフくらいは有効にしておいた方が使いやすい。

------------------------------------------------------------------------

編集.1語削除
編集.後退削除
に Ctrl+H（全体）を追加。Ctrl+H はデフォルトでは「編集.置換」。

編集.1行下へ
に Ctrl+N（全体）を追加。

編集.Emacs1行下へ
編集.Emacsの1行下へ
から Ctrl+N（テキストエディター）を削除。

編集.1行上へ
に Ctrl+P（全体）を追加。

編集.Emacs1行上へ
編集.Emacsの1行上へ
から Ctrl+P（テキストエディター）を削除。

※「Emacs1行上へ」「Emacs1行下へ」は補完候補のサブウインドウにフォーカスが移らないため。

編集.Emacsマークのポップ
編集.Emacsマークの設定
に英語キーボード用の Ctrl+@（Ctrl+Shift+2）の設定があるので
日本語キーボード用の Ctrl+@ に変更。

編集.貼り付け
から Ctrl+Y（全体、テキストエディター）を削除。

編集.クリップボードリングの切り替え
に Ctrl+Y（全体）を追加。

※最新版＋私家修正版は問題なくクリップボード連携するので不要。
※「編集.貼り付け」では他のアプリケーションでコピーしたテキストを
  ペーストできないため。
  http://stackoverflow.com/questions/13383480/how-can-i-paste-text-from-another-application-into-visual-studio-with-emacs-emul
※「編集.貼り付け」の方が Emacs のヤンクに近い挙動ではあるので変えない方が便利かも。

ビルド.ソリューションのビルド
に Ctrl+C C（全体）を追加。

ビルド.キャンセル
に Ctrl+C B（全体）を追加。

編集.定義へ移動
に Alt+.（全体）を追加。

表示.前に戻る
に Alt+*（全体）を追加。

ウィンドウ.次のタブ
に Ctrl+Tab（全体）を追加。
タブを表示順に切り替える。たぶん VS2013 以降。

ウィンドウ.前のタブ
に Ctrl+Shift+Tab（全体）を追加。
タブを表示順に切り替える。たぶん VS2013 以降。

編集.選択範囲のコメント
に Ctrl+C Ctrl+C（テキストエディター）を追加。

編集.選択範囲のコメントを解除
に Ctrl+U Ctrl+C（テキストエディター）を追加。

編集.大文字に変換
に Ctrl+X Ctrl+U（テキストエディター）を追加。

編集.小文字に変換
に Ctrl+X Ctrl+L（テキストエディター）を追加。

ツール.外部コマンド
に Ctrl+C E（テキストエディター）を追加。
[Visual Studio から Cygwin emacsclient-w32 を実行](evernote:///view/6108060/s55/bb7e7bbc-4726-4b7b-be51-abd6b97e0f26/bb7e7bbc-4726-4b7b-be51-abd6b97e0f26/)

標準機能については以上。以下補足。

* Ctrl+D で範囲削除にならないのもどうにかしたいがわからない。

* インテリセンススニペットが効かないのはコンテキストメニューから
  「スニペットの挿入(I)」を実行することで代用する。
  スニペットの選択中に Ctrl+N と Ctrl+P は効かないが、
  文字入力で絞ってタブで選択できる。

* テストの実行はまた考えたい。

------------------------------------------------------------------------

その他のエクステンションについて設定しているキーバインドは各々のノートを参照。

[Productivity Power Tools](evernote:///view/6108060/s55/bdcb1c0e-f413-4edd-a790-db10051ab2dc/bdcb1c0e-f413-4edd-a790-db10051ab2dc/)

------------------------------------------------------------------------

<マイドキュメント>/Visual Studio 2010/Settings/CurrentSettings.vssettings
からユーザー設定キーバインドだけ抜き出し。
KeyboardShortcuts 要素の下に挿入すれば反映されるはず。

---
                    <ShortcutsScheme>Emacs</ShortcutsScheme>
                    <UserShortcuts>
                         <RemoveShortcut Command="Edit.Replace" Scope="全体">Ctrl+H</RemoveShortcut>
                         <Shortcut Command="Edit.DeleteBackwards" Scope="全体">Ctrl+H</Shortcut>
                         <RemoveShortcut Command="File.NewFile" Scope="全体">Ctrl+N</RemoveShortcut>
                         <Shortcut Command="Edit.LineDown" Scope="全体">Ctrl+N</Shortcut>
                         <RemoveShortcut Command="File.Print" Scope="全体">Ctrl+P</RemoveShortcut>
                         <Shortcut Command="Edit.LineUp" Scope="全体">Ctrl+P</Shortcut>
                         <RemoveShortcut Command="Edit.EmacsLineUp" Scope="テキスト エディター">Ctrl+P</RemoveShortcut>
                         <RemoveShortcut Command="Edit.EmacsPopMark" Scope="全体">Ctrl+X, Ctrl+@</RemoveShortcut>
                         <Shortcut Command="Edit.EmacsPopMark" Scope="テキスト エディター">Ctrl+X, Ctrl+@</Shortcut>
                         <RemoveShortcut Command="Edit.EmacsPopMark" Scope="テキスト エディター">Ctrl+X, Ctrl+Shift+2</RemoveShortcut>
                         <Shortcut Command="Edit.EmacsSetMark" Scope="テキスト エディター">Ctrl+@</Shortcut>
                         <RemoveShortcut Command="Edit.EmacsSetMark" Scope="テキスト エディター">Ctrl+Shift+2</RemoveShortcut>
                         <RemoveShortcut Command="Edit.Paste" Scope="全体">Ctrl+Y</RemoveShortcut>
                         <Shortcut Command="Edit.CycleClipboardRing" Scope="全体">Ctrl+Y</Shortcut>
                         <RemoveShortcut Command="Edit.Paste" Scope="テキスト エディター">Ctrl+Y</RemoveShortcut>
                         <RemoveShortcut Command="Window.NextDocumentWindow" Scope="全体">Ctrl+Tab</RemoveShortcut>
                         <Shortcut Command="Window.NextDocumentWellTab" Scope="全体">Ctrl+Tab</Shortcut>
                         <RemoveShortcut Command="Window.PreviousDocumentWindow" Scope="全体">Ctrl+Shift+Tab</RemoveShortcut>
                         <Shortcut Command="Window.PreviousDocumentWellTab" Scope="全体">Ctrl+Shift+Tab</Shortcut>
                         <RemoveShortcut Command="Edit.Copy" Scope="全体">Ctrl+C</RemoveShortcut>
                         <RemoveShortcut Command="Edit.CommentSelection" Scope="全体">Ctrl+C, Ctrl+C</RemoveShortcut>
                         <Shortcut Command="Edit.CommentSelection" Scope="テキスト エディター">Ctrl+C, Ctrl+C</Shortcut>
                         <RemoveShortcut Command="Edit.UncommentSelection" Scope="全体">Ctrl+U, Ctrl+C</RemoveShortcut>
                         <RemoveShortcut Command="Edit.EmacsUniversalArgument" Scope="テキスト エディター">Ctrl+U</RemoveShortcut>
                         <Shortcut Command="Edit.UncommentSelection" Scope="テキスト エディター">Ctrl+U, Ctrl+C</Shortcut>
                         <Shortcut Command="Build.BuildSolution" Scope="全体">Ctrl+C, C</Shortcut>
                         <Shortcut Command="Build.Cancel" Scope="全体">Ctrl+C, B</Shortcut>
                         <RemoveShortcut Command="Edit.EmacsExtendedCommand" Scope="テキスト エディター">Alt+X</RemoveShortcut>
                         <Shortcut Command="View.QuickAccess" Scope="テキスト エディター">Alt+X</Shortcut>
                         <Shortcut Command="Tools.ExternalCommand7" Scope="テキスト エディター">Ctrl+C, E</Shortcut>
                    </UserShortcuts>
---
```

------------------------------------------------------------------------

Converted from Evernote content created at 2013-04-10T21:28:22+09:00