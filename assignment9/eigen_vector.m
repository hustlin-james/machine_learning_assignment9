function val = eigen_vector(A,n)
    x = ones(size(A,1),1);
    for j = 1:n
        y = A*x;
        [t r] = max(abs(y));
        mu = y(r);
        x = y/norm(y(r));
    end
    val = x;
end