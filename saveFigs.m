function saveFigs(figs)

if nargin < 1;
    figs = get(0,'Children');
end

for i = 1:length(figs);
    name = sprintf('%s_%s', strrep(get(figs(i),'name'),' ','_'), datestr(now, 'yymmdd_HHMMSS'));

    figs(i).InvertHardcopy = 'off'; %don't change the background color
    figs(i).Color = [1,1,1]; %force to white
    saveas(figs(i),sprintf('%s.fig',name));    
    
    allaxes = findobj(figs(i),'type','axes');
    for ia = 1:length(allaxes);
        
        set(allaxes(ia),'xtickmode','manual');
        set(allaxes(ia),'xlimmode','manual');
        set(allaxes(ia),'xticklabelmode','manual');
        set(allaxes(ia),'ytickmode','manual');
        set(allaxes(ia),'ylimmode','manual');
        set(allaxes(ia),'yticklabelmode','manual');

        a = get(allaxes(ia),'XAxis');
        set(a,'MinorTickValuesMode','manual');
        a = get(allaxes(ia),'YAxis');
        set(a,'MinorTickValuesMode','manual');
    end
    
%     %getFrame() -- screen resolution only
%     rect = get(figs(i),'Position');
%     ec = 0; %[px] crop from the left and right edges by
%     rect = [ec 1 rect(3)-ec rect(4)];
%     f = getframe(figs(i),rect);
%     imwrite(f.cdata,sprintf('%s.png',name),'png');

    %print() -- doesn't axis background, moves titles
    figpos = getpixelposition(figs(i));
    resolution = get(0,'ScreenPixelsPerInch');
    set(figs(i),'paperunits','inches','papersize',figpos(3:4)/resolution,'paperposition',[0 0 figpos(3:4)/resolution]);
    print(figs(i),sprintf('%s_print.png',name),'-dpng','-r800','-opengl'); %-r800 specifies 800 dpi
%     print(figs(i),sprintf('%s_print.tiff',name),'-dtiff','-r800','-opengl');
%     print(figs(i),sprintf('%s_print.svg',name),'-dsvg','-r800','-opengl'); 
    
    close(figs(i));
end