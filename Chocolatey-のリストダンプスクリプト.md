# Chocolatey のリストダンプスクリプト
```
# DumpChocolateyList.ps1

$myDocs = [Environment]::GetFolderPath("MyDocuments")
$destDir = Join-Path $myDocs "ConfigDumps\chocolatey"
$destPath = Join-Path $destDir "packages.config"

if (!(Test-Path $destDir)) {
    mkdir $destDir > $null
}

$installedIDs = (clist -lo | sls '([^ ]+) [0-9\.]+' | % { $_.Matches.Groups[1].Value })

Set-Content $destPath "<?xml version=""1.0""?>"
Add-Content $destPath "<!-- Usage: cinst packages.config -->"
Add-Content $destPath "<packages>"
foreach ($id in $installedIDs) {
    Add-Content $destPath "  <package id=""$id"" />"
}
Add-Content $destPath "</packages>"
```