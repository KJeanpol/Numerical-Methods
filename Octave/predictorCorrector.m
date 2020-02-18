function yn = predictorCorrector(a, b, y0, N)
  yn = y0;
  xn = a;
  h = (b - a)/(N - 1);
  for n = 1: N - 1
    xNext = a + n * h;
    predictor = yn + h * myFunction2(xn, yn);
    yn = yn + h * (myFunction2(xn, yn) + myFunction2(xNext, predictor)) / 2;
    xn = xNext;
    stem(xn, yn, 'or')
    hold on
  endfor
  x = a:0.1:b
endfunction
