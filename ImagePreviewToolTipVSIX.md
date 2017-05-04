# ImagePreviewToolTipVSIX
```
ImageComments ではいまいち不足感があったのでツールチップに画像を表示する拡張を作ってみる。
→作ってみた。github にコミットした。
https://github.com/lpubsppop01/ImagePreviewToolTipVSIX

---------------------------------------------------------------

（VSIX に埋め込む短い説明）
Provides image preview tooltips for path texts quoted by `"` or `'`.

（リポジトリの軽い説明）
Visual Studio Extension that provides image preview tooltips for path texts quoted by `"` or `'`.

（README 文頭の説明）

This Visual Studio extension provides image preview tooltips for path texts quoted by `"` or `'`.

---------------------------------------------------------------

2017/04/19
パッケージ名称にスペースを含めないように再変更した。
ない方がまとまりがいい。

2017/04/18
AnyFilterVSIX に合わせて ImagePreviewToolTipVSIX に変更＋いろいろ追随。
・プロジェクト名などの改名はまずフォルダ以外をコミット→フォルダをコマンドラインで git mv→残り更新でいけた。
・アセンブリ名に lpubsppop1. を含めるようにした。VSIX ファイルについてはコピー時に省く形。
・リポジトリ名の変更は github の Settings ページから簡単にできた。

2016/09/14
IMouseProcessorProvider.GetAssociatedProcessor(IWpfTextView) に到達してくれない現象に
10 日以上はまっていたのだが、ようやく解決した。
vsixmanifest ファイルに
---
    <Asset Type="Microsoft.VisualStudio.MefComponent" d:Source= "Project " d:ProjectName="%CurrentProject%" Path= "|%CurrentProject%| " />
---
がなかったせいだった。
MEF 拡張なのに MEF コンポーネントがない、的な状況。
あと IMouseProcesserProvider は以下のように Name も含めること。
---
    [Export(typeof(IMouseProcessorProvider))]
    [ContentType("CSharp"), ContentType("C/C++"), ContentType("Basic")]
    [TextViewRole(PredefinedTextViewRoles.Document)]
    [Name("test mouse processor")]

    internal sealed class ImageToolTipHandlerProvider : IMouseProcessorProvider
---
```

------------------------------------------------------------------------

Converted from Evernote content created at 2016-09-02T23:46:04+09:00