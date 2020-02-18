format long;
pkg load symbolic;
syms x y z;
warning('off', 'all');

% GENERAL SETTINGS
tol = 0.0000001;
maxIter = 20;
disp("=============== START =================");
disp("-------- ROOT CALCULATIONS ---------");

disp("Bisection");
f = x*sin(x)-1;
a = 0;
b = 2;
%[xn, err, iter, fx] = bisection(f, a, b, tol)

disp("\nNewton-Raphson");
f = e^(-x)-x;
x0 = 0;
%[xn, err, iter, fx] = newton(f, x0, tol, maxIter)

disp("\nSecant");
f = x^3-3*x+2;
x0 = -2.6;
x1 = -2.4;
%[xn, err, iter, fx] = secant(f, x0, x1, tol, maxIter)

disp("\nFalse Position");
f = x*sin(x)-1;
a = 0;
b = 2;
%[xn, err, iter, fx] = falsePosition(f, a, b, tol, maxIter)

disp("\nFixed Point");
f = sin(x);
x0 = 2;
iterMax = 5;
[xn, fx] = fixedPoint(f, x0, iterMax)

disp("\nMüller");
f = sin(x)-x/2;
x0 = 2;
x1 = 2.2;
x2 = 1.8;
%[xn, err, iter, fx] = muller(f, x0, x1, x2, tol, maxIter)

disp("\n---------- OPTIMIZATION -----------");
disp("Coordinate Descent XY");
maxIter = 9;
xn = [1 1];
f = (x - 2)^2 + (y + 3)^2 +x*y;
%[xn, fxn] = coordinateDescentXY(f, xn, maxIter)

disp("\nCoordinate Descent XYZ");
maxIter = 8;
xn = [1 1 1];
f = x^3+y^3+z^3-2*x*y-2*x*z-2*y*z;
%[xn, fxn] = coordinateDescentXYZ(f, xn, maxIter)

disp("\nNon Linear Conjugate Gradient");
maxIter = 13;
xn = [0 3]';
f = (x - 2)^4+(x-2*y)^2;
%[xn, gNorm] = nonLinearConjugateGradient(f, xn, maxIter)

disp("\n-------- EQUATION SYSTEMS ---------");

disp("Gaussian Elimination");
A = [1 2 1 4; 2 0 4 3; 4 2 2 1; -3 1 3 2];
B = [13 28 20 6]';
%X = gaussianElimination(A, B)

disp("\nLU Decomposition");
A = [4 -2 1; 20 -7 12; -8 13 17];
B = [11 70 17]';
%X = luDecomposition(A, B)

disp("\nCholesky Decomposition");
A = [25 15 -5 -10; 15 10 1 -7; -5 1 21 4; -10 -7 4 18];
B = [-25 -19 -21 -5]';
%X = choleskyDecomposition(A, B)

disp("=============== END =================");