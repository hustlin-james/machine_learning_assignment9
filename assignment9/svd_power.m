function [] = svd_power(input_file,M,Iterations)

    A = dlmread(input_file);

    S = A*transpose(A);
    U = find_eigen_vectors(A*transpose(A),M,Iterations);
    V = find_eigen_vectors(transpose(A)*A,M,Iterations);

    fprintf('Matrix U: \n');
    for i = 1:size(U,1)
        fprintf('Row %d: ',i);
        for j = 1:size(U,2)
          fprintf('%8.4f',U(i,j));
        end
        fprintf('\n');
    end

    eigen_values_vector = [];
    for i = 1:M
        eigen_vector = U(1:end,i);
        eigen_val = transpose(eigen_vector)*S*eigen_vector;
        eigen_val = sqrt(eigen_val);
        eigen_values_vector = [eigen_values_vector eigen_val];
    end

    S_Diag = diag(eigen_values_vector);

    fprintf('Matrix S: \n');
    for i = 1:size(S_Diag,1)
        fprintf('Row %d: ',i);
        for j = 1:size(S_Diag,2)
          fprintf('%8.4f',S_Diag(i,j));
        end
        fprintf('\n');
    end

    fprintf('Matrix V: \n');
    for i = 1:size(V,1)
        fprintf('Row %d: ',i);
        for j = 1:size(V,2)
          fprintf('%8.4f',V(i,j));
        end
        fprintf('\n');
    end

    R = U*S_Diag*transpose(V);
    fprintf('Reconstruction (U*S*V.T): \n');
    for i = 1:size(R,1)
        fprintf('Row %d: ',i);
        for j = 1:size(R,2)
          fprintf('%8.4f',R(i,j));
        end
        fprintf('\n');
    end
end

