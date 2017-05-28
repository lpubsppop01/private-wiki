# VSIX デバッグ実行
まともな状態だとデバッグ実行で Visual Studio の実験的なインスタンスが起動するのだが、
リポジトリから clone したときなどはデバッグ設定が消えている。

そういうときは以下を設定：
- プロジェクトプロパティのデバッグ-開始動作を「外部プログラムの開始」にしてパスを指定。
    - vs2013: `C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\devenv.exe`
    - vs2017community: `C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\IDE\devenv.exe`
- 開始オプション-コマンドライン引数を「/rootsuffix Exp」とする。

------------------------------------------------------------------------

Converted from Evernote content created at 2017-04-01T23:06:15+09:00