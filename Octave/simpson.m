function [integral, error] = simpson(f,a, b)
  syms x
  df = diff(f,4);
  df=function_handle(df);
  dfa=abs(df(a));
  dfb=abs(df(b));
  f = function_handle(f);
  x0=a;
  x1=(a+b)/2;
  x2=b;
  h = (b - a)/2;
  integral = (h/3) * (f(x0)+ 4*f(x1)+f(x2));
  if (dfa>dfb)
    error=((h**5)/90)*dfa;
  else
    error=((h**5)/90)*dfb;
  endif
endfunction
