# バックアップスクリプト PowerShell 版
GitHub のリポジトリに移動した：
- [lpubsppop01/BackupUtils-PSModule](https://github.com/lpubsppop01/BackupUtils-PSModule)

ポイント：
- リストアにツールが不要であること
- 対象の追加が単純作業であること
- 複数のマシンで同じバックアップ先に書き込んでも競合しないこと

- VS Code の設定と拡張をバックアップ
    - [Visual Studio Code のユーザ設定を複数PCで使いまわす（Dropbox経由） - Qiita](http://qiita.com/_meki/items/d8e90fecbfc4b9da89b5)
    - gist 経由で同期させる拡張もあるが職場では難しいだろう
        - [Visual Studio Code 入門～導入から Gist による設定管理まで～ - 雀巽の日記帳](http://necojackarc.hatenablog.com/entry/2017/03/12/184557)

TODO：
- バージョン管理に未反映のローカル変更
    - TFS ならシェルブが便利だがパッチでもどうにかできないか？
    - Visual Studio Team Services の無料枠（5 人まで）で TFS 使えるから家でも試せる