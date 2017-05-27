# バックアップスクリプト PowerShell 版
ポイント：
- リストアにツールが不要であること
- 対象の追加が単純作業であること
- 複数のマシンで同じバックアップ先に書き込んでも競合しないこと

TODO：
- バージョン管理に未反映のローカル変更
    - TFS ならシェルブが便利だがパッチでもどうにかできないか？
    - Visual Studio Team Services の無料枠（5 人まで）で TFS 使えるから家でも試せる
- VS Code の設定
    - 確か gist か何かにバックアップする機能があったと思うが、職場では難しいだろう
    
```
# MyBackup.psm1

$backupDestRootDir = "D:\BackupTest"

$hostname = (hostname)
$glueChar = "_"

$message_Error =    "Error     :"
$message_Done =     "Done      :"
$message_NoChange = "No Change :"

function Get-SanitizedFilename($filename) {
    return $filename -replace "\\|/|:|\*|\?|`"|<|>|\|| ", $glueChar
}

function Copy-FileWithTimestamp($srcPath, $destPath) {
    $creationTime = (Get-Item $srcPath).CreationTime
    $lastWriteTime = (Get-Item $srcPath).LastWriteTime
    Copy-Item $srcPath $destPath
    (Get-Item $destPath).CreationTime = $creationTime
    (Get-Item $destPath).LastWriteTime = $lastWriteTime
}

function Copy-FilesWithTimeStamp($srcPath, $destPath) {
    if ((Get-Item $srcPath).PSIsContainer) {
        robocopy /mir $srcPath $destPath > $null
        if ($LASTEXITCODE -eq 0) {
            Write-Host $message_NoChange $srcPath
        } else {
            Write-Host $message_Done $srcPath
        }
    } else {
        if (!(Test-Path $destPath) -or
            ((Get-Item $srcPath).LastWriteTime -gt (Get-Item $destPath).LastWriteTime)) {
            Copy-FileWithTimestamp $srcPath $destPath
            Write-Host $message_Done $srcPath
        } else {
            Write-Host $message_NoChange $srcPath
        }
    }
}

function Backup-Files($srcBasePath, $srcRelPath=$null) {
    if ($srcRelPath -eq $null) {
        $srcPath = $srcBasePath
        $destPath = Join-Path $backupDestRootDir ($hostname + $glueChar + (Get-SanitizedFilename $srcPath))
        Copy-FilesWithTimeStamp $srcPath $destPath
        return
    }

    $srcPath = Join-Path $srcBasePath $srcRelPath
    if (!(Test-Path $srcPath)) {
        Write-Host $message_Error $srcPath
        return
    }

    $destBaseDirName = $hostname + $glueChar + (Get-SanitizedFilename $srcBasePath)
    $destBaseDir = Join-Path $backupDestRootDir $destBaseDirName
    $destPath = Join-Path $destBaseDir $srcRelPath
    
    $destParentDir = Split-Path -Parent $destPath
    if (!(Test-Path $destParentDir)) {
        mkdir $destParentDir > $null
    }

    Copy-FilesWithTimeStamp $srcPath $destPath
}

function Get-FirefoxProfileDirName() {
    $appData = [Environment]::GetFolderPath("ApplicationData")
    $item = Get-Item ($appData + "\Mozilla\Firefox\Profiles\*.default")
    if ($item -eq $null) {
        return $null
    }
    return $item.Name
}

function Save-ChocolateyInstalledPackageList() {
    $myDocs = [Environment]::GetFolderPath("MyDocuments")
    $destDir = Join-Path $myDocs "ConfigDumps\chocolatey"
    $destPath = Join-Path $destDir "packages.config"

    if (!(Test-Path $destDir)) {
        mkdir $destDir > $null
    }

    $installedIDs = (clist -lo | Select-String '([^ ]+) [0-9\.]+' | ForEach-Object { $_.Matches.Groups[1].Value })

    Set-Content $destPath "<?xml version=""1.0""?>"
    Add-Content $destPath "<!-- Usage: cinst packages.config -->"
    Add-Content $destPath "<packages>"
    foreach ($id in $installedIDs) {
        Add-Content $destPath "  <package id=""$id"" />"
    }
    Add-Content $destPath "</packages>"
}

function Save-NPMGlobalInstalledPackageList() {
    $myDocs = [Environment]::GetFolderPath("MyDocuments")
    $destDir = Join-Path $myDocs "ConfigDumps\npm"
    $destPath = Join-Path $destDir "ls.txt"

    if (!(Test-Path $destDir)) {
        mkdir $destDir > $null
    }

    $installedIDs = npm ls -g --depth=0 | Select-String '[^ ]+ (.*)@[0-9\.]+' | ForEach-Object { $_.Matches.Groups[1].Value }

    Write-Output $null > $destPath
    foreach ($id in $installedIDs) {
        Add-Content $destPath $id
    }
}

Export-ModuleMember -Variable backupDestRootDir
Export-ModuleMember -Function Backup-Files
Export-ModuleMember -Function Get-FirefoxProfileDirName
Export-ModuleMember -Function Save-ChocolateyInstalledPackageList
Export-ModuleMember -Function Save-NPMGlobalInstalledPackageList
```

```
# Backup.ps1

Import-Module MyBackup
$destRootDir = "D:\BackupTest"

# Documents
$myDocs = [Environment]::GetFolderPath("MyDocuments")
Backup-Files $myDocs "AnyTextFilterVSIX"
Backup-Files $myDocs "ConfigDumps"
Backup-Files $myDocs "Visual Studio 2013\Projects"
Backup-Files $myDocs "Visual Studio 2013\Settings"
Backup-Files $myDocs "Visual Studio 2015\Projects"
Backup-Files $myDocs "Visual Studio 2015\Settings"
Backup-Files $myDocs "Visual Studio 2017\Projects"
Backup-Files $myDocs "Visual Studio 2017\Settings"
Backup-Files $myDocs "WindowsPowerShell"

# IE Favorites
$favorites = [Environment]::GetFolderPath("Favorites")
Backup-Files $favorites

# Firefox Bookmarks
$firefoxProfileDirName = Get-FirefoxProfileDirName
if ($firefoxProfileDirName -ne $null) {
    $appData = [Environment]::GetFolderPath("ApplicationData")
    Backup-Files $appData "Mozilla\Firefox\Profiles\${firefoxProfileDirName}\bookmarks.html"
}

# Google Chrome Bookmarks
$localAppData = [Environment]::GetFolderPath("LocalApplicationData")
Backup-Files $localAppData "Google\Chrome\User Data\Default\Bookmarks"
```