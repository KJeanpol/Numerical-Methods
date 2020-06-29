warning('off')
function [xk,k,err] = newton_raphson_nl(f,vars,x0,tol,maxIter)
  n=length(vars);
  var=cell(1,row);
  for i=1:n
    var(1,i)=x(i);
  endfor
  index={''};
  flag=strcat(var,index);
  vars=sym(Temp);
  xk=x0';
  Jf=jacobian(f,vars);
  k=0;
  err=tol+1;
  iteraciones=[0];
  error=[err];
  while(k<maxIter&& err>tol)
    Jf_xk=subs(Jf, vars, xk);
    f_xk=(subs(f, vars, xk))';
    xk= xk-linsolve(double(Jf_xk), double(f_xk));
    k=k+1;
    f_xk=double(subs(f, vars, xk));
    err=double(norm(f_xk));
    iteraciones=[iteraciones k];
    error=[error err];
  endwhile
  plot(iteraciones,error,'b--o')
endfunction