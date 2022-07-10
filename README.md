# inequality-plot

**inequalityplot** Plot inequalities in 2-D space.

`inequalityplot(f,x,y,color,resolution)` plots the inequality `f(x,y)` in 
region `x(1) <= x <= x(2)` and `y(1) <= y <= y(2)` using specified color.
For multiple inequalities, use `&` in `f`. Default color is `[0.5,0.75,1]`. 
Default resolution is `400`.

*Example 1: A colored ellipse.*
``` [matlab]
  ellipse = @(x,y) x.^2/4+y.^2<=1;
  inequalityplot(ellipse,[-3,3],[-3,3])
```

*Example 2: A colored triangle.*
``` [matlab]
  triangle = @(x,y) x>0 & x<1 & y>0 & y<x;
  inequalityplot(triangle,[-1,2],[-1,2],'magenta')
```

*Example 3: Area under a Gaussian curve.*
``` [matlab]
  g = @(x) 1/sqrt(2*pi)*exp(-x.^2/2);
  inequalityplot(@(x,y) y<g(x) & y>0 & x>-2 & x<1,[-3,3],[0,0.5],'c')
  hold on; fplot(g,[-3,3],'LineWidth',1); hold off
```

Author: Ildeberto de los Santos Ruiz, idelossantos@ittg.edu.mx
