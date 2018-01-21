# Chocolatey でパッケージの登録だけ削除
Chocolatey でインストールしたパッケージのアンインストールをせずに Chocolatey の登録だけを削除する方法。
```
> choco uninstall myExamplePackage -n --skipautouninstaller
```

参考：
- [Remove Chocolatey registration without uninstalling application - Super User](https://superuser.com/questions/1011003/remove-chocolatey-registration-without-uninstalling-application)