warning('off')
pkg load dataframe
pkg load symbolic
syms x

[A1,A2,A3,A4]=resultados(atan(x),2,10^-10,200);
[B1,B2,B3,B4]=resultados(sin(x)-x/2,2,10^-10,200);
[C1,C2,C3,C4]=resultados(10*x*exp(-x^2)-1,1,10^-10,200);
[D1,D2,D3,D4]=resultados(x^6-36*x^5+450*x^4-2400*x^3+5400*x^2-4320*x+720,15,15,10^-10);
[E1,E2,E3,E4]=resultados(x*log10(x)-1.2,2,10^-10,200);


C = {"f(x)", "x0", "  Root (a)", "NSM","NM","SM"; 
     "tan**-1(x)", 2, A1, A2, A3,A4 ; 
     "sin(x)-x/2", 2,  B1, B2, B3,B4 ;
     "10x(exp(-x)**2)-1", 1,  C1, C2, C3,C4 ;
     "(x**6)-36x**5 + 450x**4 - 2400x**3 +5400x**2 -4320x +720", 15,  D1, D2, D3,D4 ;   
     "xlog10(x)-1.2", 2, E1, E2, E3,E4  } 
dataframe (C)