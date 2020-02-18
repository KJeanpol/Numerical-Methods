function X = choleskyDecomposition(A, B)
  L = cholesky(A);
  Y = forwardSubstitution(L, B);
  X = backSubstitution(L', Y);
endfunction
