function plotAllFields( data1, pname )
    if nargin < 2
        pname = 'top';
    end
    names1 = fieldnames(data1);
    for i1 = 1:length(names1)
        cur = data1.(names1{i1});
        ncur = numel(cur);

        if isstruct( cur ) && ncur == 1
            plotAllFields( cur, [pname,'.',names1{i1}] );
        elseif isstruct( cur) && ncur > 1;
            for i = 1:ncur
                plotAllFields( cur(i), [pname,'.',names1{i1},'(',num2str(i),')'] );
            end
        else
            h = plot( data1.(names1{i1}), '.-', 'Color', rand(3,1));
            set(h,'DisplayName',[pname,'.',names1{i1}], 'Visible','off');
        end
    end
end %plotAllFields