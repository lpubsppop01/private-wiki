# Swift on Windows Subsystem for Linux
```
WSL といっても Ubuntu 用の手順をそのままなぞるんだけど。
ubuntu 14.04.3 相当らしいので公式のバイナリを利用できる。
https://swift.org/getting-started/
https://github.com/apple/swift

- sudo apt-get install git cmake ninja-build clang python uuid-dev libicu-dev icu-devtools libbsd-dev \
libedit-dev libxml2-dev libsqlite3-dev swig libpython-dev libncurses5-dev pkg-config libblocksruntime-dev
- tarball を /opt で展開。
- ディレクトリ名が長いので /opt/swift くらいにシンボリックリンク作成。
- ~/.bashrc で環境変数設定。

うーむ。REPL が動かない。
build も
---
/opt/swift-3.0-PREVIEW-6-ubuntu14.04/usr/bin/swift-build: error while loading shared libraries: libFoundation.so: cannot enable executable stack as shared object requires: Invalid argument
---
って怒られる。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2016-08-17T22:51:21+09:00