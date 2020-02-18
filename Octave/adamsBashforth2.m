function yk = adamsBashforth2(a, b, y0, y1, N)
  h = (b - a)/(N - 1);
  xLast = a;
  yLast = y0;
  xk = a + h;
  yk = y1;
  for k = 1 : N - 1
    stem(xk, yk);
    str = sprintf('(%d,%d)', xk, yk);
    text(xk, yk, str, 'fontsize', 20);
    hold on
    yNext = yk + h * (3 * myFunction2(xk, yk) - myFunction2(xLast, yLast)) / 2;
    yLast = yk;
    xLast = xk;
    yk = yNext;
    xk = a + (k + 1) * h;
  endfor  
endfunction