function [integral, error] = jacobiNonMatricial(matrix,b,x0,iter)
  xk=x0
  n = length(b)
  for j=1:iter
    for k=1:n
    x1=(b(1)-matrix(1,2)*xk(2) - matrix(1,3)*xk(3)-matrix(1,4)*xk(4))/matrix(1,1)
    x2=(b(2)-matrix(2,1)*xk(1) - matrix(2,3)*xk(3)-matrix(2,4)*xk(4))/matrix(2,2)
    x3=(b(3)-matrix(3,1)*xk(1) - matrix(3,2)*xk(2)-matrix(3,4)*xk(4))/matrix(3,3)
    x4=(b(4)-matrix(4,1)*xk(1) - matrix(4,2)*xk(2)-matrix(4,3)*xk(3))/matrix(4,4)
    xk(1)
    xk()
  endfor
endfunction
