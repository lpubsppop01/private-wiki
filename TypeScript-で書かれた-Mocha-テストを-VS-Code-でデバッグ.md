# TypeScript で書かれた Mocha テストを VS Code でデバッグ
VS Code のデバッグ実行は設定ファイル `.vscode/launch.json` を使う。ビルドまわりに使うタスクは `.vscode/tasks.json` で、似たようなものに思えても別に用意する必要がある。
```
{
    "version": "0.0.0",
    "configurations": [
        {
            "name": "Run Mocha",
            "type": "node",
            "runtimeArgs": ["--inspect"],
            "request": "launch",
            "protocol": "inspector",
            "preLaunchTask": "build",
            "cwd": "${workspaceRoot}",
            "program": "${workspaceRoot}/node_modules/mocha/bin/_mocha",
            "args": ["--compilers", "ts:ts-node/register", "test/howm-parser-spec.ts"]
        }
    ]
}
```

SourceMap やビルド対象の設定は結局いじらなくても動いた。ts-node の効果？
- [unit testing - Typescript debugging mocha tests with VSCode - Stack Overflow](http://stackoverflow.com/questions/36984357/typescript-debugging-mocha-tests-with-vscode)
- [Debugging Mocha Tests Written in TypeScript with Visual Studio Code | Saravana J](https://saravanaj.github.io/2017/02/05/debugging-mocha-tests-written-in-typescript-with-visual-studio-code/)
- [Debugging TypeScript With ts-node and mocha in Visual Studio Code](http://howiamdoing.net/2017/03/13/Debugging-TypeScript-with-ts-node-and-mocha-in-Visual-Studio-Code.html)
- `--sourceMap`、`--inlineSources`、`--inlineSourceMap` オプションについて
    - [TypeScript 1.5.3 変更点 - Qiita](http://qiita.com/vvakame/items/9b9fde6c71aae6a824c0)