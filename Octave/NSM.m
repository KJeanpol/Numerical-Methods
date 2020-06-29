function [xk, iter] = NSM(f, x0, iterMax, tol)
  syms x;
  err= tol + 1;
  fx = function_handle(f);
  fd = diff(f);
  fdx = function_handle(fd);
  iter=0;
  xk=x0;
  while (iter<=iterMax && err>tol)
    xna=xk-fx(xk)/fdx(xk);
    C=(fx(xk)-fx(xna))*(fdx(xk));
    double(C);
     if (C==0)
      xk='Failure';
      iter=iter+1;
      break
    endif
     xn=xk-fx(xk)^2/C;
     err=abs(fx(xn));
     xk=xn;
     iter=iter+1;
  endwhile
endfunction