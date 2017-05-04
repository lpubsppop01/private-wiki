# プロジェクト構成を変えないで MSTest
```
[2013-03-16 13:06] 

MSTest を普通に使うとテストプロジェクトを追加する形になるが、
プロジェクト構成がテストなしスタイルで既に固まっていると気が引けるので、
そこまでせずに利用する方法はないかなーと調査。

------------------------------------------------------------------------

ProjectTypeGuids にテストプロジェクトの GUID が含まれているとテストを
実行できる、という仕掛けらしい。
その他にも何点か引っかかるところはあるが、どれもプロジェクトファイルの
書き換えで解決する。

VS2010 の csproj:
---
  <PropertyGroup>
    ...
    <ProjectGuid>{8D5329A0-284E-4282-B78F-09451CE16D11}</ProjectGuid>
    <OutputType>Library</OutputType>
    ...
    <!-- ↓ "Client" だとテストの実行に失敗する（要素ごと削除でも OK） -->
    <TargetFrameworkProfile></TargetFrameworkProfile>
    <FileAlignment>512</FileAlignment>
    <!-- ↓ プロジェクトをテストプロジェクトと認識させる -->
    <ProjectTypeGuids>{3AC096D0-A1C2-E12C-1390-A8335801FDAB};{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}</ProjectTypeGuids>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Debug|AnyCPU' ">
    ...
    <!-- ↓ テストコードの有効・無効切り替えに使用 -->
    <DefineConstants>TRACE;DEBUG;MSTEST_ENABLED</DefineConstants>
    <ErrorReport>prompt</ErrorReport>
    ...
  </PropertyGroup>
  <ItemGroup>
    <!-- ↓ ライブラリへの参照追加 -->
    <Reference Include="Microsoft.VisualStudio.QualityTools.UnitTestFramework, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a, processorArchitecture=MSIL" />
    <Reference Include="System" />
    ...
  </ItemGroup>
---

テストの実行やテンプレートからのテストコード生成は問題なく動いていそうだった。
カバレッジは動きが怪しそうだったが、そもそもその辺は使ったことないのでよし。

一時的にプロジェクトファイルを変更してテストプロジェクトとして扱えればいい。

------------------------------------------------------------------------
アドインとしてまとめられれば上出来…まともに作ったことないけど。
試した感じだと ConfigurationManager 経由で ProjectTypeGuids を追加するのは困難。
アンロードされたプロジェクトのコンテキストメニューから実行して XML を編集する形にするのが妥当だろう。
http://www.atmarkit.co.jp/fdotnet/special/vsaddinintro01/vsaddinintro01_01.html
http://social.msdn.microsoft.com/forums/en-US/vstscode/thread/9dfe769c-6b50-4b59-80dc-95853991c388
http://stackoverflow.com/questions/8719980/add-button-to-the-visual-studio-unloaded-project-context-menu-cant-find-the-co

冷静になってみるとこういうアドインはありそうな気がするのだが、見つからない。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2013-03-19T00:27:08+09:00