# テキストファイルのエンコーディングを UTF-8 に変換
Windows 環境で作成した howm メモが shift-jis と utf-8 が混ざった状態になっており、VS Code（ripgrep）で検索しようとしたら shift-jis の日本語にヒットしないという。

精度のいい自動判別と変換がほしい、となると lv か nkf。Windows ネイティブなバイナリが手に入りやすいのは nkf の方。
- [nkf.exe nkf32.dll Windows用の詳細情報 : Vector ソフトを探す！](http://www.vector.co.jp/soft/win95/util/se295331.html)

上記の nkf を使って一括変換するスクリプト：
```powershell
# JaTextToUTF8.ps1

$here = Split-Path -Parent $MyInvocation.MyCommand.Source
$nkf = Join-Path $here "opt\nkfwin\vc2005\win32(98,Me,NT,2000,XP,Vista,7)Windows-31J\nkf32.exe"

$rootDir = "D:\Kotaro\Documents\WindowsPowerShell\jatext"
$filenamePattern = ".*\.(txt|howm)"

$message_Done     = "Done      :"
$message_NoChange = "No Change :"

Get-ChildItem -Recurse $rootDir | ForEach-Object {
    if ($_.Name -match $filenamePattern) {
        $encName = (& $nkf -g $_.FullName)
        if ($encName -eq "ISO-2022-JP" -or $encName -eq "Shift_JIS" -or $encName -eq "EUC-JP") {
            & $nkf -w --overwrite $_.FullName
            Write-Host $message_Done $_.FullName
        } else {
            Write-Host $message_NoChange $_.FullName
        }
    }
}
```

nkf の `--overwrite` オプションは更新日時を維持してくれるので、この手の用途にはありがたい。

参考：
- [文字コード変換コマンドの nkfの使い方と実例をまとめました。 - それマグで！](http://takuya-1st.hatenablog.jp/entry/20100511/1273585953)