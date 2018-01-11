# Debug Interface Access SDK
pdb の情報を読み取る（書き込みも？）公式のライブラリ。
- [Debug Interface Access SDK](https://msdn.microsoft.com/en-us/library/x93ctkx8.aspx)

使いにくいとのことでサードパーティーのものも多く作られているけど C# 向けのは見つからなかった（よく探せばありそう）。

とりあえず上記の DIA SDK はサンプルが `C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\DIA SDK\Samples\DIA2Dump` にある。
そのままだと include のパスに問題があるためビルドできない。
Windows SDK のバージョンを 10 系に上げてインクルードパスとライブラリパスを標準の場所を含むように直せばビルドできる。

---

今どきのはこれか。
- [NuGet Gallery | Microsoft.DiaSymReader 1.2.0](https://www.nuget.org/packages/Microsoft.DiaSymReader)
    - [dotnet/symreader: Managed definitions for COM interfaces exposed by DiaSymReader APIs](https://github.com/dotnet/symreader)

なんかまだあるっぽい。
- [Big picture on Symbol APIs – Mike Stall's .NET Debugging Blog](https://blogs.msdn.microsoft.com/jmstall/2005/10/08/big-picture-on-symbol-apis/)
眠いのでまた今度。