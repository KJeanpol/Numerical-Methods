function [xn, err, iter, fx]= secant(f,x0,x1,tol,maxIter)
  f1 = matlabFunction(sym(f));  % Se obtiene la funcion
  xLast = x0;
  xn = x1;
  figure
  hold on
  for iter=0:maxIter
   div = f1(xn) - f(xLast);
    if div == 0
      disp("Error: Division by zero");
      return
    endif
    fx = f1(xn);
    xNext = xn - (fx*(xn - xLast))/div;
    err = abs(xNext - xn) / abs(xNext);
    if err <= tol
      return
    endif
    xLast = xn;
    xn = xNext;
    plot(iter, err, 'ro');
  endfor
endfunction
[xn, err, iter]=secant('exp(x)-(1/x)',0,1,10^-4,50)