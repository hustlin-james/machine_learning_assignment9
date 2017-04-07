function [Vectors] = find_eigen_vectors(A,M,Iterations)
    
    N = size(A,1);

    CellX = cell(N,M);
    UCell = cell(M,1);

    for n = 1:N
        CellX{n,1} = A(n,:);
    end

    for d = 1:M
        temp = [];

        for i = 1:N
           temp = [temp; CellX{i,d}];
        end

        S = temp;
        u = eigen_vector(S,Iterations);
        u = u/norm(u,2);
        UCell{d,1} = u;

        for n = 1:N
            c = CellX{n,d};
            CellX{n,d+1} = c - transpose(u*c*u);
        end
    end

    col = size(UCell,1);
    rows = size(UCell{1},1);
    X = zeros(col,rows);
    
    for i=1:size(X,1)
        u = UCell{i};
        for j=1:rows
            X(i,j)=u(j);
        end
    end
    
    Vectors = transpose(X);
    
end

