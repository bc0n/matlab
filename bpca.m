function U = bpca(X)

    m = 3; %length of each observation
    xyzm = mean(X,1);
    for i = m:-1:1; X0(:,i) = X(:,i)-xyzm(i); end;

    %first component
    [U,S,V] = svd(X0');
    u1 = 1/S(1,1)*X'*V(:,1);
    u1 = u1/norm(u1);
    
    %second
    Xd = X0'-S(1,1)*U(:,1)*V(:,1)'; %the deflated matrix
    [~,S,V] = svd(Xd);
    u2 = 1/S(1,1)*X'*V(:,1);
    u2 = u2/norm(u2);

    %third
    u3 = cross(u1,u2);

    U = [u1,u2,u3];

end