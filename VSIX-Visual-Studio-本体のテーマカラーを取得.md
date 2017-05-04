# VSIX Visual Studio 本体のテーマカラーを取得
```
wpf - Colors in Visual Studio Extension - Stack Overflow
http://stackoverflow.com/questions/18913208/colors-in-visual-studio-extension

How to apply the Visual Studio theme to a WPF ListView? - Stack Overflow
http://stackoverflow.com/questions/41381886/how-to-apply-the-visual-studio-theme-to-a-wpf-listview

試してみたが反映されない。
VS2013からは方法が変わっている？
https://social.msdn.microsoft.com/Forums/vstudio/en-US/c68f0d3d-5c53-48cf-9e61-e8552baffb90/vspackage-how-to-style-wpf-tool-windows-to-use-current-visual-studio-color-theme?forum=vsx

これはどうか。
http://stackoverflow.com/questions/19464933/using-environmentcolors-toolwindowtextbrushkey-in-ivalueconverter

変わらない…。なんか動作するOSSのコードを見た方がいいか。
ResourceDictionaryを作って参照するパターンもためそう。あと実験インスタンスだと具合がちがうのかも。

---

↓はVS2013で動いた。VsBrush というのがわからないがそういうものか。後はリソースディクショナリをひとつ作ってそれを参照する感じに。そういうのありそうだけど。
---
<Style TargetType="{x:Type Button}">
  <Setter Property="TextBlock.FontFamily"
  Value="{DynamicResource VsFont.EnvironmentFontFamily}" />
  <Setter Property="TextBlock.FontSize"
  Value="{DynamicResource VsFont.EnvironmentFontSize}" />
  <Setter Property="Background"
  Value="{DynamicResource VsBrush.EnvironmentBackgroundGradient}" />
</Style>
---

その後 EnvironmentColors, VsBrushes を再試行したらいけた。
たぶん namespace が間違ってた（PlatformUI と Shell でアセンブリは同じだけど namespace が違う）。
VsBrushes が補完が効きつつブラシだけに対象が絞られるのでよさげ。

---

色見本は Visual Studio 2013 Theme Color Viewer（VS 拡張）で。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2017-04-12T23:56:43+09:00