```gnuplot
f(x,n) = sum [m=1:n] 4.0/pi/(2*m-1)*sin((2*m-1)*x)
y(t,n) = f(t,n)
x(t,n) = f(t-pi/2.0,n)

set term gif animate size 640,300
set output "anim.gif"

set parametric # ダミー変数は t です
set xrange [-2:12]
set yrange [-2:2]
set trange [0:10]
set size ratio -1
set sample 1e3

# ここでは第 8 項まで足します
N = 8
do for [T=0:99] {
   set object 1 circle at 0,0 \
   size 4.0/pi fc rgb "gray" fs empty border
  do for [m=1:N-1] {
    # 動点に合わせて背景の円を描きます
    set object m+1 circle at x(2*pi*T/100.,m),y(2*pi*T/100.,m) \
      size 4.0/pi/(2*(m+1)-1) fc rgb "gray" fs empty border
  }
  # 横方向のラインを描きます
  set arrow 1 nohead from x(2*pi*T/100.,N),y(2*pi*T/100.,N) \
      to 2.0,y(2*pi*T/100.,N) lc rgb "coral" lw 2
  plot \
      for [n=1:N] \
        x(2*pi*T/100.,n),y(2*pi*T/100.,n) w p pt 7 ps .5 notitle, \
      t+2, y(2*pi*T/100.-t,N) w l lw 3 lc 1 notitle
}
unset output
```
