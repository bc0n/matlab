function [left,rght,maxd] = setComputer
clc; close all; format compact; format shortG; evalin('base','clear all;');

desktop = com.mathworks.mde.desk.MLDesktop.getInstance;
desktopMainFrame = desktop.getMainFrame;
mainWindowLocation = desktopMainFrame.getLocation;

hname = getenv('COMPUTERNAME');
wins = get(0,'MonitorPositions');
nwins = size(wins,1);

if strcmp(hname, 'BI7')
    if size(wins,1) == 2;
        if mainWindowLocation.getX < wins(1,1) % window is on left monitor, put figures on right
            left = wins(1,:); left(3) = wins(1,3)/2;
            rght = wins(1,:); rght(3) = wins(1,3)/2; rght(1) = rght(1) + wins(1,3)/2;
            maxd = wins(1,:);
        else

                left = wins(2,:); left(3) = wins(2,3)/2;
                rght = wins(2,:); rght(3) = wins(2,3)/2; rght(1) = rght(1) + wins(2,3)/2;
                maxd = wins(2,:);
        end
    else %single window
        left = [2     2   958   994];
        rght = [962     2   958   994];
        maxd = [1           1        1920        1003];
    end
elseif strcmp(hname, 'MYNOCK');
    %left monitor
    maxd = [   1   1 1920 1123];
    rght = [ 962   2  958 1114];
    left = [   2   2  958 1114];
end
assignin('base','maxd',maxd);
assignin('base','left',left);
assignin('base','rght',rght);

set(0,'DefaultFigurePosition',rght);
set(0,'DefaultAxesColor', .7*[1,1,1]);
set(0,'DefaultAxesXGrid','on','DefaultAxesYGrid','on','DefaultAxesZGrid','on');
set(0,'defaultAxesFontName', 'Arial')
%         figure('Name','left','position',left);
%         figure('name','right','position',rght);
