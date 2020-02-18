function yn = rungeKutta2(a, b, y0, N)
  h = (b - a)/(N - 1);
  xn = a;
  yn = y0;
  for n = 1 : N - 1
    k1 = myFunction2(xn, yn);
    k2 = myFunction2(xn + h/2, yn + h * k1 / 2);
    yn = yn + h * k2;
    xn = a + h * n;
    stem(xn, yn);
    str_to_display = sprintf('(%d,%d)', xn,yn);
    text(xn, yn, str_to_display, 'fontsize', 20);
    hold on;
  endfor
endfunction
