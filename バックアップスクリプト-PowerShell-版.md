# バックアップスクリプト PowerShell 版
GitHub のリポジトリに移動した：
- [lpubsppop01/BackupUtils-PSModule](https://github.com/lpubsppop01/BackupUtils-PSModule)

ポイント：
- リストアにツールが不要であること
- 対象の追加が単純作業であること
- 複数のマシンで同じバックアップ先に書き込んでも競合しないこと

TODO：
- バージョン管理に未反映のローカル変更
    - TFS ならシェルブが便利だがパッチでもどうにかできないか？
    - Visual Studio Team Services の無料枠（5 人まで）で TFS 使えるから家でも試せる
- VS Code の設定
    - 確か gist か何かにバックアップする機能があったと思うが、職場では難しいだろう