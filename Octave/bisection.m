function [xn, err, iter, fx] = bisection(f, a, b, tol)
  % Bisection Method
  % Inputs:
  %   - f is a polinomial expression introduced as a symbolic expression
  %   - a and b are [a, b]
  %   - tol is the tolerance
  % Outputs:
  %   - xn is the solution
  %   - err is the error
  %   - iter is the amount of completed iterations (-1 if IntervalError)
  %   - fx is f(x)
  % Errors:
  %   - IntervalError: the specified interval does not contain the zero
  f = function_handle(f);
  fa = f(a);
  fb = f(b);
  xn = 0;
  err = 0;
  iter = -1;
  fx = 0;
  if fa * fb > 0
    return
  endif
  maxIter = 1 + round((log(b - a) - log(tol))/ log(2));
  figure;
  hold on;
  for iter=0:maxIter
    xn = (a + b)/2;
    fx = f(xn);
    err = abs(b - a);
    if fx == 0
      a = xn;
      b = xn;
    elseif fb * fx > 0
      b = xn;
      fb = fx;
    else
      a = xn;
      fa = fx;
    endif
    if err <= tol
      break
    endif 
    plot(iter, err, 'ro');
    title("Bisection Method");
    xlabel("Error");
    ylabel("Iterations");
  endfor
endfunction