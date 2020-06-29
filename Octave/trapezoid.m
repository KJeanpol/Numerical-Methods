function [integral, error] = trapezoid(f,a, b)
  syms x
  df = diff(f,2);
  df=function_handle(df);
  dfa=abs(df(a));
  dfb=abs(df(b));
  f = function_handle(f);
  h = (b - a);
  integral = (h/2) * (f(a)+ f(b));
  if (dfa>dfb)
    error=((h**3)/12)*dfa
  else
    error=((h**3)/12)*dfb
  endif
endfunction
