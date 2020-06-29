function [k] = NM(f, x0, iterMax, tol)
  syms x
  fd = diff(f);
  f = function_handle(f);
  fd = function_handle(fd);
  xk = x0;
  k=0;
  error=tol+1;
  while(k<=iterMax && error>tol)
    if (fd(xk)==0)
      k='Failure';
      break
    endif
    xk=xk- f(xk)/fd(xk)
    error= abs(f(xk))
    k=k+1;
  endwhile
endfunction