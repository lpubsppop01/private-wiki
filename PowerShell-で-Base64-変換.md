# PowerShell で Base64 変換
```
ローカルで完結し紹介しやすい方法ということで PowerShell で Base64 を取得。
ショートカットを SendTo に置く想定。

Base64に変換してクリップボード出力.ps1
---
Param([String]$path)
[Convert]::ToBase64String((get-content "$path" -encoding byte)) | clip
Add-Type -AssemblyName PresentationFramework
[System.Windows.MessageBox]::Show("Base64 をクリップボードに出力しました")
---

ショートカットのリンク先
---
%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -WindowStyle Hidden "...\Base64に変換してクリップボード出力.ps1"
---

---------------------------------------------------------------

Base64 Encoding of Images via Powershell - LINQ to Fail:
http://www.aaron-powell.com/posts/2010-11-07-base64-encoding-images-with-powershell.html
```

------------------------------------------------------------------------

Converted from Evernote content created at 2016-09-18T23:27:40+09:00