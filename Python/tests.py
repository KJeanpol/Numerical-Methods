from bisection import *
from newton import *
from secant import *

print("-------- START ---------")

print("Bisection")
f = "x*sin(x)-1"
a = 0
b = 2
tol = 0.001
print(bisection(f, a, b, tol))

print("\nNewton-Raphson")
f = "exp(-x)-x"
x0 = 0
tol = 0.0001
maxIter = 20
print(newton(f, x0, tol, maxIter))

print("\nSecant")
f = "x^3-3*x+2"
x0 = -2.6
x1 = -2.4
tol = 0.0001
maxIter = 20
print(secant(f, x0, x1, tol, maxIter))

print("-------- END ----------")
