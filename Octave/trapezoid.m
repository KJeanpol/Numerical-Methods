function integral = trapezoid(a, b)
  h = b - a;
  integral = h * (myFunction(a) + myFunction(b)) / 2;
endfunction
