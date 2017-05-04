# Sublime Text 2 試用
```
* ライセンスはユーザー単位かマシン単位で割り当てられ、個人購入したライセンスを会社で使っても OK らしい。
  こういうのが公式サイトで明記されているのはありがたい。

* インストールしたらまず Package Control をインストール。
  View / Show Console でコンソールを開いて以下を実行（1 行）:

      import urllib2,os;pf='Package Control.sublime-package';ipp=sublime.installed_packages_path();os.makedirs(ipp) if not os.path.exists(ipp) else None;open(os.path.join(ipp,pf),'wb').write(urllib2.urlopen('http://sublime.wbond.net/'+pf.replace(' ','%20')).read())

* Shift+Ctrl/Command+P で Command Palette を開いて Install Package を選択。
  ここからパッケージをインストールでき、更新もしてくれるらしい。

* Windows では IMESupport がないと IME でインライン入力できないらしい。
  会社の Microsoft IME では確かにそうだったが、Google 日本語入力では確認を忘れた。
  Mac のことえりでは不要だった。

* SublemacsPro を入れるとそれなりに Emacs ライクになる。
  穴は目に付くがその辺はどのツールも似たようなものだし、見劣りはしない。

    + デフォルトだと Ctrl+Space に割り当てられているのはどのコマンドだ？

* フォントは Preferences / Settings - User から設定。
  設定は JSON で記述する。
  "font-face" と "font-size" だけ設定すれば OK。
  簡単だし保存すると即反映される。エラーも指摘してくれる。

* デフォルトのカラー設定は黒系。
  他に使っているアプリがだいたい白系なので白系に変更。
  Preferences / Settings / Color Scheme で Slush & Poppies を選択。

* Visual Studio の外部ツール登録は普通に実行ファイルのパスを設定して
  ファイルパスを引数で与えれば問題なく使えた。
  ちゃんと emacsclient 的な動きで新しいタブが開かれる。

* 空白文字を表示するには "draw_white_space" を "all" に設定。

* インデントの設定は http://www.sublimetext.com/docs/2/indentation.html を参照。
  "tab_size": 4, "translate_tabs_to_spaces": true, "detect_indentation": true, "use_tab_stops": true,

* 既存ファイルのインデント変更は開いた状態で Indentation: Convert to Spaces を実行すればよし。
  こういうのを Command Palette から勘で探せるのが素晴らしいと思う。

* パッケージが大量にありいまいちどれがメジャーなのかわからない。
  とりあえずメモしておく。

    + CompleteSharp:
      C# の補完。いまいち動きが把握できず。
      補完されていたけどオムニ補完ではなかったのでこのプラグインの効果ではなかったような？
      Mac でも動くのか？

    + SublimeRope:
      Python の補完。名前通り Rope ベース。
      動いているような動いてないような。

    + SublimeCodeIntel:
      デフォルトだと補完は手動なのだが、それを自動で行ったりする。
      Package Control でリストに出てこないのだがどうしよう。

* 使えそうなので継続していくが、とりあえず基本設定と詳細なキーバインド, C#, Python くらいにノートを分けたい。

* View / Side Bar / Show Open Files するとサイドバーにファイル一覧が表示される。
  フォルダーをドロップするとツリー表示される。
  これをプロジェクトとして保存して表示内容などをカスタマイズできる。

* Sublime Text 2 本体では UTF-8 のみ対応のため ConvertToUTF8 をインストール。
  Package Control から入れられる。
  http://snickerjp.blogspot.jp/2012/12/sublime-text-2windows2.html

* PowerShell（パッケージ）をインストールすると PowerShell スクリプトも
  シンタックスハイライトされる。

* 設定で "rulers": [80, 100] とかするとルーラーが表示される。これは Visual Studio でほしい。たぶんありそう。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2013-06-14T22:07:18+09:00