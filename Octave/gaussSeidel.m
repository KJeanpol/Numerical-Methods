function [xk,error] = gaussSeidel(A,b,x,tol,maxIter)
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
        xk=(-inversa*U*xk)+inversa*b
        k=k+1;
        error=norm(xk);
    endwhile
  
endfunction

#[xk,error]=gaussSeidel([5 1 1 ; 1 5 1; 1 1 5],[7 7 7],[0 0 0],0.0001,5)