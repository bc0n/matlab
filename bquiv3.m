function h = bquiv3(xyz,vec,sty)
if nargin < 1
    h.scl = 10;
    h.lco = [0,1,1];
    h.lwd = 2;
    h.lst = '-';
    h.msz = 5;
    h.mst = '.';
else
    if nargin < 3
        sty.scl = 10;
        sty.lco = rand(3,1);
        sty.lwd = 1;
        sty.lst = '-';
    end
    vec = vec*sty.scl;

    [a,b] = size(xyz);
    if a == 3; n = b; else n = a; end;

    xyz = reshape(xyz, n, 3);
    vec = reshape(vec, n, 3);
    h = quiver3(xyz(:,1),xyz(:,2),xyz(:,3), vec(:,1),vec(:,2),vec(:,3), 0, 'color',sty.lco, 'linewidth',sty.lwd, 'linestyle',sty.lst );
end