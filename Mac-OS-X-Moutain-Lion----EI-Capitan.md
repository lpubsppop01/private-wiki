# Mac OS X Moutain Lion -> EI Capitan
```
Swift の勉強用に久々に MBP Mid 2009 の環境を整えた。
1. ほどほどに充電。
2. App Store のアップデートから EI Capitan をインストール
3. VirtualBox（何かエラーが出た）、Evernote を AppCleaner で削除
4. XCode などを最新まで繰り返しアップデート

ちらほら問題？が出た:
* Homebrew が動かなくなった。
  システム更新で /usr/local のオーナーが root になったせいらしい。
  再インストールで対処。
  http://tomoyaonishi.hatenablog.jp/entry/2016/03/13/153350
* 日本語入力が非常に重くなった。
  スペースを押さなくてもどんどん変換していくライブ変換が売りらしいがこれでは常用に耐えない。
  Google 日本語入力で代用。
* emacs を 24.3 -> 24.5 に上げたら？migemo が動作しなくなった。
  これは単に dotfiles を最新に上げたせいかも。
  migemo-dictionary が "~/..." なパスになっていたのを
  フルパスで "Users/..." と指定したら改善した。
  なお brew でインストールするときのオプションは
  --with-cocoa --srgb --with-gnutls とした。最後のが el-get 的に重要。

その他:
* KeyRemap4MacBook は今は Karabiner と改称したらしい。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2016-08-11T23:04:43+09:00