classdef xfrm
    methods (Static)
        % Rth = @(th)[cos(th),0,-sin(th); 0,1,0; sin(th),0,cos(th)]; %about x
        % Rps = @(ps)[cos(ps),sin(ps),0; -sin(ps),cos(ps),0; 0,1,0]; %about y
        % Rph = @(ph)[cos(ph),sin(ph),0; -sin(ph),cos(ph),0; 0,0,1]; %about z
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
        
        function H = Rtk(th, k)
            H = [ k(1)^2*(1-cos(th))+cos(th),         k(1)*k(2)*(1-cos(th))-k(3)*sin(th), k(1)*k(3)*(1-cos(th))+k(2)*sin(th), 0;... %the axis(k)&angle(th) tranformation matrix
                  k(1)*k(2)*(1-cos(th))+k(3)*sin(th), k(2)^2*(1-cos(th))+cos(th),         k(2)*k(3)*(1-cos(th))-k(1)*sin(th), 0;...
                  k(1)*k(3)*(1-cos(th))-k(2)*sin(th), k(2)*k(3)*(1-cos(th))+k(1)*sin(th), k(3)^2*(1-cos(th))+cos(th),         0; 0,0,0,1];
        end
        
        %2D
        function H = Rz2D(c)
            H = [cos(c),-sin(c),0,0; sin(c),cos(c),0,0; 0,0,0,1]; %about z
        end
        function H = Tx2D(a)
            H = [1,0,0,a; 0,1,0,0; 0,0,0,1]; %translation along x
        end
        function H = Ty2D(b)
            H = [1,0,0,0; 0,1,0,b; 0,0,0,1]; %along y
        end
    end
end