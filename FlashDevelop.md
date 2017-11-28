# FlashDevelop
Haxe の開発環境として FlashDevelop を使うためのあれこれ。

インストール：
- 本体
    - 公式サイトから zip アーカイブ版をダウンロード
    - バグ修正は遅い雰囲気なので複数バージョンを併存（5.3 はデバッガが動かない…）
    - Chocolatey のパッケージは古いので NG
- Java 8 x86
    - Chocolatey から入れる場合は `cinst jre8 /exclude:64`
    - `JAVA_HOME` を要設定

FlashDevelop 上で SDK インストール：
- Haxe + Neko (x64)
    - Chocolatey の Haxe はどうパスを設定すればいいかわからない
- Flash Player (SA)
    - インストールフォルダ下の Apps というフォルダに配置される

プロジェクトの作り方：
- Haxe Flash テンプレートを使って新規作成
    - Neko の方がシンプルなのだがデバッガがない
- 単体テストを `test` フォルダに格納する場合：
    - Project ペインでフォルダを追加
    - プロジェクトプロパティでクラスパスを追加（hxml を使う場合は不要と思う）
        - 追加すると Compiler Options の Main Class がクリアされるのでそちらも再設定
- hxml ファイルを使ってビルドする場合：
    - `build.hxml` などをプロジェクトフォルダに追加
    - プロジェクトプロパティで Compile Target を Custom Build に変更
    - Build Command の Pre Build に `haxe $(ProjectDir)\build.hxml` を追加