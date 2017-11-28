# FlashDevelop
Haxe の開発環境として FlashDevelop を使うためのあれこれ。

インストール：
- 本体
    - 公式サイトから zip アーカイブ版をダウンロード
    - バグ修正は遅い雰囲気なので複数バージョンを併存できる形で運用
    - Chocolatey のパッケージは古いので NG
- Java 8 x86
    - Chocolatey から入れる場合は `cinst jre8 /exclude:64`
    - `JAVA_HOME` を要設定

FlashDevelop 上で SDK インストール：
- Haxe x64
    - Chocolatey の Haxe はどうパスを設定すればいいかわからない
- Flash

プロジェクトの作り方：
- Haxe Flash テンプレートを使って新規作成
    - Neko の方がシンプルなのだがデバッガがないので
- 単体テストを `test` フォルダに格納する場合：
    - Project ペインでフォルダを追加
    - プロジェクトプロパティでクラスパスを追加
        - 追加すると Compiler Options の Main Class がクリアされるのでそちらも再設定
- 複数のターゲットを設ける場合は hxml ファイルを使うのであまり関係ないかも