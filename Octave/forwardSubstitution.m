function X = forwardSubstitution(A, B)
  % Forward Substitution Method
  % Solves AX=B
	% Inputs:
	%   - A is a NxN lower triangular matrix
  %   - B is a Nx1 matrix
	% Outputs:
	%   - X is the solution matrix
  n = length(B);
  X = zeros(n, 1);
  X(1) = B(1)/A(1, 1);
  for k=2:n
    div = A(k, k);
    if div != 0
      X(k) = (B(k) - A(k, 1:k-1)*X(1:k-1))/A(k, k);
    else
      disp("Error: division by zero");
    endif
  endfor
endfunction