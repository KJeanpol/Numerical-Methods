function result = dividedDifference(x, y, start, finish)
  
  if start == finish
    result = y(start);
  elseif start - finish == 1
    result = (y(finish) - y(start))/(x(finish) - x(start));
  else
    result = (dividedDifference(x, y, start + 1, finish) - dividedDifference(x, y, start, finish - 1)) / (x(finish) - x(start));
  endif
  
endfunction