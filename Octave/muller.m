function [x2, err, iter, fx] = muller(f, x0, x1, x2, tol, maxIter)
  % Muller Method
	% Inputs:
	%   - f is a polinomial expression introduced as a symbolic expression
	%   - x0 is an initial value
  %   - x1 is an initial value
  %   - x2 is an initial value
	%   - tol is the tolerance
	% 	- maxIter is the maximum amount of iterations
	% Outputs:
	%   - x2 is the solution
	%   - err is the error
	%   - iter is the amount of completed iterations
	%   - fx is f(x)
  % Errors:
  %   - Division by zero
  %   - No real solution: no real solution found for ax**2+bx+c
  f = function_handle(f);
  for iter=1:maxIter
    div = (x0 - x1)*(x0 - x2)*(x1 - x2);
    if div == 0
      disp("Error: Division by zero");
      return
    endif
    a = ((x0 - x2)*(f(x1)-f(x2))-(x1-x2)*(f(x0)-f(x2)))/div;
    b = ((x0 - x2)^2*(f(x1)-f(x2))-(x1-x2)^2*(f(x0)-f(x2)))/div;
    c = f(x2);
    disc = b^2 - 4*a*c;
    if disc < 0
      disp("Error: No real solution");
      return
    endif
    div = b + sign(b)*sqrt(disc);
    xn = x2 - 2*c/div;
    fx = f(xn);
    err = abs(xn - x2)/abs(xn);
    if err <= tol
      return
    endif
    x0Dist = abs(xn - x0);
    x1Dist = abs(xn - x1);
    x2Dist = abs(xn - x2);
    if x0Dist > x2Dist && x0Dist > x1Dist
      x0 = x2;
    elseif x1Dist > x2Dist && x1Dist > x0Dist
      x1 = x2;
    endif
    x2 = xn;
  endfor
endfunction