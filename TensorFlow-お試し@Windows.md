# TensorFlow お試し@Windows
```
2015/11/09（たぶん）にオープンソース化された TensorFlow をどーにか Windows 環境で試したいメモ。
TensorFlow は人工知能の関連技術であるディープラーニングの実装。
Google で開発され同社サービスの実装に使用されてきた実績がある。

Home — TensorFlow:
http://tensorflow.org/http://tensorflow.org/http://tensorflow.org/

tensorflow/tensorflow · GitHub:
https://github.com/tensorflow/tensorflow

---

Windows と件名に入れたのは少々ハードルが上がると思われるため。
GNU/Linux と Mac OS X 環境では pip でインストールが可能だが、
Windows ではソースから入れる必要があり、かつインストール手順から見て Cygwin か msys 辺りが必要と思われる。
とりあえず Cygwin で試行する。

tensorflow/os_setup.md at master · tensorflow/tensorflow · GitHub:
https://github.com/tensorflow/tensorflow/blob/master/tensorflow/g3doc/get_started/os_setup.md#detailed_installhttps://github.com/tensorflow/tensorflow/blob/master/tensorflow/g3doc/get_started/os_setup.md#detailed_install

まず Bazel というこちらも Google 製のビルドツールが必要で、
その Bazel のビルドにやはり Google 製の protobuf (Protocol Buffers) が必要。
protobuf はなんだろうこれ。ファイル形式のサポート？
（引っかかってインストールした Cygwin パッケージ: curl, autoconf, automake, libtool, gcc-g++）
---
$ git clone https://github.com/google/protobuf.githttps://github.com/google/protobuf.git
$ cd protobuf
$ ./autogen.sh
$ ./configure --prefix=/usr/local
$ make
$ make install
---

Bezel ビルドに javac が使用される。
https://github.com/bazelbuild/bazel/issues/128 で指摘されている
Cygwin と Windows のパス表現の差からくる問題を解決する必要がある。
下記を参考にパスだけ変更して使用。~/bin/javac がある状態にした。
（http://sourceforge.jp/projects/javaoncygwin/ を使ったほうがよかったかも。）

Cygwin で Java:
http://sohda.net/cygwin/java.html

準備を整えたら Bazel のビルド。
---
$ git clone https://github.com/bazelbuild/bazel.git
$ cd bazel
$ git checkout tags/0.1.0
$ export PROTOC=/usr/local/bin/protoc
$ JAVA_HOME~$HOME ./compile.sh
---

…ビルド長い…。protobuf も結構長かったが bazel はそれ以上。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2015-11-11T23:00:28+09:00