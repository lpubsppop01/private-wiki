# Math.jsでアフィン変換
```
JavaScript でアフィン変換がほしくて幾何・ベクター描画関連のライブラリをググり、
サンプルを見て使い方がだいたい想像できた Math.js でやってみたもの。
Vector は長さ 2 or 3 の Array で表現（手抜き）。

AffineTrans:
---
// v' = v * M で表す後掛け方式を採用。

var math = mathjs();

var AffineTrans = {
    getIdentity3: function() {
        return math.matrix([[1, 0, 0],
                            [0, 1, 0],
                            [0, 0, 1]]);
    },
    getIdentity4: function() {
        return math.matrix([[1, 0, 0, 0],
                            [0, 1, 0, 0],
                            [0, 0, 1, 0],
                            [0, 0, 0, 1]]);
    },
    getTranslation2d: function(dx, dy) {
        return math.matrix([[1, 0, 0],
                            [0, 1, 0],
                            [dx, dy, 1]]);
    },
    getTranslation3d: function(dx, dy, dz) {
        return math.matrix([[1, 0, 0, 0],
                            [0, 1, 0, 0],
                            [0, 0, 1, 0],
                            [dx, dy, dz, 1]]);
    },
    getScaling2d: function(sx, sy) {
        return math.matrix([[sx, 0, 0],
                            [0, sy, 0],
                            [0, 0, 1]]);
    },
    getScaling3d: function(sx, sy, sz) {
        return math.matrix([[sx, 0, 0, 0],
                            [0, sy, 0, 0],
                            [0, 0, sz, 0],
                            [0, 0, 0, 1]]);
    },
    getRotation2d: function(angle) {
        var cos = math.cos(angle);
        var sin = math.sin(angle);
        return math.matrix([[cos, sin, 0],
                            [-sin, cos, 0],
                            [0, 0, 1]]);
    },
    normalize3d: function(vec3) {
        var length = math.sqrt(vec3[0] * vec3[0] + vec3[1] * vec3[1] + vec3[2] * vec3[2]);
        return [vec3[0] / length, vec3[1] / length, vec3[2] / length];
    },
    getRotation3d: function(axis, angle) {
        // http://www.laksmido.com/3010.html
        var unit = AffineTrans.normalize3d(axis);
        var x = unit[0];
        var y = unit[1];
        var z = unit[2];
        var cos = math.cos(-angle);
        var sin = math.sin(-angle);
        return math.matrix([[x * x * (1 - cos) + cos,
                             x * y * (1 - cos) + z * sin,
                             z * x * (1 - cos) - y * sin,
                             0],
                            [x * y * (1 - cos) - z * sin,
                             y * y * (1 - cos) + cos,
                             y * z * (1 - cos) + x * sin,
                             0],
                            [z * x * (1 - cos) + y * sin,
                             y * z * (1 - cos) - x * sin,
                             z * z * (1 - cos) + cos,
                             0],
                            [0, 0, 0, 1]]);
    },
    getLocalToWorld2d: function(origin, axisX, axisY) {
        if (axisX == null) {
            axisX = AffineTrans.transform2d(axisY, AffineTrans.getRotation2d(-math.PI / 2));
        } else if (axisY == null) {
            axisY = AffineTrans.transform2d(axisX, AffineTrans.getRotation2d(math.PI / 2));
        }
        return math.matrix([[axisX[0], axisY[0], origin[0]],
                            [axisX[1], axisY[1], origin[1]],
                            [0, 0, 1]]);
    },
    getLocalToWorld3d: function(origin, axisX, axisY, axisZ) {
        if (axisX == null) {
            axisX = AffineTrans.transform3d(axisZ, AffineTrans.getRotation3d(axisY, -math.PI / 2));
        } else if (axisY == null) {
            axisY = AffineTrans.transform3d(axisX, AffineTrans.getRotation3d(axisZ, -math.PI / 2));
        } else if (axisZ == null) {
            axisZ = AffineTrans.transform3d(axisY, AffineTrans.getRotation3d(axisZ, -math.PI / 2));
        }
        return math.matrix([[axisX[0], axisY[0], axisZ[0], origin[0]],
                            [axisX[1], axisY[1], axisZ[1], origin[1]],
                            [axisX[2], axisY[2], axisZ[2], origin[2]],
                            [0, 0, 0, 1]]);
    },
    transform2d: function(vec2, mat33) {
        var vec2AsMat13 = math.matrix([vec2[0], vec2[1], 1]);
        var resultMat13 = math.multiply(vec2AsMat13, mat33);
        return resultMat13.toArray().splice(0, 2);
    },
    transform3d: function(vec3, mat44) {
        var vec3AsMat14 = math.matrix([vec3[0], vec3[1], vec3[2], 1]);
        var resultMat14 = math.multiply(vec3AsMat14, mat44);
        return resultMat14.toArray().splice(0, 3);
    }
};
---
```

------------------------------------------------------------------------

Converted from Evernote content created at 2014-03-23T20:12:21+09:00