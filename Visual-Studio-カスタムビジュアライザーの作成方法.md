# Visual Studio カスタムビジュアライザーの作成方法
```
Visual Studio デバッガのクイックウォッチなどで虫眼鏡のアイコンを
クリックしたとき動くのがビジュアライザー。
対象オブジェクトをデータ型に適した方法で表示する。

カスタムビジュアライザーはかなり簡単に作成でき、インストールも
"<マイドキュメント>/Visual Studio 2010/Visualizers" に dll を配置するだけ。

------------------------------------------------------------------------

C# クラスライブラリプロジェクトを新規作成し、新しい項目の追加で
"全般/デバッガービジュアライザー" を選択。
特殊なことは行なっていないので手動でも作れる（チュートリアルは手動で作っている）。

最小限のサンプル:
---
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Microsoft.VisualStudio.DebuggerVisualizers;
using Sample;

[assembly: System.Diagnostics.DebuggerVisualizer(
    typeof(SampleVisualizers.HogeVisualizer),
    typeof(SampleVisualizers.HogeVisualizerObjectSource),
    Target = typeof(Hoge),
    Description = "My First Visualizer")]

namespace SampleVisualizers
{
    public class HogeVisualizerObjectSource : VisualizerObjectSource
    {
        public override void GetData(object target, Stream outgoingData)
        {
            var hoge = target as Hoge;
            var writer = new StreamWriter(outgoingData); // outgoingData を Dispose しないように
            writer.WriteLine(hoge.ToString());
            writer.Flush();
        }
    }

    public class HogeVisualizer : DialogDebuggerVisualizer
    {
        override protected void Show(IDialogVisualizerService windowService, IVisualizerObjectProvider objectProvider)
        {
            var reader = new StreamReader(objectProvider.GetData()); // こちらは Dispose してもよいかもだが
            var value = reader.ReadToEnd();
            Hoge hoge;
            if (Hoge.TryParse(value, out hoge))
            {
                MessageBox.Show(hoge.ToString());
            }
        }

        public static void TestShowVisualizer(object objectToVisualize)
        {
            VisualizerDevelopmentHost visualizerHost =
                new VisualizerDevelopmentHost(
                    objectToVisualize,
                    typeof(HogeVisualizer),
                    typeof(HogeVisualizerObjectSource));
            visualizerHost.ShowVisualizer();
        }
    }
}
---

------------------------------------------------------------------------

ビジュアライザー:
http://msdn.microsoft.com/ja-jp/library/vstudio/zayyhzts%28v=vs.100%29.aspx

DebuggerVisualizer アドインの作成 – astel-labs.net:
http://astel-labs.net/blog/diary/2012/11/03-2.html

c# - Debugger Visualizer and "Type is not marked as serializable" - Stack Overflow:
http://stackoverflow.com/questions/2959048/debugger-visualizer-and-type-is-not-marked-as-serializable
```

------------------------------------------------------------------------

Converted from Evernote content created at 2013-04-04T22:44:40+09:00