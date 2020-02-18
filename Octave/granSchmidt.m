function [Q, R] = granSchmidt(A)
  n = length(A);
  Q = zeros(n);
  R = zeros(n);
  u1 = A(:, 1);
  Q(:, 1) = u1 / norm(u1);
  for k = 2 : n
    uk = A(:, k) - granSchmidtSum(A, Q, k, n);
    Q(:, k) = uk / norm(uk);
  endfor
  R = Q' * A;
endfunction

function result = granSchmidtSum(A, Q, k, n)
  result = 0;
  for i = 1 : k - 1
    productSum = 0;
    for j = 1 : n
      productSum = productSum + A(:, k)(j) * Q(:, i)(j);
    endfor
    result = result + productSum * Q(:, i);
  endfor
endfunction 