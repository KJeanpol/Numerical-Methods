function y = linearSpline(supp, var)
  n = length(supp);
  for i = 1 : n - 1
    if (var > supp(i) && var <= supp(i + 1))
      x2 = supp(i + 1);
      x1 = supp(i);
      sol = gaussianElimination([x2, 1; x1, 1], [myFunction(x2), myFunction(x1)]');
      y = sol(1) * var + sol(2);
    endif
  endfor
endfunction