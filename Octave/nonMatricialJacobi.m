function [x, k ,error]=nonMatricialJacobi(A,b,xo,tol)
    %Esta función aproxima una solucion al sistema de ecuaciones Ax=b
    %
    %Sintaxis: jacobism(A,b,xo,,tol)
    % 
    %Parámetros Iniciales: 
    %            A = Matriz de coeficientes
    %            b = vector terminos independientes
    %            xo=vector de valores iniciales
    %            tol=tolerancia
    %            
    %Parámetros de Salida:                           
    %            x=vector de incognitas

    error=tol+1;
    x=xo;
    n=size(x,1)
    %% 
    % * _*Tolerence for method*_
    k=0;
    %% Algorithm: Jacobi Method
    %%
    while error>tol
        xant=x;

        for i=1:n
            suma=0;

            for j=1:n

                if j~=i
                    suma=suma+A(i,j)*x(j);
                end

            end
            suma
            x(i)=(1/A(i,i))*(b(i)-suma)
        end

        k=k+1;
        error=norm((A*x)-b);
    end

endfunction

[xk,error]=nonMatricialJacobi([5 1 1; 1 5 1; 1 1 5],[7; 7; 7],[0; 0; 0],0.0001,20)