%Ben Conrad -- Simple peak and valley finder based on first derivative -- 20160303
function [ipks, ivls] = findPeaks(y, truePlot)
dy = diff(y);

ipks = zeros(size(y));
ivls = ipks;
pkcnt = 0;
vlcnt = 0;
for i = 2:length(dy);
    %zero-crossings in dy are peaks/valleys
    if     dy(i-1) > 0 && dy(i) <= 0 %negative transition == peak
        pkcnt = pkcnt+1;
        ipks(pkcnt) = i;
    elseif dy(i-1) < 0 && dy(i) >= 0; %positive == valley
        vlcnt = vlcnt+1;
        ivls(vlcnt) = i;
    end
end
ipks = ipks(1:pkcnt); %remove unused 0s
ivls = ivls(1:vlcnt); 

if nargin > 1 && truePlot
    hold on;
    plot(ipks, y(ipks),'ro');
    plot(ivls, y(ivls),'rx');

    plot(y,'k-');
    h = plot(dy,'g-'); h.Visible = 'off';
end