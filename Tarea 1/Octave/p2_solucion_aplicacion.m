  warning('off', 'all');  
  pkg load symbolic;
  syms x1 x2 x3 x4 x5 x6 ;

function [xk,error,iter]=p2_solucion_aplicacion(f,variables,tolerancia,iterMax) 

 #   Esta función aplica el metodo BFGS para la optimizacion de funciones en varias
 #   variables.
    
 #   Sintaxis:  p2_bfgs(f,variables,tolerancia,iterMax)
    
 #   Parámetros Iniciales: 
 #               f = funcion continua, diferenciable, separable y escalable, a la cual se encontrara los valores optimos de sus variables
 #               variables = Es un vector con las variables utilizadas en f
 #               x1 = Es el error minimo aceptado para la resolucion del metodo
 #               tolerancia = un número positivo que representa a la tolerancia para el criterio |f(x_k)|<tol
 #               iterMax = cantidad de iteraciones máximas a realizar el metodo
                
 #   Parámetros de Salida: 
 #               [xk,error], donde                
 #               xk =    Vector con la aproximacion de las variables de la funcion f
 #               error = Margen de error de las aproximaciones dadas final
                
 #   Ejemplo:
 #   [xk,error,iter]=p2_solucion_aplicacion('(1/2)*( ((x1)**4 - 16*(x1)**2 + 5*(x1)) + ((x2)**4 - 16*(x2)**2 + 5*(x2))  + ((x3)**4 - 16*(x3)**2 + 5*(x3)) + ((x4)**4 - 16*(x4)**2 + 5*(x4)) + ((x5)**4 - 16*(x5)**2 + 5*(x5)) + ((x6)**4 - 16*(x6)**2 + 5*(x6)))',[x1 x2 x3 x4 x5 x6],0.0001,3)

 #              Donde el primer parametro es la ecuación Powell Sum Function [69] la cual
 #              es una funcion continua, diferenciable, separable y escalable    
 
  n=length(variables);
  f=sym(f);     %Convierte f (char) a symbolic
  x0 = [];
  i=1;
  
  %-----------------Se calcula los valores de xi, con -1<xi<1, para el vector x0-----------------
  
  while(i<=n)
    x0 =  [x0 randi(500)];
    i++;
  endwhile
  double(x0);
  x0=reshape(x0,n,1)  % Vector Inicial dado como matriz
  
  %-------------------Se definen constantes a utilizar en el metodo BFGS-------------------------
  xk=x0;
  lambdak=1;          % Valor de paso inicial
  sigma1=0.0025; 
  sigma2=0.005;
  B=eye(n,n) ;                 %Matriz Identidad
  Bk=B;
  %-------------------------Calculo de valores para iniciar el metodo-------------------------------
  
  g=gradient(f, variables);    %Gradiente de f
  gxk=subs(g, variables, xk);  %Gradiente evaluado en el vector inicial, es vector columna
  kiter=1; 
  figure                       %Se toma la iteracion 0, como parte de la grafica
  hold on
  error= double(norm(gxk)); 
  iter = 0;
  plot(iter, error, 'ro');
  title("BFGS Method");
  xlabel("Iterations");
  ylabel("Error");
  
  %----------------------------Comienza el metodo BFGS ----------------------------------------------
  
  while ((error>tolerancia)&&(iter<iterMax))
     gxk=subs(g, variables, xk);  %Gradiente evaluado en el vector inicial, es vector columna
     pk=inv(B)*-gxk;              % Es la direccion del metodo BFGS
     
     numero=sigma1*lambdak* double(transpose(gxk)*pk);
     primero=double(subs(f, variables, (xk+lambdak*pk)));
     segundo=double(subs(f, variables, xk)) + sigma1*lambdak* double(transpose(gxk)*pk);
     tercero= double(double(transpose(subs(g, variables, xk+lambdak*pk)))*pk);
     cuarto=double(double(transpose(subs(g, variables,xk)))*pk)*sigma2;
     
     %///// Wolfe-type inexact line search para determinar el valor de lambdak (valor de paso) ////// 
     while (!((primero <= segundo)&&(tercero >= cuarto)))
       lambdak=double(lambdak/(2**kiter));
       if (lambdak < 10^-5);    % Se evalua el valor de lambdak, pues al ser muy peqeueno, octave lo tomaria como 0
        break;
       endif
       primero=double(subs(f, variables, (xk+lambdak*pk)));
       segundo=double(subs(f, variables, xk)) + sigma1*lambdak* double(transpose(gxk)*pk);
       tercero= double(double(transpose(subs(g, variables, xk+lambdak*pk)))*pk);
       cuarto=double(double(transpose(subs(g, variables,xk)))*pk)*sigma2;
       kiter ++;
     endwhile
     %//// Termina el calculo de Wolfe-type /////////
     
     kiter=1;
     xk1=xk+lambdak*pk;       % Se actualiza el nuevo vector de x (valores optimos)
     sk=xk1-xk;
     yk=subs(g, variables, xk1)-subs(g, variables, xk);
     skt=transpose(sk);
     ykt=transpose(yk); 
     Bk=B- ((B*sk*skt*B)/(skt*B*sk)) +((yk*ykt)/(ykt*sk));  % Se actualiza la matriz Bk
     xk=xk1;
     error= double(norm(subs(g, variables, xk)));  %Gradiente evaluado en el vector inicial, es vector columna
     iter ++;   
     plot(iter, error, 'ro');
     title("BFGS Method");
     xlabel("Iterations");
     ylabel("Error");
  endwhile
     xk=double(xk);          % Da los valores del vector xk en formato Double                 
endfunction
