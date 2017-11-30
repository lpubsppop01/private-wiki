# タイムスタンプテキストを更新する PowerShell スクリプト
書いてはみた。文字コード・改行コードまわりはまだいい加減。
一応 VS Code の Run on Save と組み合わせて Emacs の time-stamp っぽい動きになる。
でも更新後にエディタが再読み込みするのを待つわけで、ちょっとタイミングずれる。

```powershell
# UpdateTimestampField.ps1

# TODO: Encoding

# Check arguments
$commandName = Split-Path -Leaf $PSCommandPath
if ($args.Length -eq 0) {
    Write-Output "Usage: $commandName FILE ..."
    return
}

# Work variables
$inputFilePath = Join-Path $PSScriptRoot "Test.txt"
$tempFilePath = [System.IO.Path]::GetTempFileName()
$lastWriteTime = (Get-ItemProperty $inputFilePath).LastWriteTime

# Patterns
$createdPattern = [regex]"(.* Created: )(.*)";
$lastModifiedPattern = [regex]"(.* Last modified: ).*"

# Write modified content to temp file
Get-Content -Encoding UTF8 $inputFilePath | Select-Object -First 10 | ForEach-Object {
    $m = $createdPattern.Matches($_);
    if ($m -ne $null) {
        $header = $m[0].Groups[1].Value
        $value = $m[0].Groups[2].Value
        if ([string]::IsNullOrEmpty($value)) {
            $value = (Get-ItemProperty $inputFilePath).CreationTime.ToString("yyyy/MM/dd hh:mm:ss")
        }
        return $header + $value
    }
    $m = $lastModifiedPattern.Matches($_)
    if ($m -ne $null) {
        $header = $m[0].Groups[1].Value
        $value = (Get-ItemProperty $inputFilePath).LastWriteTime.ToString("yyyy/MM/dd hh:mm:ss")
        return $header + $value
    }
    return $_ 
} | Out-File -Encoding UTF8 $tempFilePath

# Update target file but keep last write time
Copy-Item $tempFilePath $inputFilePath
(Get-ItemProperty $inputFilePath).LastWriteTime = $lastWriteTime
Remove-Item $tempFilePath

```