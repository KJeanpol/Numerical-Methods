
% Metodo de Descenso Coordinado para encontrar una solucion de una funcion
% :param func: string con la funcion que se debe evaluar
% :param vars: vector con las variables que se utilizan en la funcion
% :param xk: valor de x inicial con el cual aplicar el metodo
% :param tol: tolerancia al fallo de debe tener el resultado final
% :returns: xk vector calculado y numero de iteraciones
function [x_aprox, iter] = descenso_coordinado(func, vars, xk, tol)
% Se calcula cuantas variables se ingresaron en la funcion
  n = length(vars);
  % Se inicializa el contador de iteraciones
  ite = 0;
  while 1
  % Se realiza una copia del vector inicial en cada iteracion
  xk_aux = xk;
  % Se recorren la cantidad de variables ingresadas de la funcion
  v = 1;
  while v != n + 1
    ec_k = func;
    % Se aplica la regla de Gauss-Seidel para actualizar las variables
    j = 1;
    while j != n + 1
      if j != v;
        vars(j);
        xk(j);
        ec_k = subs(ec_k, vars(j), xk(j));
      endif
      j = j + 1
    endwhile
    % Se convierte la funcion para que encontrar el minimo
    fv = matlabFunction(ec_k);
    % Se calcula el minimo de la funcion
    min = fminsearch(fv, 0);
    xk(v) = min;
    v = v + 1;
  endwhile
  % Se restan el vector calculado y el vector inicial
    cond = xk - xk_aux;
    % Se calcula norma de la resta de vectores
    norma = norm(cond, 2);
    % Verificar la condicion de parada
    if norma < tol
      break
    % Si NO se cumple la condicion de parada
    else
    % Se suma una iteracion
      ite = ite + 1;
    endif
  endwhile
  % Si termina el ciclo se retorna el resultado final
  x_aprox = xk;
  iter = ite;
endfunction

%Carga del paquete simbolico
pkg load symbolic
% Variable que contiene la ecuacion de la funcion de prueba
syms x y
f = (x - 2)**2 + (y + 3)**2 + x * y

% Ejemplo de prueba del metodo de Descenso Coordinado
[x_aprox, iter] = descenso_coordinado('(x - 2)**2 + (y + 3)**2 + x * y', [x, y], [1, 1], 10**-5)
