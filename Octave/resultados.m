function [alpha,k1,k2,k3] = resultados(f,x0,tol,iterMax)
  [alpha,k1]=NSM(f,x0,iterMax,tol);
  k2=NM(f,x0,tol,iterMax);
  k3=SM(f,x0,tol,iterMax);
endfunction
