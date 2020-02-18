function [xn, fx] = fixedPoint(f, xn, iterMax)
  % Does not validate existence
  % Does not validate uniqueness
  f = function_handle(f);
  for i=0:iterMax
    fx = f(xn);
    xn = fx;
  endfor
endfunction
