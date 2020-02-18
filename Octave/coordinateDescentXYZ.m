function [xn, fxn] = coordinateDescentXYZ(f, xn, maxIter)
  % Argument error: the amount of arguments of the function does not match 
  %                 with cell length
  f = function_handle(f);
  n = length(xn);
  if  n != 3 || n != nargin(f) 
    disp("Argument error");
    return
  endif
  for k=1:maxIter
    % Gauss-Seidel
    fx = f(sym('x'), xn(2), xn(3));
    fx = function_handle(fx);
    xn(1) = fminsearch(fx, 0);
    fy = f(xn(1), sym('y'), xn(3));
    fy = function_handle(fy);
    xn(2) = fminsearch(fy, 0);
    fz = f(xn(1), xn(2), sym('z'));
    fz = function_handle(fz);
    xn(3) = fminsearch(fz, 0);
    fxn = f(xn(1), xn(2), xn(3));
  endfor
  return
endfunction