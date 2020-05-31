function [xk,error] = gaussSeidel(A,b,x,tol,maxIter)
  % Bisection Method
  % Iuts:
  %   - f is a polinomial expression introduced as a symbolic expression
  %   - a and b are [a, b]
  %   - tol is the tolerance
  % Outputs:
  %   - xn is the solution
  %   - err is the error
  %   - iter is the amount of completed iterations (-1 if IntervalError)
  %   - fx is f(x)
  % Errors:
  %   - IntervalError: the specified interval does not contain the zero

    D=diag(diag(A));
    U=triu(A,1);
    L=tril(A,-1);
    b=b';
    k=0;
    xk=x';
    error=tol+1;
    suma=L+D;
    inversa=inv(suma);
    while(k<maxIter && error>tol)
        xk=(-inversa*U*xk)+inversa*b;
        k=k+1;
        error=norm(xk);
    endwhile
  
endfunction