# git の過去コミット内容を変更
`csproj` に入ったローカルパスを含む `IntermediateOutputPath` を削除。

編集用のスクリプト。
```python
#! /usr/bin/env python
# -*- coding: utf-8-dos -*-

import io
import glob

for path in glob.glob('./*/*.csproj'):
    lines = None
    with io.open(path, 'r', encoding='utf_8_sig') as f:
        lines = f.readlines()
    lines2 = [l for l in lines if not "IntermediateOutputPath" in l]
    with io.open(path, 'w+', encoding='utf_8_sig') as f:
        f.writelines(lines2)
```

PowerShellで以下のように実行。フィルタに3分くらいかかった。
```
> git filter-branch --tree-filter "python c:/Users/.../RemoveLocalPath.py" -- --all
> git push -f
```

参考リンク：
- [Git - 歴史の書き換え](https://git-scm.com/book/ja/v1/Git-%E3%81%AE%E3%81%95%E3%81%BE%E3%81%96%E3%81%BE%E3%81%AA%E3%83%84%E3%83%BC%E3%83%AB-%E6%AD%B4%E5%8F%B2%E3%81%AE%E6%9B%B8%E3%81%8D%E6%8F%9B%E3%81%88)
- [git filter-branchでパスワードを全ブランチの歴史から消す手順 - Qiita](https://qiita.com/konpyu/items/ecce04e3713f12c43fb4)
- [git filter-branchで過去の全てのcommitから画像ファイルの追加/変更をなかったことにしてリポジトリを軽量化する - dskd](http://dskd.jp/archives/46.html)