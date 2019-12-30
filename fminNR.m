% Minimize a function via Newton Raphson: simple implementation
% It is assumed that fun(x) returns function value, gradient, and hessian
% Krishnan Suresh, me748
function [xMin,fMin,flag,output] = fminNR(fun,x0)

xMin = x0;
iter = 0;
flag = 0;
output.message = 'Minimize a function via Newton-Raphson';
[fMin,g,h] = fun(xMin);
while(iter < 100) 
    if (cond(h) > 1e12)
        break;
    end
    xNew = xMin - h\g;
    err = norm(xMin-xNew);
    if (err < 1e-8)
        flag = 1;
        break;
    end
    xMin = xNew;
    [fMin,g,h] = fun(xMin);
    iter = iter + 1;
end