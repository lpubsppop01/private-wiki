# Dokany + encfs4win-reloaded
```
Dokany は Windows 版 FUSE 的なもので、endfs4win-reloaded はその上で動作する encfs 実装。
encfs ディレクトリを Windows 環境でマウントできる。
とりあえずインストールしないと中の howm メモが参照できない。

以前は Dokan + encfs4win を使用していたが、
どちらももうメンテされておらず、派生版が主流になっている。

---------------------------------------------------------------

dokany は chocolatey からインストール可能。
dokan-library もあるが、これはオリジナル版の方だろう。

encfs4win-reloaded は chocolatey には古いオリジナル版しかないので本家より取得。
2.x は encfsw の互換性がないとのことで 1.x 系の最終版。
https://github.com/kriswebdev/encfs4win-reloaded/releases/download/v1.01/encfs4win-v1_01.zip

encfsw.exe をスタートアップに含めておけばおけ。

---------------------------------------------------------------

GitHub - dokan-dev/dokany: User mode file system library for windows with FUSE Wrapper:
https://github.com/dokan-dev/dokany

GitHub - kriswebdev/encfs4win-reloaded: EncFS for Windows Reloaded // Binaries & easy to build source:
https://github.com/kriswebdev/encfs4win-reloaded
```

------------------------------------------------------------------------

Converted from Evernote content created at 2016-07-03T15:01:22+09:00