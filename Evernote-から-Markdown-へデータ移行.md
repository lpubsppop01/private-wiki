# Evernote から Markdown へデータ移行
Evernote に置いている技術メモを Markdown ベースの wiki に移行する件で、データの移行をどうするか。

- 130 件くらい。最後は手作業でも OK かなと思っていたが地味にしんどいので仮でも完成までスクリプトで終わらせたい。
- Evernote クライアントはエクスポートで ENEX という XML ベースのファイルを出力できる。
  ここからテキストを取り出す [enex-dump](https://github.com/panicsteve/enex-dump) がよく紹介されている。
    - ノート内のタグは全無視のようで改行も消える。あと作成日時もちょっとほしい。
    - fork して改変した版 [lpubsppop01/enex-dump](https://github.com/lpubsppop01/enex-dump)
    - テキストで出力するのは変えてなかったが、やはり Markdown で出力しよう。本文を Code ブロックで囲ってしまえばなんでもいけるはず。
    - nbsp が消えるのに対処。
    - よく考えたら Gollum 互換 wiki に格納するならタイトルはコンテンツに含めない方がいい。重複する。
        - 含めないように変更したが、Jingo は設定でその辺の動きは変えられるっぽい。
        - 取り消した。Jingo の config.yaml で pages.title.fromFilename: false, fromContent: true に変更。
- 順序を維持したいので作成順にコミットする必要がありそう？コミットメッセージは Page created (Title) という感じ。
    - git のコミットメッセージは UTF-8 のため PowerShell では後からエラーが出る。Cygwin Bash が安定。
    - しかしファイル名にスペースが入っているため PowerShell で bash スクリプトを作成した（もう何が何だか）。※スペースは入らなくしたので不要だったけどメモは残しておく。
      ```
      cd WORK
      foreach ($childItem in (Get-ChildItem . | Sort-Object LastWriteTime)) {
          $filename = $childItem.Name
          $title = [System.IO.Path]::GetFileNameWithoutExtension($filename)
          echo "git add ""$filename"""
          echo "git commit -m ""Page created ($title)"""
          echo "sleep 1s"
      }
      ```
    - なぜか Jingo の Document list で間が抜けてる。更新日時の都合かと思ったが違うようだ。なかなか難しい。
        - 日本語がだめなんじゃないか？タイトル日本語にヒットしないのと同原因なのでは？
        - VSCode のデバッグで routes/wiki.js:48 付近から追ってみた。lib/gitmech.js:42 で実行される git コマンドの出力が文字化け。
            - http://dev.classmethod.jp/tool/git/git-avoid-illegal-charactor-tips/
            - `git config --local core.quotepath false` で日本語タイトルも表示されるようになった。
              `git --git-dir=.git --work-tree=. ls-tree --name-only -r HEAD -- *.md` で表示されてれば OK。
            - タイトルにスペースが含まれているものがまだ表示されていない。怪しい。
    - ファイル名にスペース含めたらだめじゃんということでやり直し。
      ```
      for f in `ls -tr`; do git add $f; git commit -m "Page created (${f%%.md})"; sleep 1; done
      ```
    - 全ファイルが modified とか言い出したので `git config core.fileMode false --local`

- Jingo のソート順はファイルの最終更新日時に依るので
  [git-set-file-times.pl](http://qiita.com/mAster_rAdio/items/246fcab7984e50d7d66f) を使用してコミット日時を適用。

- 作成日時をフッターに載せるのを除けば html で出力して w3m を通すとかでもよかったのかも。
  というか html2markdown とかあるじゃないですか。