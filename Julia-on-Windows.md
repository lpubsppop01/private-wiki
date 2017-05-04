# Julia on Windows
```
## インストール
環境は Windows 10 Pro x64。
chocolatey にパッケージはありインストールは完了するが、
インストール先が C:\Users\USERNAME\AppData\Local\Julia-0.5.0 になる。
うれしくないけど支障はないのでこれで行った。
PATH も手動で通す必要があった。あんまりメンテされてないのかも。

ついでに IJulia の方もインストール。
---
$ julia
julia> Pkg.add("IJulia")
---
インストール先は $HOME/.julia の下になる。
環境変数 JULIA_HOME を設定しておくとそちらが優先されるとか。

IJulia をインストールしているとき
ipython とか jupyter とか notebook とかが入っているらしきログが流れていたのだが、
いまいちわからない。
ひょっとして Julia のパッケージマネージャだけで完結するのか？
デスクトップの方は何も事前準備せずにこちらでやってみよう。

------------------------------------------------------------------------

## チュートリアル

GitHub - bicycle1885/Julia-Tutorial: 高速でJuliaを学ぶチュートリアル:
https://github.com/bicycle1885/Julia-Tutorial

ipynb は Jupyter Notebook で開ける形式。
しかしローカルで開くと重いのでリンクされている通り素直に nbviewer.jupyter.org で見た方がいい感じ。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2017-02-26T16:58:07+09:00