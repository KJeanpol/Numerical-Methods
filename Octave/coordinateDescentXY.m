function [xn, fxn] = coordinateDescentXY(f, xn, maxIter)
  % Argument error: the amount of arguments of the function does not match 
  %                 with cell length
  f = function_handle(f);
  n = length(xn);
  if  n != 2 || n != nargin(f) 
    disp("Argument error");
    return
  endif
  for k=1:maxIter
    % Gauss-Seidel
    fx = f(sym('x'), xn(2));
    fx = function_handle(fx);
    xn(1) = fminsearch(fx, 0);
    fy = f(xn(1), sym('y'));
    fy = function_handle(fy);
    xn(2) = fminsearch(fy, 0);
    fxn = f(xn(1), xn(2));
  endfor
  return
endfunction