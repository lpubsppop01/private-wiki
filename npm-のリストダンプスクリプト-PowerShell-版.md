# npm のリストダンプスクリプト PowerShell 版
```
# DumpNPMList.ps1

$myDocs = [Environment]::GetFolderPath("MyDocuments")
$destDir = Join-Path $myDocs "ConfigDumps\npm"
$destPath = Join-Path $destDir "ls.txt"

if (!(Test-Path $destDir)) {
    mkdir $destDir > $null
}

$installedIDs = npm ls -g --depth=0 | sls '[^ ]+ (.*)@[0-9\.]+' | % { $_.Matches.Groups[1].Value }

echo $null > $destPath
foreach ($id in $installedIDs) {
    Add-Content $destPath $id
}
```