function [xn, err, iter, fx] = falsePosition(f, an, bn, tol, maxIter)
  % False Position Method
  % Inputs:
  %   - f is a polinomial expression introduced as a symbolic expression
  %   - an and bn are [a_n, b_n]
  %   - tol is the tolerance
  %   - maxIter is the maximum amount of iterations
  % Outputs:
  %   - xn is the solution
  %   - err is the error
  %   - iter is the amount of completed iterations (-1 if IntervalError)
  %   - fx is f(x)
  % Errors:
  %   - IntervalError: the specified interval does not contain the zero
  %   - Division by zero
  f = function_handle(f);
  fa = f(an);
  fb = f(bn);
  xLast = an;
  xn = bn;
  xNext = 0;
  err = 0;
  iter = -1;
  fx = 0;
  if fa * fb > 0
    return
  endif
  for iter=0:maxIter
    div = f(xn) - f(xLast);
    if div == 0
      disp("Error: Division by zero");
      return
    endif
    fx = f(xn);
    xNext = xn - (fx*(xn - xLast))/div;
    err = abs(xNext - xn) / abs(xNext);
    if fx == 0
      a = xn;
      b = xn;
    elseif fb * fx < 0
      an = xn;
      fa = fx;
    else
      bn = xn;
      fb = fx;
    endif
    if err <= tol
      return
    endif
    xLast = xn;
    xn = xNext;
  endfor
endfunction