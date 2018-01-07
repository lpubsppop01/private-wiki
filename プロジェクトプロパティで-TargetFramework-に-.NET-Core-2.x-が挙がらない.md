# プロジェクトプロパティで TargetFramework に .NET Core 2.x が挙がらない
.NET Core または Standard のプロジェクトをプロジェクトテンプレートから作成し、ビルドしようとすると失敗する。
```
The current .NET SDK does not support targeting .NET Standard 2.0.  Either target .NET Standard 1.6 or lower, or use a version of the .NET SDK that supports .NET Standard 2.0.	
```

いろいろ試したが解消せず。VS2017 から .NET Core 2.x が見えてないっぽい。
- .NET Core SDK 1.0.3 と 1.0.4 が入っていたのでアンインストール。
    - [The current .NET SDK does not support targeting .NET Standard 2.0 error in Visual Studio 2017 update 15.3 - Stack Overflow](https://stackoverflow.com/questions/45732236/the-current-net-sdk-does-not-support-targeting-net-standard-2-0-error-in-visua)

- [.NET Core 2.0 missing from my Visual Studio - Stack Overflow](https://stackoverflow.com/questions/45778942/net-core-2-0-missing-from-my-visual-studio)

- VS インストーラからどうにかならないか？
    - .NET Core クロスプラットホーム開発を追加（必要ではあったはず）
    - 修復