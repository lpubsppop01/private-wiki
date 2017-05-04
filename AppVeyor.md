# AppVeyor
```
CI サービスのひとつで、Windows 環境を提供しているのが特徴。
GitHub アカウントで登録できるようだったのでそちらで登録。

とりあえずの目的である [AnyTextFilterVSIX](evernote:///view/6108060/s55/614d7c39-98f7-47be-bb14-3b7a9cb8bfda/614d7c39-98f7-47be-bb14-3b7a9cb8bfda/) のビルドを試行。
* `AssemblyInfo.cs` に記載されているバージョン情報を AppVeyor 側で管理しているビルド番号で置き換える仕組みがある。
  仕事で使っている TFSBuild と同じノリで使えそうなのはありがたいので利用したいが、
  VSIX のため `vsixmanifest` ファイルのバージョンも同じ値に設定したい。
    + 今は Publish ビルドのときだけスクリプトで `vsixmanifest` ファイルのバージョンをインクリメントしている。
      これを `AssemblyInfo.cs` のバージョンをコピーする動きに変える。
* ビルド結果でほしいのは VSIX ファイルだけ。その辺りはどうなる？
    + そもそも成果物（Artifacts）は設定しないと残らない。
      パスを設定して `lpubsppop01.AnyTextFilterVSIX.vsix` が残るようにできた。
* それなりに動いたということで `README.md` にバッジ画像リンクを貼り付け。
  Download のリンク先も AppVeyor のビルド結果に変えた。
  「最後の成功したビルドの成果物」は UI からはわからなかったがググったら出てきた。
  https://github.com/appveyor/ci/issues/403
* 設定は yml ファイルにエクスポートしてリポジトリに入れておいた方がいいらしい。後でやろう。
* テストプロジェクトが存在すればテストを実行してくれる。
  Release で外していたテストプロジェクトをビルドするようにしたら早速失敗していた。
  バッジ画像は Failed になり、ファイルダウンロードの方は前の成功したビルド結果をちゃんと返していた。

---

以下、参考リンク。
* [AppVeyorを使ってCI環境構築してみた]([http://posaune.hatenablog.com/entry/2014/05/02/201403)](http://posaune.hatenablog.com/entry/2014/05/02/201403)
* [AppVeyorでGitHubプロジェクトと連携したときにする最低限の設定。](http://final.hateblo.jp/entry/2015/11/08/155657)
* [La Verda Luno AppVeyorの設定についていろいろ §§ La Verda Luno](http://blog.masuqat.net/2015/08/19/appveyor-settings/)
```

------------------------------------------------------------------------

Converted from Evernote content created at 2017-04-22T19:36:18+09:00