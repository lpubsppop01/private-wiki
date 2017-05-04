# Markdown XAML
```
AnyTextFilterVSIX の README.md をリッチな感じで表示したくて試してみたが、
どうもいろいろ設定しないと望む形で表示できそうにない。
・リンクがリンクにならない。
・行末のスペースふたつによる強制改行が効かないなど、github と微妙な挙動の差がある。
どちらもたぶん解決できるのだが、
この用途だと単に Markdown→HTML コンバータを使って HTML を表示した方が手数が少なくて済みそう。
→結局 Markdig を使用した。とても楽。

---

コミットするつもりでスクリプトを書いたので一応メモしておく。
このファイルを sln と同レベルに置くといい感じになる。

UpdateExternalLibraries.ps1
---

$prefix = "UpdateExternalLibraries:"

# Check commands
if ((gcm git) -eq $null) {
    Write-Error "$prefix git is required."
    exit
}
$MSBuildVS2015 = 'C:\Program Files (x86)\MSBuild\14.0\Bin\MSBuild.exe'
if ((gcm $MSBuildVS2015) -eq $null) {
    Write-Error "$prefix MSBuild of Visual Studio 2015 is required."
    exit
}

# Prepare ExternalLibraries directory
$slnDirPath = (Split-Path $MyInvocation.MyCommand.Source -Parent)
$extLibDirPath = Join-Path $slnDirPath "ExternalLibraries"
$extLibSrcDirPath = Join-Path $slnDirPath "ExternalLibraries\src"
if (!(Test-Path -Path $extLibSrcDirPath)) {
    New-Item -ItemType Directory $extLibSrcDirPath | Out-Null
}

# Markdown XAML
# * VS2015 (or later) is required because nameof operator is used.
$MarkdownXAMLSrcDirPath = Join-Path $extLibSrcDirPath "Markdown.XAML"
if (!(Test-Path $MarkdownXAMLSrcDirPath)) {
    git clone "https://github.com/theunrepentantgeek/Markdown.XAML.git" $MarkdownXAMLSrcDirPath
}
&$MSBuildVS2015 (Join-Path $MarkdownXAMLSrcDirPath "Markdown.Xaml.sln") /p:Configuration=Release
$MarkdownXAMLDirPath = Join-Path $extLibDirPath "Markdown.XAML"
if (!(Test-Path -Path $MarkdownXAMLDirPath)) {
    New-Item -ItemType Directory $MarkdownXAMLDirPath | Out-Null    
}
cp (Join-Path $MarkdownXAMLSrcDirPath "build\Markdown.Xaml\Release\Markdown.Xaml.dll") (Join-Path $MarkdownXAMLDirPath "Markdown.Xaml.dll")
cp (Join-Path $MarkdownXAMLSrcDirPath "License.txt") (Join-Path $MarkdownXAMLDirPath "License.txt")

---
```

------------------------------------------------------------------------

Converted from Evernote content created at 2017-04-22T16:28:21+09:00