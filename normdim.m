%Compute the p-norm of A over dimension dim
% B = normdim( A, dim, p )
function B = normdim( A, dim, p )
if nargin < 3; p = 2; end;

asz = size(A);
if numel(asz) > 2;
    error('Only 2D Matrices');
end

if dim == 1;
    B = zeros(asz(2),1);
    for it = 1:asz(2);
        B(it) = norm(A(:,it),p);
    end
else
    B = zeros(asz(1),1);
    for it = 1:asz(1);
        B(it) = norm(A(it,:),p);
    end
end

    

