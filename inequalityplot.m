function inequalityplot(f,x,y,color,resolution)
%INEQUALITYPLOT  Inequality plot in 2-D space.
%
%   INEQUALITYPLOT(f,x,y,color,resolution) plots the inequality f(x,y) in 
%   region x(1) <= x <= x(2) and y(1) <= y <= y(2) using specified color.
%   For multiple inequalities, use & in f. Default color is [0.5,0.75,1]. 
%   Default resolution is 400.
%
%   Example 1: A colored ellipse.
%  
%      ellipse = @(x,y) x.^2/4+y.^2<=1;
%      inequalityplot(ellipse,[-3,3],[-3,3])
%
%   Example 2: A colored triangle.
%
%      triangle = @(x,y) x>0 & x<1 & y>0 & y<x;
%      inequalityplot(triangle,[-1,2],[-1,2],'magenta')
%
%   Example 3: Area under a Gaussian curve.
%
%      g = @(x) 1/sqrt(2*pi)*exp(-x.^2/2);
%      inequalityplot(@(x,y) y<g(x) & y>0 & x>-2 & x<1,[-3,3],[0,0.5],'c')
%      hold on; fplot(g,[-3,3],'LineWidth',2); hold off
%
%   See also PLOT, FPLOT, AREA, PCOLOR, CONTOUR.
%
%   Author:
%      Ildeberto de los Santos Ruiz
%      idelossantos@ittg.edu.mx

if nargin < 4 || isempty(color)
    color = [0.5,0.75,1];
end
if isstr(color)
    switch color
        case {'r','red'}
            color = [1,0,0];
        case {'g','green'}
            color = [0,1,0];
        case {'b','blue'}
            color = [0,0,1];
        case {'c','cyan'}
            color = [0,1,1];
        case {'m','magenta'}
            color = [1,0,1];
        case {'y','yellow'}
            color = [1,1,0];
        case {'k','black'}
            color = [0,0,0];
        case {'w','white'}
            color = [1,1,1];
        otherwise
            color = [0.5,0.75,1];
    end
end
if nargin < 5
    resolution = 400;
end
    
bcolor = get(gca,'Color');
limx = x;
limy = y;
x = linspace(x(1),x(2),resolution);
y = linspace(y(1),y(2),resolution);
[x,y] = meshgrid(x,y);
z = double(f(x,y));
[r,c] = find(z == 1);
rlim = min(r):max(r);
clim = min(c):max(c);
pcolor(x(rlim,clim),y(rlim,clim),z(rlim,clim));
colormap([bcolor;color])
axis([limx,limy])
shading flat