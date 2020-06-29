function [k] = SM(f,x0,tol,iterMax)
  syms x
  f = function_handle(f);
  k=1;
  error=tol+1;
  xn=x0;
  while(k<iterMax && error>tol)
    g= (f(xn + f(xn)) - f(xn))/f(xn);
    if (g==0)
      k='Failure';
      return  
    endif
    xn=xn- f(xn)/g;
    error= abs(f(xn));
    k=k+1;
  endwhile
endfunction




#[k]=SM(atan(x),2,0.00000000001,20)