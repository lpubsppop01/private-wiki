# VSIX でコマンドのキーボード割り付けを解除
VSIX でコマンドのキーボード割り付けを解除する試行。
`Ctrl-H` は以下でいけたが `Ctrl-K` は例外が出るものがあり、またキーイベントを拾えなかった。
```csharp
var dte = Package.GetGlobalService(typeof(EnvDTE.DTE)) as EnvDTE.DTE;
foreach (EnvDTE.Command command in dte.Commands)
{
    var bindings = command.Bindings as object[];
    if (bindings == null || !bindings.Any()) continue;
    var bindingBuf = bindings.OfType<string>().ToList();
    for (int iBinding = 0; iBinding < bindingBuf.Count;)
    {
        var currBinding = bindingBuf[iBinding];
        int iColonX2 = currBinding.IndexOf("::");
        if (iColonX2 == -1)
        {
            ++iBinding;
            continue;
        }
        int iFirstKeyStart = iColonX2 + 2;
        int iFirstCamma = currBinding.IndexOf(",", iFirstKeyStart);
        int firstKeyLength = (iFirstCamma == -1) ? currBinding.Length - iFirstKeyStart : iFirstCamma - iFirstKeyStart;
        if (firstKeyLength <= 0)
        {
            ++iBinding;
            continue;
        }
        string firstKey = bindingBuf[iBinding].Substring(iFirstKeyStart, firstKeyLength);
        if (firstKey == "Ctrl+H")
        {
            bindingBuf.RemoveAt(iBinding);
        }
        else
        {
            ++iBinding;
        }
    }
    if (bindings.Length != bindingBuf.Count)
    {
        try
        {
            command.Bindings = bindingBuf.Cast<object>().ToArray();
        }
        catch
        {
        }
    }
}
```

---

参考リンク：
- [Microsoft Visual Studio 2012 Unleashed - Mike Snell, Lars Powers - Google ブックス](https://books.google.co.jp/books?id=jAGP1lrJ2QYC&pg=PT796&lpg=PT796&dq=envdte.command+bindings&source=bl&ots=jg7EvM7h7b&sig=yBsQoWDyxS11QPQwQtriNxxbpDc&hl=ja&sa=X&ved=0ahUKEwiGm5-_quPUAhWDTLwKHdiFBjI4ChDoAQg2MAM#v=onepage&q=envdte.command%20bindings&f=false)
- [envdte - Remove a keyboard shortcut binding in Visual Studio using Macros - Stack Overflow](https://stackoverflow.com/questions/2324550/remove-a-keyboard-shortcut-binding-in-visual-studio-using-macros)