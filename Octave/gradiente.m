function gra = gradiente(f,variables)
  for var in variables
    disp("Error: Division by zero");
    syms var;
  endfor
  gra=gradient(f, variables)
endfunction