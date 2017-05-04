# Visual Studio Extension Package.Initialize() が VS 開始時に呼ばれるようにする
```
Microsoft.VisualStudio.Shell.Package.Initialize() はデフォルトだと必要になったとき、
例えば vsct ファイルで列挙したメニューボタンをクリックしたタイミングしたときに到達する。

しかしメニュー項目のテキストをコードで設定したい場合など、VS が起動したときに呼び出してほしい場合がある。
ProvideAutoLoadAttribute を付けることで、指定したコンテキストがアクティブになったときに呼ばれるようになる。
起動後に有効になるコンテキストとしては Microsoft.VisualStudio.VSConstants.UICONTEXT_NoSolution が使える。
具体的には以下のような感じになる。
---
[ProvideAutoLoad("ADFC4E64-0397-11D1-9F4E-00A0C911004F")] // Microsoft.VisualStudio.VSConstants.UICONTEXT_NoSolution
public sealed class EditTextWithPackage : Package
...
---

ひょっとするとこれではソリューションを開いて起動したときは到達しないかもしれないが、
それはそれで対処できそう。

---

LVN! Sidebar #1 - Automatically loading packages - DiveDeeper's blog - Dotneteers.net:
http://dotneteers.net/blogs/divedeeper/archive/2008/03/23/LVNSideBar1.aspx

VSConstants.UICONTEXT_NoSolution Field (Microsoft.VisualStudio):
https://msdn.microsoft.com/en-us/library/microsoft.visualstudio.vsconstants.uicontext_nosolution.aspx

UIContextGuids80 Class (Microsoft.VisualStudio.Shell.Interop):
https://msdn.microsoft.com/en-us/library/microsoft.visualstudio.shell.interop.uicontextguids80.aspx
```

------------------------------------------------------------------------

Converted from Evernote content created at 2017-03-22T23:22:25+09:00