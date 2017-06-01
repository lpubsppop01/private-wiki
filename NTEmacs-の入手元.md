# NTEmacs の入手元
NTEmacs（Emacs の Windows バイナリ）の入手元。
- 25.2
    - [chuntaro/NTEmacs64](https://github.com/chuntaro/NTEmacs64)
        - MSYS2 でビルド
        - `-mtune=corei7` なので AMD CPU では動かないかも
            - Phenom II X4 なマシンでも動いた
    - [NTEmacsビルド(25.2)](http://cha.la.coocan.jp/doc/NTEmacsBuild252.html)
        - MSYS2 でビルド
        - `-mtune=pentium4`
        - 元々使っていた 24 系とパッチが違うらしく、日本語入力できるけどいまいち