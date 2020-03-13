# -*- coding: utf-8 -*-
"""
Created on Fri Mar 13 11:20:00 2020

@author: Jeanpol
"""

from sympy import sympify as sy
from sympy import symbols as symb
import matplotlib.pyplot
def falsePosition(funcion,an,bn,tol,maxIter):
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

    fa=f.subs({"x": an})
    fb=f.subs({"x": bn})
    xLast=an
    xn=bn
    xNext=0
    fx=0
    error = []
    iteraciones=[]
    if (fa*fb > 0):
        return
    
    for iter in range(1, maxIter):
        
      div=f.subs({"x": xn})-f.subs({"x": xLast})
      
      if (div == 0):
        print("Error: Division by zero")
        return
    
      fx = f.subs({"x": xn})
      xNext = xn - (fx*(xn - xLast))/div
      err = abs(xNext - xn) / abs(xNext)
      if (fx == 0):
        a = xn
        b = xn
      elif (fb * fx < 0):
        an = xn
        fa = fx
      else:
        bn = xn
        fb = fx
      if (err <= tol):
          matplotlib.pyplot.plot(iteraciones, error)
          return [float(xn),iter,float(err)]
      xLast = xn
      xn = xNext
      error.append(err)
      iteraciones.append(iter)
