# PyDev
```
PyDev:

http://pydev.org/

アップデートサイト:
http://pydev.org/updates

------------------------------------------------------------------------

ローカルアプリを作る前提で普通に開発する手順:
1. PyDev プロジェクトを作成。
2. プロジェクトにプロジェクト名と同名のパッケージを追加。
   コードはこの下に配置。
3. トップに tests フォルダーを作成。
   テストコードはこの下に配置。

------------------------------------------------------------------------

命名規則について。PyDev の話ではなくなっているが。
* ファイル名では単語の間に区切りは入れないのが標準？（例：dataconverter.py）
* テストファイルは頭に test_ を付ける。（例：test_dataconverter.py）
* テストクラス名は Test* か *Test だがどちらが標準的かはよくわからず。（例：DataConverterTest）

------------------------------------------------------------------------

テンプレートに追加。※Pattern の最後は改行なし

Name: property_inner_short
Pattern:
def ${prop}(): #@NoSelf
    def fget(self): return self._${prop}
    def fset(self, value): self._${prop} = value
    def fdel(self): del self._${prop}
    return locals()
${prop} = property(**${prop}())${cursor}

Name: codu8_emacs
Pattern:
# -*- coding: utf-8-dos -*-
```

------------------------------------------------------------------------

Converted from Evernote content created at 2013-06-22T20:12:07+09:00