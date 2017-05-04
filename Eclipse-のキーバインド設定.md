# Eclipse のキーバインド設定
```
2014/10/25  win7 + Luna (x64) を設定しながら内容更新

win7 + Kepler を設定しながらメモ。
即時反映は不確実なところがあるので、怪しければ再起動を試すのがいい。

Emacs+:http://www.mulgasoft.com/emacsplus/juno/update-site

Please read before installing Emacs+ for Juno - MulgaSoft:
http://www.mulgasoft.com/emacsplus/juno

4 系と 3 系に分かれて更新サイトが提供されており、
Kepler 以降は 4 系が利用できる（2014/10/25）。
http://www.mulgasoft.com/emacsplus/e4/update-site

------------------------------------------------------------------------

Preferences / General / Keys にて Scheme を Emacs+ Scheme に変更した後、
以下のように個別変更。

Ctrl+H を全て外す。

Delete Previous
前を削除
Ctrl+H を割り当て。
When（場合）は In Dialogs and Windows（ダイアログまたはウィンドウ）に設定。

Kill Line
行を削除
Ctrl+K を外す。

Delete to End of Line
行の末尾までを削除
行の末尾まで削除
Ctrl+K を割り当て。
When（場合）は In Dialogs and Windows（ダイアログまたはウィンドウ）に設定。

Close
Close Rendering
Ctrl+W を外す。

Run Last Launched External Tool
最後に起動された外部ツールを実行
Ctrl+C, E を割り当て。

※外部ツールとして Cygwin emacs-w32 を使用する場合は Visual Studio と同様の方法で。
  [Visual Studio から Cygwin emacsclient-w32 を実行](evernote:///view/6108060/s55/bb7e7bbc-4726-4b7b-be51-abd6b97e0f26/bb7e7bbc-4726-4b7b-be51-abd6b97e0f26/)
  ${ItemPath} を ${resource_loc} と読み替え。

Execute Extended Command
Alt+X を外す。

Quick Access
Ctrl+3 から Alt+X に変更。
Ctrl+3 は衝突しやすい。Execute Extended Command でできることはこちらでできそうに見える。

Previous Line
Next Line
全て外す。
Ctrl+P, Ctrl+N が割りあたっていることを確認。
Luna では期待通り動くし、またこちらでないとマークを維持したまま行移動できない。

Line Down
Line Up
それぞれ Ctrl+N, Ctrl+P から Up, Down に変更。
Windows の場合は XKeymacs で C-p と C-n だけ有効にする。

※上記 2 件は補完ウィンドウの候補移動が Ctrl+N, Ctrl+P でできない対策。
  http://shikajiro.github.io/blog/2012/11/19/eclipse-ctrlnp/
  https://groups.google.com/forum/#!topic/emacsplus/R_jLCdxxrug

※タブでフォーカス移さないとカーソルの方が移動してしまうのはバグらしい。
  4.3 では修正されている？->修正されていた（Kepler RC3 で確認）。
  https://bugs.eclipse.org/bugs/show_bug.cgi?id=382839
```

------------------------------------------------------------------------

Converted from Evernote content created at 2013-06-20T22:16:05+09:00