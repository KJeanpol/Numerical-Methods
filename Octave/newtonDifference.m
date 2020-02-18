function result = newtonDifference(x, y, var)
  % Newton's Difference Interpolation Method
	% Inputs:
	%   - x is a vector containing all of the X coordinates
  %   - y is a vector containing all of the Y coordinates
  %   - var is the value used to evaluate the result
  % Output:
	%   - result is the value obtained at evaluating var in the Newton's
  %   - Difference interpolation polynomial
  n = length(x);
  result = 0;
  
  for k = 1 : n
    product = 1;
    for j = 1 : k - 1
      if (k == 1)
        product = 1;
      else
        product = product * (var - x(j));
      endif
    endfor
    result = result + product * dividedDifference(x, y, 1, k);
  endfor
endfunction
