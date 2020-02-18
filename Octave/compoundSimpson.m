function integral = compoundSimpson(a, b, m)
  h = (b - a)/(m - 1);
  integral = h / 3 * (myFunction(a) + myFunction(b));
  factor = 1;
  for i = 1: m - 2
    xn = a + h * i;
    integral = integral + h * (2 * (1 + factor) * myFunction(xn)) / 3;
    factor = ~factor;
  endfor
endfunction
