# Jupyter Notebookインストール on Windows
Chocolatey で anaconda3 をインストールで OK。
- [2行でpythonインストール@Windows - Qiita](http://qiita.com/u1and0/items/d63546c0d64eceab6b41)
- 7 分程度で完了した。timeout はデフォルトでもたぶん問題なさそう。
    - SSD だったからかも
- スタートメニューから Jupyter Notebook を起動で問題なく動作した。
- conda コマンドに PATH が通っていないのでそこだけ要設定。
    - `C:\tools\Anaconda3\Scripts`

---

※以下は以前に Anaconda を使わずにインストールしたときのメモ。

以前の IPython Notebook が複数の言語に対応してきたため改名したとのこと。
Windows でなるべく Chocolatey を利用しつつインストールする手順。
https://ianchanning.wordpress.com/2016/03/25/jupyter-on-windows-with-chocolatey/

1. 管理者権限で PowerShell 端末を起動
2. choco install python
3. PowerShell 端末を再起動（２回目も管理者権限で）
4. pip install jupyter

4 の依存で入る tornade などのインストールでエラーが出る。
はじめは PermissionError で止まるが、再実行すると UnicodeDecodeError で止まる。
よくわからないが、以下を参考にエンコーディングを書き換えて解決。
- https://github.com/pypa/pip/issues/4251

C:\Python36\Lib\site-packages\pip\compat\__init__.py:75
``` python
            #return s.decode('utf-8')
            return s.decode('cp932')
```

あとインストールが正しく行われず import でこけるものが出たら、
以下のようにキャッシュ無効で再インストール。
```bash
# pip uninstall tornado
$ pip --no-cache-install install tornado
```

起動手順は以下のように。
```bash
$ mkdir jupyter
$ cd jupyter
$ jupyter notebook
```

IJulia をインストールしたら Julia 0.5.0 というのが Python 3 の上に増えた。
Julia の学習環境用だったのでこんなもので。

------------------------------------------------------------------------

Converted from Evernote content created at 2017-02-26T15:11:12+09:00