function [xn, err, iter, fx] = newton(f, x0, tol, maxIter)
  % Newton-Raphson Method
	% Inputs:
	%   - f is a polinomial expression introduced as a symbolic expression
	%   - x0 is the initial value
	%   - tol is the tolerance
	% 	- maxIter is the maximum amount of iterations
	% Outputs:
	%   - xn is the solution
	%   - err is the error
	%   - iter is the amount of completed iterations
	%   - fx is f(x)
  fd = diff(f);
  f = function_handle(f);
  fd = function_handle(fd);
  xNext = x0;
  figure
  hold on
  for iter=0:maxIter
    xn = xNext;
    fdx = fd(xn);
    if fdx == 0
      disp("Error: Division by zero");
      return
    endif
    fx = f(xn);
    xNext = xn - fx/fdx;
    err = abs(xNext - xn) / abs(xNext);
    if err <= tol
      break
    endif
    plot(iter, err, 'ro');
    title("Newton-Raphson Method");
    xlabel("Iterations")
    ylabel("Error")
  endfor
endfunction