function [tf, strComp] = compareMs(A,B,tol)
% [tf, strComp] = compareMs(A,B,tol)
%improvements:
%   for symbolic, non-syms should be evaluated


    %if tolerance is not specified, don't round
    if nargin == 3 %&& isempty(symvar(A)) && isempty(symvar(B));
        A = round(A*tol)/tol;
        B = round(B*tol)/tol;
    end

    tf =  A == B;
    sep = repmat('  |  ', size(A,1),1); %make a vector of separator characters
    
    %check if A or B contain a symbolic
    if isempty(containsSymbolic(A));
        strA = num2str(A);
    else
        strA = symMatrix2Str(A); %rather ugly, but works
    end
    if isempty(containsSymbolic(B))
        strB = num2str(B);
    else
        strB = symMatrix2Str(B);
    end
    strComp = [strA, sep ,strB];
    
    if nargout == 0
    %     disp(num2str(tf));
        if sum(sum(tf))<size(A,1)*size(A,2)
            disp([num2str(tf), sep, strComp]); %print true/false matrix, seperator, comparison
        else
            disp('1');
        end
    end
   
    
    
end
