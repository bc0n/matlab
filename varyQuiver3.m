function varyQuiver3( xyz, uvec, color, scale, linewidth, style )
% varyQuiver3( xyz, uvec, colorVector, scale, linewidth, style )

inds = 1:length(xyz);
cind = linspace( .5, 1, inds(end) );

for i = inds
    if nargin == 6
        quiver3( xyz(i,1),xyz(i,2),xyz(i,3), uvec(i,1),uvec(i,2),uvec(i,3), scale, style,'LineWidth',linewidth, 'Color',color*cind(i) ); 
    elseif nargin == 5
        quiver3( xyz(i,1),xyz(i,2),xyz(i,3), uvec(i,1),uvec(i,2),uvec(i,3), scale, 'LineWidth',linewidth, 'Color',color*cind(i) ); 
    elseif nargin == 4
        quiver3( xyz(i,1),xyz(i,2),xyz(i,3), uvec(i,1),uvec(i,2),uvec(i,3), scale, 'Color',color*cind(i) ); 
    elseif nargin == 3
        quiver3( xyz(i,1),xyz(i,2),xyz(i,3), uvec(i,1),uvec(i,2),uvec(i,3), 'Color',color*cind(i) ); 
    else %nargin == 2
        quiver3( xyz(i,1),xyz(i,2),xyz(i,3), uvec(i,1),uvec(i,2),uvec(i,3) ); 
    end
end