function [xk,error] = jacobi(A,b,x,tol,maxIter)
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
    suma=L+U;
    inversa=inv(D);
    while(k<maxIter && error>tol)
        xk=(-inversa*suma*xk)+inversa*b;
        k=k+1;
        error=norm(xk);
    endwhile
  
endfunction

[xk,error]=jacobi([5 1 1; 1 5 1; 1 1 5],[7 7 7],[0 0 0],0.0001,20)