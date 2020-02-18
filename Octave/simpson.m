function [integral, error] = simpson(a, b)
  h = (b - a)/2;
  integral = h * (myFunction(a) + 4*myFunction((a + b)/2) + myFunction(b)) / 3;
endfunction
