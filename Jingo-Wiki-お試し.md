# Jingo Wiki お試し
[Jingo](https://github.com/claudioc/jingo) は Gollum にインスパイアされて開発された git ベースの wiki 実装。
Gollum が Ruby なのに対してこちらは Node.js になっており、個人的にとっつきやすい。
また認証・バックアップのようなほぼ必須の設定などは組み込みで面倒を見てくれる親切仕様になっている。

## インストール
npm にパッケージがあるのでそちらから。
```
Admin-PS> npm install jingo -g
```

## 初期設定（お試し用）
適当な作業ディレクトリにてまず設定ファイルのひな形を作る。
PowerShell で作成したら何やら問題が起きた（制御文字が混入した？）ので Cygwin Bash でやり直した。
```
$ jingo -s > config.yaml
```

同じディレクトリに git リポジトリを作成。
ここで config はしなくても編集者としてログインしたユーザー名を表示してくれる。
```
$ git init
```

config.yaml を書き換える。エラーメッセージはちゃんとしているので多少適当でもはまらないと思う。
- application.repository: '.'
- authentication.local.enabled: true
    - username, passwordHash, email も適当に設定
    - passwordHash は `jingo -#` で生成できる

これだけでだいたい希望通りの動きになった。
- ログインすると追加・編集可能。ログインしなくても表示は可能。
- タイトルに日本語を含めても問題ない。

続きはちゃんと環境作るときにやろう。