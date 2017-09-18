% Powell's method using line-search
% Krishnan Suresh, me748
function [pMin,fMin,flag,output,x] = fminPowell(f,p0,opt)

if (nargin == 2), opt = optimset('fminunc'); end % default parameters
opt = optimset(opt,'display','off'); % suppress annoying messages

p0 = p0(:); % force into column vector
x = p0;
flag = 0;pass = 1;nFunEvals = 0;
N = length(p0); % dimension of the problem
pCurrent = p0;
D = eye(N,N); %% we need to keep track of the direction
maxFunEvals = 100*N;
opt.MaxFunEvals = 1e6;
npasses = 0;
while (1) % for each pass
    npasses = npasses +1;
    pStartOfPass = pCurrent;
    fStartOfPass = feval(f,pStartOfPass);
    nFunEvals = nFunEvals+1;
    
    for ls = 1:N % N line search for each pass
        d = D(:,ls); % the direction of the current pass
        [pNew,fNew,flag,funcCount] = lineSearch(f,pCurrent,d,opt); 
        x(:,end+1) = pNew; %#ok<AGROW>
        pCurrent = pNew;
    end
    
    pEndOfPass = pCurrent;
    fEndOfPass = feval(f,pEndOfPass);
    nFunEvals = nFunEvals+funcCount;
    pass = pass+1;
    if (norm(pEndOfPass -pStartOfPass)<opt.TolX) || (abs(fEndOfPass-fStartOfPass) < opt.TolFun) || (nFunEvals > maxFunEvals)
        break; % terminate
    end
    
    % update directions
    D(:,1:end-1) = D(:,2:end);
    D(:,end) = (pEndOfPass-pStartOfPass);
    
    % One line search along new direction
    [pCurrent,fNew,flag,funcCount] = lineSearch(f,pCurrent,D(:,end),opt);
    nFunEvals = nFunEvals+funcCount;
    
    if (rank(D) < N); D = eye(N,N); end %reset directions
end
pMin = pNew;
fMin = fNew; 
output.funcCount = nFunEvals;
output.D = D;
output.iterations = npasses;

%{
% fminunc for linesearch
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [pMin,fMin,flag,funcCount] = lineSearch(f,p,d,opt)
% disp('ls in powell');
% Line search of a N-dimensional function
d = d/norm(d); % ensure proper scaling
[alphaMin,fMin,flag,output] = fminunc(@(alpha)f1D(f,p,d,alpha),0,opt);
pMin = p+alphaMin*d;   
funcCount = output.funcCount;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [fValue] = f1D(f,p,d,alpha)
fValue = feval(f,p+alpha*d);% Evaluate f at p+alpha*d
%}

% {
% Suresh's lineSearchSwanns.m
function [pMin,fMin,flag,nFunEvals] = lineSearch(f,p,d,opt)
p = p(:);
d = d(:);
tolx = opt.TolX;
% carry out a line search of a N-dimensional function
% First find a range for alpha on the line of interest
d = d/norm(d); % ensure proper scaling
[alpha0,alpha1,nFunInterval] = intervalComputation(@(alpha)fLineEvaluate(f,p,d,alpha),0,tolx); 
% Use this range to find the local minimum 
[alphaMin,fMin,nFunGolden] = goldensection(@(alpha) fLineEvaluate(f,p,d,alpha),alpha0,alpha1,tolx);
pMin = p+alphaMin*d;  
flag= 1;
nFunEvals = nFunInterval + nFunGolden;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [a,b,nFunEvals] = intervalComputation(f,x0,tolx)
% Given an initial guess, find a coarse interval containing a local minimum
s = 10*tolx; % step size, 2 orders more than tol on x
nFunEvals = 0;
f1 = feval(f,x0);f2 = feval(f,x0+s);f3 = feval(f,x0-s);
if ((f1<f2) && (f1<f3)) % Check if we are at a local minimum
    a = x0-s; b = x0+s;
    return;
end
if (f2 > f3)%change the directions if necessary
   s=-s;
end
x1 = x0; x2 = x0+s; x3 = x0+2*s;
f2 = feval(f,x2);f3 = feval(f,x3);
nFunEvals = nFunEvals+2;
while (1)
    if (f2 < f1) && (f2 < f3)
        if (s < 0) 
            a = x3;
            b = x1;
        else 
            a = x1; 
            b = x3;
        end     
        break
    end
    if (nFunEvals > 1000)
        a=0;b=0;
        break;
    end
    x1 = x2;  x2=x3; x3 = x0 + (x2-x0)*2;
    f1 = f2; f2 = f3; f3 = feval(f,x3);
    nFunEvals = nFunEvals+1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [xMin,fMin,nFunEvals] = goldensection(f,a,b,tolx)
% Use goldensection method to find a local minimum in a given range 
alpha = (3-sqrt(5))/2;
x1 = a + alpha*(b-a);
x2 = a + (1-alpha)*(b-a);
f1 = feval(f,x1);
f2 = feval(f,x2);
nFunEvals = 0;
nFunEvals = nFunEvals+2;
while (1)
    if (((b-a) < tolx) || (nFunEvals >1000))  
        xMin = (a+b)/2; 
        fMin = feval(f,xMin);
        break;
    end
    if (f1 < f2)
        b = x2; x2 = x1; f2 = f1;
        x1 = a + alpha*(b-a);
        f1 = feval(f,x1);  
    else 
        a = x1;  x1 = x2;   f1 = f2;
        x2 = a + (1-alpha)*(b-a);
        f2 = feval(f,x2);
    end
    nFunEvals = nFunEvals+1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [fValue] = fLineEvaluate(f,p,d,alpha)
% Evaluate the function f at the point p+alpha*d
fValue = feval(f,p+alpha*d);
%}