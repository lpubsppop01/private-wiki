# SketchUp Ruby で穴開き Face を作る
```
結構長い間謎だったのだが、単純に add_face した Face を削除すればいいようだ。
→だめだった。傾向はわかるが微妙な勾配がついた面などは予想は難しい。
　結局 face.normal.samedirection? で意図した方向と一致するか見て、
　一致してなかったら face.reverse! で対処した。

---
entities = Sketchup.active_model.active_entities
entities.add_face([[0, 0, 0], [0, 0, 100], [100, 0, 100], [100, 0, 0]])
entities.erase_entities entities.add_face([[20, 0, 20], [20, 0, 80], [80, 0, 80], [80, 0, 20]])
---

加えて、普通に add_face に時計回り正で点列を渡せばうまいこと SketchUp 側が Vertex の共有関係を作ってくれるので、
Face だけ意識すればよい。
いろいろ勘違いしてた。

https://www.sketchup.com/intl/en/developer/docs/ourdoc/face
https://www.sketchup.com/intl/en/developer/docs/ourdoc/entities#erase_entities
```

------------------------------------------------------------------------

Converted from Evernote content created at 2016-08-25T22:47:32+09:00