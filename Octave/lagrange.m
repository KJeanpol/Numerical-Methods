function result = lagrange(x, y, var)
  % Lagrange's Interpolation Method
	% Inputs:
	%   - x is a vector containing all of the X coordinates
  %   - y is a vector containing all of the Y coordinates
  %   - var is the value used to evaluate the result
  % Output:
	%   - result is the value obtained at evaluating var in the Lagrange's
  %   - interpolation polynomial
  %   example lagrange([-2 0 1], [0 1 -1], x)
  n = length(x);
  result = 0;
  for k = 1 : n
    product = 1;
    k
    for j = 1 : n
      j
      if j ~= k
        product = product * (var - x(j))/(x(k) - x(j));
      endif
    endfor
    result = result + product * y(k);
  endfor
  result=expand(result)
endfunction
