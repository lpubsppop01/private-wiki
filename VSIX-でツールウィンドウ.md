# VSIX でツールウィンドウ
Visual Studio Extension でツールウィンドウ（VS 内部に表示されてるドッキングできるウィンドウ）を作る流れ。
- `ToolWindowPane` を継承したクラスを定義
  ```csharp
  [Guid("17E23D6E-0DEF-44ED-ACB7-ACD0A2EF7F01")]
  public class HogeWindowPane : ToolWindowPane
  {
      public HogeWindowPane()
      {
          Caption = "Hoge";
          Content = new HogeControl();
      }
  }
  ```
- Package 継承クラスに属性追加：
  ```csharp
  [ProvideToolWindow(typeof(HogeWindowPane), Style = VsDockStyle.Tabbed, Orientation = ToolWindowOrientation.Bottom)]
  ```
- Package 継承クラスで以下のように表示：
  ```csharp
  var window = this.FindToolWindow(typeof(HogeWindowPane), 0, true);
  if ((null == window) || (null == window.Frame))
  {
      throw new NotSupportedException("Cannot create tool window");
  }
  IVsWindowFrame windowFrame = (IVsWindowFrame)window.Frame;
  Microsoft.VisualStudio.ErrorHandler.ThrowOnFailure(windowFrame.Show());
  ```

---

参考リンク：
- [ツール ウィンドウを追加します。](https://msdn.microsoft.com/ja-jp/library/cc138567.aspx)