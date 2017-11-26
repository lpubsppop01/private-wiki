# PEG メモ
なかなかうまく書けないのでポイントごとにメモしておく。
確認は PEG.js にて。
- [Online version » PEG.js – Parser Generator for JavaScript](https://pegjs.org/online)

行の繰り返しで最後１行の末尾に改行がなくてもいいように：
```
Start   = Line*
Line    = EOL / Content+ (EOL / EOF)
EOL     = '\n' / '\r\n' / '\r'
EOF     = !.
Content = [^\r\n]+
```