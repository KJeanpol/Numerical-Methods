function X = backSubstitution(A, B)
  % Back Substitution Method
  % Solves AX=B
	% Inputs:
	%   - A is a NxN upper triangular matrix
  %   - B is a Nx1 matrix
	% Outputs:
	%   - X is the solution matrix
  n = length(B);
  X = zeros(n, 1);
  X(n) = B(n)/A(n, n);
  for k=n-1:-1:1
    div = A(k, k);
    if div != 0
      X(k) = (B(k) - A(k, k+1:n)*X(k+1:n))/A(k, k);
    else
      disp("Error: division by zero");
    endif
  endfor
endfunction