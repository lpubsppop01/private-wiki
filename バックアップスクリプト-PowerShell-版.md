# バックアップスクリプト PowerShell 版
ポイント：
- リストアにツールが不要であること
- 対象の追加が単純作業であること

TODO：
- バージョン管理に未反映のローカル変更
    - TFS ならシェルブが便利だがパッチでもどうにかできないか？
- Visual Studio の設定はいけないか？
- VS Code の設定
    - 確か gist か何かにバックアップする機能があったと思うが、職場では難しいだろう

```
# Backup.ps1

$destRootDir = "D:\BackupTest"

#region Functions

$hostname = (hostname)
$glueChar = "_"

$message_Error =    "Error     :"
$message_Done =     "Done      :"
$message_NoChange = "No Change :"

function SanitizeFilename($filename) {
    return $filename -replace "\\|/|:|\*|\?|`"|<|>|\|| ", $glueChar
}

function CopyFileWithTimestamp($srcPath, $destPath) {
    $creationTime = (gi $srcPath).CreationTime
    $lastWriteTime = (gi $srcPath).LastWriteTime
    copy $srcPath $destPath
    (gi $destPath).CreationTime = $creationTime
    (gi $destPath).LastWriteTime = $lastWriteTime
}

function CopyFilesWithTimeStamp($srcPath, $destPath) {
    if ((gi $srcPath).PSIsContainer) {
        robocopy /mir $srcPath $destPath > $null
        if ($LASTEXITCODE -eq 0) {
            Write-Host $message_NoChange $srcPath
        } else {
            Write-Host $message_Done $srcPath
        }
    } else {
        if (!(Test-Path $destPath) -or ((gi $srcPath).LastWriteTime -gt (gi $destPath).LastWriteTime)) {
            CopyFileWithTimestamp $srcPath $destPath
            Write-Host $message_Done $srcPath
        } else {
            Write-Host $message_NoChange $srcPath
        }
    }
}

function BackupFiles($srcPath) {
    $destPath = Join-Path $destRootDir ($hostname + $glueChar + (SanitizeFilename $srcPath))
    CopyFilesWithTimeStamp $srcPath $destPath
}

function BackupFiles2($srcBaseDir, $srcRelPath) {
    $srcPath = Join-Path $srcBaseDir $srcRelPath
    if (!(Test-Path $srcPath)) {
        Write-Host $message_Error $srcPath
        return
    }

    $destBaseDirName = $hostname + $glueChar + (SanitizeFilename $srcBaseDir)
    $destBaseDir = Join-Path $destRootDir $destBaseDirName
    $destPath = Join-Path $destBaseDir $srcRelPath
    
    $destParentDir = Split-Path -Parent $destPath
    if (!(Test-Path $destParentDir)) {
        mkdir $destParentDir > $null
    }

    CopyFilesWithTimeStamp $srcPath $destPath
}

function GetFirefoxProfileDirName($appData) {
    $item = gi ($appData + "\Mozilla\Firefox\Profiles\*.default\bookmarks.html")
    if ($item -eq $null) {
        return $null
    }
    return $item.Directory.Name
}

#endregion

# Documents
$myDocs = [Environment]::GetFolderPath("MyDocuments")
BackupFiles2 $myDocs "Visual Studio 2013\Projects"
BackupFiles2 $myDocs "WindowsPowerShell"

# IE Favorites
$favorites = [Environment]::GetFolderPath("Favorites")
BackupFiles $favorites

# Firefox Bookmarks
$appData = [Environment]::GetFolderPath("ApplicationData")
$firefoxProfileDirName = GetFirefoxProfileDirName $appData
if ($firefoxProfileDirName -ne $null) {
    BackupFiles2 $appData "Mozilla\Firefox\Profiles\${firefoxProfileDirName}\bookmarks.html"
}

# Google Chrome Bookmarks
$localAppData = [Environment]::GetFolderPath("LocalApplicationData")
BackupFiles2 $localAppData "Google\Chrome\User Data\Default\Bookmarks"
```