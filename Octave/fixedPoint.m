#{
    Resuelve una ecuación no lineal mediante el método del Punto Fijo.

    Devuelve el valor de la raíz más aproximada según la tolerancia dada
    y el valor inicial especificado

    Parámetros:
    funcion -- Funcion dependiente de X, a cálcular su raíz
    funciong -- Es el parametro funcion, despejada
    x0      -- Valor inical dado a resolver
    tol     -- Tolerancia miníma aceptada para encontrar la raíz
   
    Probado con: puntoFijo("(sin(x)-x)","(sin(x))",2,0.001)
#}

function [x, err, iter] = fixedPoint(f,g,x0,tol,maxIter)
  aprox = 0;
  func = inline(f);
  gfunc = inline(g);
  pkg load symbolic;
  syms x;
  dg = diff(g, x);
  x = x0;
  if(abs(eval(dg))<1)
    figure
    hold on
    for iter=1:maxIter
      x = gfunc(x);
      err = abs(func(x));
      if err <= tol
        plot(iter, err, 'ro');
        return
      endif
      plot(iter, err, 'ro');
    endfor
  else
    display('"El metodo no converge con la funcion g(x) dada"');
  endif
endfunction