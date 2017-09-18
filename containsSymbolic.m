function result = containsSymbolic(m)
    result = '';
% m = [0,1;2,a;3,b];
    if sum(size(m))==2 %m is a single number
        result = symvar(m);
    else
        for i = 1:size(m,1);
            for j = 1:size(m,2);
                if ~isempty(symvar(m(i,j)))
                    %contains a symbolic
                    result = [result,symvar(m(i,j))];
                end
            end
        end
end