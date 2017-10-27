# Visual Studio 2017 の MSBuild.exe
Community だと以下にある。
```
C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\MSBuild.exe
```

MSBuild でビルドすると
- プロジェクトで設定した FrameworkVersion がなぜか反映されない
- `/p:TargetFrameworkVersion=4.6.1` とすると反映されるけどビジュアライザとしてはエラーが出て動かない

という現象に職場で悩んでたのだが、今自宅にて [Jaex/ImageVisualizer](https://github.com/Jaex/ImageVisualizer) で確認したら MSBuild でビルドしても問題なかった。
何か他に差があるのかー。