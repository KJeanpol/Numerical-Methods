% NON FUNCTIONAL!!!!
##function [xn, fxn] = coordinateDescent(f, xn, maxIter)
##  % Argument error: the amount of arguments of the function does not match 
##  %                 with cell length
##  f = function_handle(f);
##  n = length(xn);
##  if  (n != 2 && n != 3) || n != nargin(f) 
##    disp("Argument error");
##    return
##  endif
##  if (n == 2)
##    vars = {sym('x') 1; 1 sym('y')};
##  else
##    vars = {sym('x') 1 1; 1 sym('y') 1; 1 1 sym('z')};
##  endif
##  args = num2cell(zeros(n));
##  for k=1:maxIter
##    % Gauss-Seidel
##    for j=1:n
##      for m=1:n
##        args{m} = vars{m}*xn{m};
##      endfor
##      feval = f(args{:});
##      feval = function_handle(feval);
##      xn(j) = fminsearch(feval, 0);
##    endfor
##    fxn = f(xn{:});
##  endfor
##endfunction
