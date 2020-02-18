function sum1 = qrError(A, n)
  sum1 = 0;
  for i = 2 : n
    sum2 = 0;
    for j = 1 : i - 1
      sum2 = sum2 + abs(A(i, j));
    endfor
    sum1 = sum1 + sum2;
  endfor
endfunction
