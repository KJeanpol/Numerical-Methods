function yn = eulerMethod(a, b, y0, N)
  yn = y0;
  xn = a;
  h = (b - a)/(N - 1);
  for n = 1: N - 1
    yn = yn + h * myFunction2(xn, yn);
    xn = a + n * h;
    stem(xn, yn, 'or')
    hold on
  endfor
endfunction
