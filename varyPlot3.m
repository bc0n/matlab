%h[] = varyPlot3( xyz, sty )
function h = varyPlot3( xyz, sty, cols )

if nargin < 1
    h.scl = 10;
    h.lco = [0,1,1];
    h.lwd = 2;
    h.lst = '-';
    h.msz = 5;
    h.mst = '.';
else
    if nargin < 2
        sty.lco = rand(3,1);
        sty.lwd = 1;
        sty.lst = '-';
        sty.mst = '.';
        sty.msz = 5;
    end
    
    [a,b] = size(xyz);
    if a == 3 && b ~= 3;
        n=b;
        xyz = xyz';
    elseif b == 3;
        n = a;
    else %a == b == 3, xyz shape indeterminate
        n = 3;
    end
    
    if nargin == 3;
        for i = 1:n
            h(i) = plot3( xyz(i,1),xyz(i,2),xyz(i,3), 'color', cols(i,:), 'linewidth',sty.lwd, 'linestyle',sty.lst, 'marker',sty.mst, 'markersize',sty.msz, 'MarkerEdgeColor', cols(i,:) );
        end
    else
        cind = linspace( .5, 1, n);
        for i = 1:n
            h(i) = plot3( xyz(i,1),xyz(i,2),xyz(i,3), 'color', sty.lco*cind(i), 'linewidth',sty.lwd, 'linestyle',sty.lst, 'marker',sty.mst, 'markersize',sty.msz, 'MarkerEdgeColor', sty.lco*cind(i) );
        end
    end
end