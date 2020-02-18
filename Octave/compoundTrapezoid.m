function integral = compoundTrapezoid(a, b, m)
  h = (b - a)/(m - 1);
  integral = 0;
  xn = a;
  for i = 0: m - 2
    xNext = a + h * (i + 1);
    integral = integral + h * (myFunction(xn) + myFunction(xNext)) / 2;
    xn = xNext;
  endfor
endfunction
