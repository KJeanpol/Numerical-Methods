function X = cholesky(A,b)
  n = length(A);
  L = zeros(n);
  for i=1:n
    for j=1:i
      if j==i
        sum = 0;
        for k=1:j-1
          sum = sum + L(j, k)^2;
        endfor
        L(j,j) = sqrt(A(j, j) - sum);
      else
        sum = 0;
        for k=1:j-1
          sum = sum + L(i, k)*L(j, k);
        endfor  
        L(i, j) = (1/L(j, j))*(A(i, j) - sum);
      endif
    endfor
  endfor

  X=inv(L*L')*b';
endfunction
#L=cholesky([25 15 -5 -10 ; 15 10 1 -7; -5 1 21 4; -10 -7 4 18],[-25 -19 -21 -5])
