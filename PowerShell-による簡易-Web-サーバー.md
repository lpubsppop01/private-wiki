# PowerShell による簡易 Web サーバー
```
スクリプトファイルがあるフォルダをルートとする簡易な Web サーバースクリプト。
これはお試しの Web ベースツールを共有するのに使えそう。

httpListener.ps1（$HomePage だけ改変した版）
---
param($Port=18080, $HomePage='index.html', $DefaultPage=$HomePage)
$urlRoot = "http://localhost:$Port/"
$urlMain = $urlRoot+$HomePage
$parentPath = [IO.Path]::GetDirectoryName($MyInvocation.InvocationName)

$listener = New-Object Net.HttpListener
$listener.Prefixes.add($urlRoot)

try{
    "localhostで簡易httpサーバーを作動させます。"|oh
    try {
        $listener.Start()
    } finally {
        #起動ついでにブラウザで開いてやる
        #Start()に失敗するケースでも既にHttpサーバーが動いているケースを期待してURLは開く
        "$urlMain を開きます。"|oh
        start $urlMain
    }

    $running = $true
    while($running){
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        ($url = $request.RawUrl)|oh
        $path = $url.TrimStart('/').split("?")[0]
        if(!$path) {
            "def:"+$DefaultPage|oh
            $path = $DefaultPage
        }

        $fullPath = [IO.Path]::Combine($parentPath, $path)
        $content = [byte[]]@()
        if( [IO.File]::Exists($fullPath) ){
            $content = [IO.File]::ReadAllBytes($fullPath)
        } else {
            $response.StatusCode = 404
        }

        $response.OutputStream.Write($content, 0, $content.Length)
        $response.Close()
    }
} finally {
    #スクリプトではあまり真面目にリソース管理しようとは思わないけれども一応
    $listener.Dispose()
}
'終了します。'|oh
pause
---

---------------------------------------------------------------

PowerShellでHTTPサーバー的なものを作る - Qiita:
http://qiita.com/kikuchi/items/785631cb24dfe5fa8d52
```

------------------------------------------------------------------------

Converted from Evernote content created at 2016-07-04T22:10:00+09:00