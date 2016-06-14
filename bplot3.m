function h = bplot3(xyz,sty)
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
    if a == 3; n=b; xyz = xyz'; else n = a; end;

    xyz = reshape(xyz, n, 3);
    h = plot3(xyz(:,1),xyz(:,2),xyz(:,3), 'color',sty.lco, 'linewidth',sty.lwd, 'linestyle',sty.lst, 'marker',sty.mst, 'markersize',sty.msz, 'MarkerEdgeColor', sty.lco );
end