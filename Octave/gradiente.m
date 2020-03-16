function gradienteR=gradiente(funcion,variables)
  pkg load symbolic
  for n=1: length(variables)
    p=variables(n)
    syms p;
  endfor
  gradienteR = gradient(funcion, variables) 
endfunction
