function [xk, gNorm] = nonLinearConjugateGradient(f, xk, maxIter)
  % sigma = rand;
  sigma = 0.5;
  gf = gradient(f);
  f = function_handle(f);
  gf = function_handle(gf);
  gk = gf(num2cell(xk){:});                 % It is already a transposed matrix
  dk = -gk;
  for iter=0:maxIter
    ak = 1;
    while !(f(num2cell(xk + ak*dk){:}) - f(num2cell(xk){:}) <= sigma*ak*gk'*dk)
      ak = ak/2;
    endwhile
    xNext = xk + ak*dk;
    gNext = gf(num2cell(xNext){:});         % It is already a transposed matrix
    bk = norm(gNext)^2/norm(gk)^2;
    dNext = -gNext + bk*dk;
    gNorm = norm(gk);
    xk = xNext;
    gk = gNext;
    dk = dNext;
  endfor
endfunction
