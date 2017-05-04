# C# + VSTO による Outlook 2010 アドインの作成方法
```
Outlook 2010 向けのアドインを作成する方法。

C# で Office アドインを開発する場合は COM か VSTO になる。
COM の方は試してない（.NET Framework が使えないという話だし面倒そうなので）。
VBA は配布には向かない。

…といいつつも誤解があるかもしれない。いちいち呼称が違うもので区別が難しい。

------------------------------------------------------------------------

以下を参照すればとりあえずは作り始められる。

チュートリアル : 初めての Outlook 用アプリケーション レベルのアドインの作成:
http://msdn.microsoft.com/ja-jp/library/vstudio/cc668191.aspx

コンテキストメニューの項目を追加したい場合は以下。

eWay-CRM Tech Blog: Outlook 2010 and 2013 context menu customization:
http://tech.eway-crm.cz/2013/01/outlook-2010-and-2013-context-menu.html

目当てのコンテキストメニューの ID を知りたい場合は以下。

Office 2007/2010・リボンのカスタマイズ 初心者備忘録:
http://www.ka-net.org/ribbon/ri61.html

ContextMenus Add-In for Office 2010 - Home:
http://archive.msdn.microsoft.com/contextmenusaddin

インストーラについては以下。

Building and deploying an Outlook 2010 Add-in (part 2 of 2) - MCS UK Solution Development Team - Site Home - MSDN Blogs:
http://blogs.msdn.com/b/mcsuksoldev/archive/2010/10/01/building-and-deploying-an-outlook-2010-add-in-part-2-of-2.aspx

------------------------------------------------------------------------

おそらく開発環境がインストールされていない環境だとランタイムが必要になるのではないかな…。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2013-05-31T22:15:24+09:00