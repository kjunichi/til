# contour plot

## How to set line width

```jl
function f(x,y)
    sin(x*x+y*y)
end
timg = [f(x,y) for x=linspace(-pi,pi,40),y=linspace(-pi,pi,40)];

axis("off")
contour(timg,7,linewidths=6.0)
```

