clc; clear

pkg load dataframe
a=[1 2 3];
b=[1 2 3];
c=[1 2 3];
d=[1 2 3];
e=[1 2 3];
p=5
C = {"f(x)", "x0", "  Root (a)", "NSM","NM","SM"; 
     "tan**-1(x)", 2, 0.00000000, p, a(2),a(3) ; 
     "sin(x)-x/2", 2, 0.00000000, b(1), b(2),b(3) ; 
     "10x(exp(-x)**2)-1", 2, 0.00000000, c(1), c(2),c(3) ; 
     "(x**6)-36x**5 + 450x**4 - 2400x**3 +5400x**2 -4320x +720", 2, 0.00000000, d(1), d(2),d(3) ;  
     "xlog10(x)-1.2", 2, 0.00000000, e(1), e(2),e(3)} 
dataframe (C)