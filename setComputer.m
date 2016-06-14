function [left,rght,maxd] = setComputer
clc; close all; format compact; evalin('base','clear all;');

desktop = com.mathworks.mde.desk.MLDesktop.getInstance;
desktopMainFrame = desktop.getMainFrame;
mainWindowLocation = desktopMainFrame.getLocation;

hname = getenv('COMPUTERNAME');
wins = get(0,'MonitorPositions');
nwins = size(wins,1);

if strcmp(hname, 'BI7')
    if mainWindowLocation.getX < wins(1,1) % window is on left monitor, put figures on right
        left = wins(1,:); left(3) = wins(1,3)/2;
        rght = wins(1,:); rght(3) = wins(1,3)/2; rght(1) = rght(1) + wins(1,3)/2;
        maxd = wins(1,:);
    else
        left = wins(2,:); left(3) = wins(2,3)/2;
        rght = wins(2,:); rght(3) = wins(2,3)/2; rght(1) = rght(1) + wins(2,3)/2;
        maxd = wins(2,:);
        
        
    end
elseif strcmp(hname, 'MYNOCK');
%     if mainWindowLocation.getX < wins(1,1) % window is on the left monitor, figures on right
%         left = wins(1,:); left(3) = wins(1,3)/2;
%         rght = wins(1,:); rght(3) = wins(1,3)/2; rght(1) = rght(1) + wins(1,3)/2;
%         maxd = wins(1,:);
%     end
    maxd = [1921, 1, 1920, 1004];
    rght = [2881, 1, 960, 1000];
    left = [1929, 9, 944, 988];
    
elseif strcmp(hname, 'ZINN-LAB-01');
    left = [-1271           9         624         932];
    rght = [-631     9   624   932];
    maxd = [-1279           1        1280         948];
    
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
