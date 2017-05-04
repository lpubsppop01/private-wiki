# ping など Windows コマンドの文字化け対策
```
[2012-12-28 23:49] 

ping や ipconfig などの Windows コマンドは出力が SJIS であるため
UTF-8 な最近の Cygwin 環境では正しく表示されない。

ナイスな解決策:
http://d.hatena.ne.jp/takuya_1st/20110811/1313045543

Python 版を作ってみた:
stdout_sjis_to_utf-8.py
---
#!/usr/bin/env python

import sys
import os
from subprocess import Popen, PIPE

command = os.path.basename(__file__) + '.exe'
process = Popen([command] + sys.argv[1:], stdout=PIPE)
while True:
    line = process.stdout.readline()
    if not line:
        break
    try:
        print line.decode('shift_jis'),
    except:
        print line,
process.wait()
---

出力をリダイレクトしたりパイプにつないだりすると decode に失敗するため
そのまま print しているが lv で受ければ問題なし。

参考サイトではコピーしているが Cygwin のシンボリックリンクでも構わない。
```

------------------------------------------------------------------------

Converted from Evernote content created at 2013-03-17T18:58:11+09:00