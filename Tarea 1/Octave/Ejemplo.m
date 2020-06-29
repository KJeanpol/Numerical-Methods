  warning('off', 'all');  
  pkg load symbolic;
  syms x1 x2 x3 x4 x5 x6 x7 x8 ;
 
[xk,error,iter]=p2_solucion_aplicacion('(1/2)*( ((x1)**4 - 16*(x1)**2 + 5*(x1)) + ((x2)**4 - 16*(x2)**2 + 5*(x2))  + ((x3)**4 - 16*(x3)**2 + 5*(x3)) + ((x4)**4 - 16*(x4)**2 + 5*(x4)) + ((x5)**4 - 16*(x5)**2 + 5*(x5)) + ((x6)**4 - 16*(x6)**2 + 5*(x6)))',[x1 x2 x3 x4 x5 x6],0.0001,3)
