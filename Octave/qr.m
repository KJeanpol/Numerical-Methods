function Ak = qr(A, tol)
  n = length(A);
  Ak = A;
  while(qrError(Ak, n) > tol)
    [Qk, Rk] = granSchmidt(Ak);
    Ak = Rk * Qk;
  endwhile
endfunction