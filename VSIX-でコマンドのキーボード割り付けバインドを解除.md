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