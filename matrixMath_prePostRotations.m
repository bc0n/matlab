function matrixMath_prePostRotations
    clc; clear all; close all; format compact;

    % setup
    figure; hold on;
    plotTriad( eye(4), [0,0,0], 'd', 20, 10, 'o' );

    % initial
    a = eye(4);
    a(1:3,4) = [1;2;3];
    plotTriad( a, [1,1,1], 'o', 10, 3, 'a' );

    % rotated about grf
    plotTriad( Rx(pi/4)*a, [1,0,0], 's', 10, 3, '45Xgrf');
    plotTriad( Ry(pi/4)*a, [0,1,0], 's', 10, 3, '45Ygrf');
    plotTriad( Rz(pi/4)*a, [0,0,1], 's', 10, 3, '45Zgrf');

    % rotated about lrf(a)
    plotTriad( a*Rx(pi/4), [1,.5,.5], '*', 10, 1.5, '45Xlrf');
    plotTriad( a*Ry(pi/4), [.5,1,.5], '*', 10, 1.5, '45Ylrf');
    plotTriad( a*Rz(pi/4), [.5,.5,1], '*', 10, 1.5, '45Zlrf');
    
    axis equal;
    xlabel('x'); ylabel('y'); zlabel('z');
end

function plotTriad( H, mCol, mSty, mSze, scl, name )
    h = plot3( H(1,4),H(2,4),H(3,4), 'marker',mSty, 'color',mCol, 'markerfacecolor',mCol,'markerSize', mSze);
    set(h,'DisplayName',name);
    h = quiver3( H(1,4),H(2,4),H(3,4), H(1,1)*scl,H(2,1)*scl,H(3,1)*scl, 0, 'r-' );
    set(h,'DisplayName',name);
    h = quiver3( H(1,4),H(2,4),H(3,4), H(1,2)*scl,H(2,2)*scl,H(3,2)*scl, 0, 'g-' );
    set(h,'DisplayName',name);
    h = quiver3( H(1,4),H(2,4),H(3,4), H(1,3)*scl,H(2,3)*scl,H(3,3)*scl, 0, 'b-' );
    set(h,'DisplayName',name);
end

function H = Rx(a)
    H = [1,0,0,0; 0,cos(a),-sin(a),0; 0,sin(a),cos(a),0; 0,0,0,1]; %rotation about x
end
function H = Ry(b)
    H = [cos(b),0,sin(b),0; 0,1,0,0; -sin(b),0,cos(b),0; 0,0,0,1]; %about y
end
function H = Rz(c)
    H = [cos(c),-sin(c),0,0; sin(c),cos(c),0,0; 0,0,1,0; 0,0,0,1]; %about z
end
function H = Tx(a)
    H = [1,0,0,a; 0,1,0,0; 0,0,1,0; 0,0,0,1]; %translation along x
end
function H = Ty(b)
    H = [1,0,0,0; 0,1,0,b; 0,0,1,0; 0,0,0,1]; %along y
end
function H = Tz(c)
    H = [1,0,0,0; 0,1,0,0; 0,0,1,c; 0,0,0,1]; %along z
end