# Visual Studio 2013 から 2017 を対象とした拡張の作り方
vs2017 をインストールすると EnvDTE が COM から通常の DLL に変わるためビルドに問題が出る件を前提にして、どうやるといい感じになるのか確認する。

検証の前提：
- 手元の vs2013 が入ったマシンのうち一台（デスクトップ機）は vs2017 をインストール後に vs2013 を修復インストールした状態。もう一台（ノート）に vs2017 をインストールして問題が起こる環境を作った。
- AnyTextFilterVSIX のインストーラ（AppVeyor のビルド結果）を使用
    - vs2013 のみの環境でビルドしたバイナリ

vs2017 をインストールした環境の VS2013 で：
- 従来のバイナリは動作 OK
- 参照設定 `EnvDTE`、`EnvDTE100`、`EnvDTE80`、`EnvDTE90` のエラーでビルド NG

vs2017 で：
- インストール時点で「互換性がない」と警告される（続行は可能）
    - この警告はマニフェストのバージョンが古いためらしい
- 設定までは問題ないように見えたが、実際に sed を使おうとしたところ「値を null にすることはできません」的なエラーメッセージが表示された
    - AnyTextFilter でテキストエディタからフォントを取得する処理が失敗したからみたい。フォント未設定で [IVsFontAndColorStorage.GetFont](https://msdn.microsoft.com/en-us/library/microsoft.visualstudio.shell.interop.ivsfontandcolorstorage.getfont.aspx) を呼んだとき成功しなくなったか、もしくは単にフォント未設定のときの動作確認が漏れてた。ちゃんと返り値を見ていれば問題ない。
    - 修正後は問題は見当たらない

vs2017 でビルドして vs2013 でも動作すればよさそう。検証用に AnyTextFilterVSIX の vs2017 ビルド用ソリューションを作成。
- `sln`、`csproj` ファイルの他、`vsixmanifest` ファイルもアセンブリバージョンの記載を伴う必須項目が増えているので分けたい。
    - と思ったが `source.extension.vsixmanifest` というファイル名が固定のようでうまくいかない。どうしたものか。
- 諦めて通常通りに移行してみたが vs2013 で動作しない（インストールは警告なしでいける）。

---

そのままのページが割とヒットするが、マニフェストの話に終始している：
- [How do I build a Visual Studio Extension (VSIX) that targets Visual Studio 2010-2017 - Stack Overflow](https://stackoverflow.com/questions/42269556/how-do-i-build-a-visual-studio-extension-vsix-that-targets-visual-studio-2010)
- [How to: Migrate Extensibility Projects to Visual Studio 2017 | Microsoft Docs](https://docs.microsoft.com/en-us/visualstudio/extensibility/how-to-migrate-extensibility-projects-to-visual-studio-2017)
- [It’s time to change the VSIX manifest of your extension to v3 for Visual Studio 2017 compatibility | Visual Studio Extensibility (VSX)](http://www.visualstudioextensibility.com/2017/01/10/its-time-to-change-the-vsix-manifest-of-your-extension-to-v3-for-visual-studio-2017-compatibility/)

---

参考として EmacsKeys の vs2017 対応 fork:
- [modified for VS2017](https://github.com/yosagi/EmacsKeys/commit/dd267f0d92791e0deaf37be011a7e8505620d809)