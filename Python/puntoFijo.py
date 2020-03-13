# -*- coding: utf-8 -*-
"""
Created on Fri Mar 13 12:11:20 2020

@author: Jeanpol
"""

from sympy import sympify as sy
from sympy import symbols as symb
import matplotlib.pyplot
        
def puntoFijo(funcion,funciong,x0,tol,maxIter):
    """Resuelve una ecuación no lineal mediante el método del Punto Fijo.
    Devuelve el valor de la raíz más aproximada según la tolerancia dada
    y el valor inicial especificado
    Parámetros:
    funcion -- Funcion dependiente de X, a cálcular su raíz
    funciong -- Es el parametro funcion, despejada
    x0      -- Valor inical dado a resolver
    tol     -- Tolerancia miníma aceptada para encontrar la raíz
   
    Probado con: puntofijo("(sin(x)-x)","(sin(x))",2,0.001)
    """  
    x,y,z = symb('x y z') #Define x,y,z como variables de una funcion
    func = sy(funcion) 
    gfunc = sy(funciong)
    x = x0;
    error = []
    iteraciones=[]
    for  iter in range(1, maxIter):
        x = gfunc.subs({"x": x});
        err = abs(func.subs({"x": x}));
        if (err <= tol):
            matplotlib.pyplot.plot(iteraciones, error)
            return [float(x),iter,float(err)]
        error.append(err)
        iteraciones.append(iter)
