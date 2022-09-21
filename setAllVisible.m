function setAllVisible(OFFon, fig)

if nargin < 2;
    fig = gcf;
end

if nargin < 1;
    OFFon = 'off';
end

if ~(strcmp(OFFon,'off') || strcmp(OFFon,'on'));
    OFFon = 'off';
end

axs = fig.Children;
for iax = 1:length(axs);
    lines = axs(iax).Children;
    for iline = 1:length(lines);
        set(lines(iline),'Visible',OFFon);
    end
end