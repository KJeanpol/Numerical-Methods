# -*- coding: utf-8 -*-
"""
Created on Mon Jun 15 01:54:58 2020

@author: Jeanpol
"""




import symengine


 vars = symengine.symbols('x y') # Define x and y variables
 f = symengine.sympify(['y*x**2', '5*x + sin(y)']) # Define function
 J = symengine.zeros(len(f),len(vars)) # Initialise Jacobian matrix


 for i, fi in enumerate(f):
     for j, s in enumerate(vars):
         J[i,j] = symengine.diff(fi, s)

 print J
[2*x*y, x**2]
[5, cos(y)]

 print symengine.Matrix.det(J)
2*x*y*cos(y) - 5*x**2