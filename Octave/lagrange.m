function result = lagrange(x, y, var)
  % Lagrange's Interpolation Method
	% Inputs:
	%   - x is a vector containing all of the X coordinates
  %   - y is a vector containing all of the Y coordinates
  %   - var is the value used to evaluate the result
  % Output:
	%   - result is the value obtained at evaluating var in the Lagrange's
  %   - interpolation polynomial
  n = length(x);
  result = 0;
  for k = 1 : n
    product = 1;
    for j = 1 : n
      if j ~= k
        product = product * (var - x(j))/(x(k) - x(j));
      endif
    endfor
    result = result + product * y(k);
  endfor
endfunction
