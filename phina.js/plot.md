# ポイント

子要素自身に破棄させることが可能。

```js
this.remove();
```


```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" /><title>2016-04-02 3rd - js do it</title>
<meta name="Description" content="jsdo.it - share JavaScript, HTML5 and CSS - " />
<meta name="Keywords"  content="JavaScript,HTML5,CSS" />
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">

<style type="text/css">* {
  margin: 0;
  padding: 0;
  border: 0;
}

body {
  background: #ffd;
  font: 30px sans-serif;
}</style></head>
<body>
<script src='http://cdn.rawgit.com/phi-jp/phina.js/v0.1.2/build/phina.js'></script>

<script type="text/javascript">
// phina.js をグローバル領域に展開
phina.globalize();

// MainScene クラスを定義
phina.define('MainScene', {
  superClass: 'CanvasScene',
  init: function() {
    this.superInit();
    // 背景色を指定
    this.backgroundColor = '#444';
    // ラベルを生成
    this.label = Label('Hello, phina.js!').addChildTo(this);
    this.label.x = this.gridX.center(); // x 座標
    this.label.y = this.gridY.center(); // y 座標
    this.label.fill = 'white'; // 塗りつぶし色
    this.v = phina.geom.Vector2(0, 0);
      this.t=0;
    for(var t=0; t < 32; t++) {
        var p = CircleShape().addChildTo(this);
        p.fill="hsla("+Math.randint(0, 360)+", 75%, 50%, 1)";
        p.radius=8;
        p.x=120*Math.cos(t/32.0*2*Math.PI)+this.gridX.center()-140;
        p.y=120*Math.sin(t/32.0*2*Math.PI)+this.gridY.center();

    }

  },
  update: function(app) {
        if (app.frame%1==0) {
            var p = CircleShape().addChildTo(this);
            p.fill="hsla("+Math.randint(0, 360)+", 75%, 50%, 1)";
            p.t = 0;
            p.radius=8;
            this.t = this.t + 0.1;
            //p.x=120*Math.cos(this.t)+app.gridX.center();
            p.x=120+app.gridX.center()-140;
            p.y=120*Math.sin(this.t)+app.gridY.center();
            p.update=function(app){
                this.x = this.x+1;
                this.t=this.t+0.1;
                if(this.x>800) {
                    this.remove();
                }
            };            
        }
  },
  draw: function(c) {

  },
});

// メイン処理
phina.main(function() {
  // アプリケーション生成
  var app = GameApp({
    startLabel: 'main', // メインシーンから開始する
  });
  // アプリケーション実行
  app.run();
});
</script>
</body>
</html>
```
