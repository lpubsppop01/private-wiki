# VSIX ビルド前イベントで vsixmanifest ファイルのバージョンをインクリメント
```
VSIX ファイルをインストールするとき、vsixmanifest ファイルの Identity.Version が同値だと上書きできない。
とりあえずの対策として Publish ビルドの度に BuildVersion をインクリメントする形にする方法。

_Build\IncrementBuildVersion.ps1
---
if ($args.Length -gt 0) {
    $configulationName = $args[0]
    if ($configulationName -ine "Publish") {
        return
    }
}
$scriptDirPath = Split-Path $MyInvocation.MyCommand.Path -Parent
$manifestFilePath = Join-Path $scriptDirPath "..\source.extension.vsixmanifest"
$manifestXML = [xml](Get-Content $manifestFilePath)
$identityElement = $manifestXML.SelectSingleNode("//*[local-name(.) = 'Identity']")
$oldVersion = $identityElement.Version
$v = [version]$identityElement.Version
$newVersion = $v.Major.ToString() + "." + $v.Minor.ToString() + "." + ($v.Build + 1).ToString()
Write-Host "Version: $oldVersion -> $newVersion"
$identityElement.Version = $newVersion

$manifestXML.Save($manifestFilePath)
---

プロジェクトプロパティのビルド後イベントで以下を設定
---
powershell -File "$(ProjectDir)_Build\IncrementBuildVersion.ps1" $(ConfigurationName)
---
```

------------------------------------------------------------------------

Converted from Evernote content created at 2017-04-01T23:21:03+09:00