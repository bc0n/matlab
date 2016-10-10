function setAllVisible(OFFon, fig)
disp(nargin)

if nargin < 2;
    fig = gcf;
end
get(fig,'name')

if nargin < 1;
    OFFon = 'off';
end

if ~(strcmp(OFFon,'off') || strcmp(OFFon,'on'));
    OFFon = 'off';
end

c = get(get(fig,'Children'),'Children');
for i = 1:length(c);
    set(c(i),'Visible',OFFon);
end;