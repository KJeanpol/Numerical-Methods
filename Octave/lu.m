function [L, U] = lu(X)
  n = length(X);
  L = eye(n);
  U = X;
  % For each row of matrix X
  for i=1:n
    pivot = U(i, i);
    pivotRow = U(i, :);
    % Multipliers' vector
    M = zeros(1, n - i);
    m = length(M);
    % Get each row multiplier
    for k=1:m
      M(k) = U(i + k, i) / pivot;
    endfor
    % Modify each row and each L subcolumn
    for k=1:m
      U(i + k, :) = U(i + k, :) - pivotRow*M(k);
      L(i + k, i) = M(k);
    endfor
  endfor
endfunction