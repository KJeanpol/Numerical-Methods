# -*- coding: utf-8 -*-
"""
Created on Fri Mar 13 12:58:02 2020

@author: Jeanpol
"""

from sympy import sympify as sy
from sympy import symbols as symb
import matplotlib.pyplot
import math

def muller(funcion, x0, x1, x2, tol, maxIter):
    """Resuelve una ecuación no lineal mediante el método de la Falsa Posicion.
    Devuelve el valor de la raíz más aproximada según la tolerancia dada
    unos valores iniciales x0,x1
    Parámetros:
    funcion -- Funcion dependiente de X, a cálcular su raíz
    x0      -- Primer valor inicial
    x1      -- Segundo valor inicial
    tol     -- Tolerancia miníma aceptada para encontrar la raíz
   
    """     
    x,y,z = symb('x y z') #Define x,y,z como variables de una funcion
    f = sy(funcion) 
    error = []
    iteraciones=[]

    for iter in range(0, maxIter):
        div = float((x0-x2)*(x1-x2)*(x0-x1))
        if (div == 0):
          print(x2)
          print("Error: Division by zero")
          return
        a = float((x1-x2)*(f.subs({"x": x0})-f.subs({"x": x2}))-(x0-x2)*(f.subs({"x": x1})-f.subs({"x": x2})))/div
        b = float(pow((x0-x2),2)*(f.subs({"x": x1})-f.subs({"x": x2}))-pow((x1-x2),2)*(f.subs({"x": x0})-f.subs({"x": x2})))/div
    
        c = float(f.subs({"x": x2}))
        print("a: "+str(a))
        print("b: "+str(b))
        print("c: "+str(c))
        disc = float(pow(b,2)-(4*a*c))
        if (disc < 0):
            print("Error: No real solution")
            return
        div = b + b*(math.sqrt(abs(disc)))
        xn = x2 - ((2*c)/div)
        err = abs(f.subs({"x": xn}))
        print("Llegue")
        print(err)
        print(xn)
        if (err <= tol):
            
            return
        x0Dist = abs(xn - x0)
        x1Dist = abs(xn - x1)
        x2Dist = abs(xn - x2)

        if (x0Dist > x2Dist and x0Dist > x1Dist):
            x0 = (x2)
        elif (x1Dist > x2Dist and x1Dist > x0Dist):
            x1 = (x2)
        x2 = xn
        
        
