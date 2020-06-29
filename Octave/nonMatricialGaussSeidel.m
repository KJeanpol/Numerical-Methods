function [x k error]=nonMatricialGaussSeidel(A,b,xo,tol)
    x=xo
    n=size(x,1);
    error=tol+1; 

    k=0;

    while error>tol
        xant=x;

        for i=1:n

            suma=0;

            for j=1:i-1
                    suma=suma+A(i,j)*x(j);
            end

            for j=i+1:n
                    suma=suma+A(i,j)*xant(j);
            end

            x(i)=(1/A(i,i))*(b(i)-suma);
        end

        k=k+1;
        error=norm(xant-x);
    end
endfunction

[x k error]=gaseism([5 -2 3 0;-3 9 1 -2;2 -1 -7 1; 4 3 -5 7],[-1 ;2 ;3 ;0.5],[0;0;0;0],10^-10)