function yn = rungeKutta3(a, b, y0, N)
  h = (b - a)/(N - 1);
  xn = a;
  yn = y0;
  for n = 1 : N - 1
    k1 = myFunction2(xn, yn);
    k2 = myFunction2(xn + h/2, yn + h * k1 / 2);
    k3 = myFunction2(xn + h, yn + h * (2 * k2 - k1));
    yn = yn + h / 6 * (k1 + 4 * k2 + k3);
    xn = a + h * n;
    stem(xn, yn);
    str_to_display = sprintf('(%d,%d)', xn,yn);
    text(xn, yn, str_to_display, 'fontsize', 20);
    hold on;
  endfor
endfunction
