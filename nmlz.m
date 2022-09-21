function y = nmlz(x)
y = x-min(x);
if max(y) == 0;
    y = zeros(size(x));
else
    y = y/max(y);
end
