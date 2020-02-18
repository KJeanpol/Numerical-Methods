function [X] = luDecomposition(A, B)
  [L, U] = lu(A);
  Y = forwardSubstitution(L, B);
  X = backSubstitution(U, Y);
endfunction
