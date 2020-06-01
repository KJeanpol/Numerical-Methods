function X = gaussianElimination(A, B)
  n = length(A);
  X = [A, B];
  % For each row of augmented matrix
  for i=1:n
    pivot = X(i, i);
    pivotRow = X(i, :);
    % Multipliers' vector
    M = zeros(1, n - i);
    m = length(M);
    % Get each row multiplier
    for k=1:m
      M(k) = X(i + k, i) / pivot;
    endfor
    % Modify each row
    for k=1:m
      X(i + k, :) = X(i + k, :) - pivotRow*M(k);
    endfor
  endfor
  X = backSubstitution(X(1:n, 1:n), X(:,n+1));
endfunction
##gaussSeidel([[5,1,1],[1,5,1],[1,1,5]],[7,7,7],[0,0,0],0.0001,5)