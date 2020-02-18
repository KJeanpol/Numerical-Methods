function [xn, err, iter, fx] = secant(f, x0, x1, tol, maxIter)
  % Secant Method
	% Inputs:
	%   - f is a polinomial expression introduced as a symbolic expression
	%   - x0 is an initial value
  %   - x1 is an initial value
	%   - tol is the tolerance
	% 	- maxIter is the maximum amount of iterations
	% Outputs:
	%   - xn is the solution
	%   - err is the error
	%   - iter is the amount of completed iterations
	%   - fx is f(x)
  % Errors:
  %   - Division by zero
  f = function_handle(f);
  xLast = x0;
  xn = x1;
  for iter=1:maxIter
    div = f(xn) - f(xLast);
    if div == 0
      disp("Error: Division by zero");
      return
    endif
    fx = f(xn);
    xNext = xn - (fx*(xn - xLast))/div;
    err = abs(xNext - xn) / abs(xNext);
    if err <= tol
      return
    endif
    xLast = xn;
    xn = xNext;
  endfor
endfunction