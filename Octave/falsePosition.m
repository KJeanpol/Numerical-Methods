function [xn, err, iter, fx]=falsePosition(funcion,an,bn,tol,maxIter)
    f=inline(funcion);
    fa=f(an);
    fb=f(bn);
    xLast=an
    xn=bn;
    xNext=0;
    fx=0;
    k=1;
    if (fa*fb > 0)
        return
    endif
    figure
    hold on
    for iter=0:maxIter
      div=f(xn)-f(xLast);
      if div == 0;
        disp("Error: Division by zero");
        return
      endif
      fx = f(xn);
      xNext = xn - (fx*(xn - xLast))/div;
      err = abs(xNext - xn) / abs(xNext)
      if fx == 0
        a = xn;
        b = xn;
      elseif fb * fx < 0
        an = xn;
        fa = fx;
      else
        bn = xn;
        fb = fx;
      endif
      if err <= tol
      plot(iter, err, 'ro');
        return
      endif
      xLast = xn;
      xn = xNext;
      plot(iter, err, 'ro');
    endfor
endfunction