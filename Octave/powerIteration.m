function [xk, ck] = powerIteration(A, x0, iter)
  xk = x0;
  yk = A * xk;
  ck = abs(max(yk));
  xNext = 1 / ck * yk;
  % while (abs(xNext - xk) > tol)
  for i = 1 : iter
    yk = A * xk;
    ck = abs(max(yk));
    xNext = 1 / ck * yk;
    xk = xNext;
  endfor
  % endwhile
endfunction
