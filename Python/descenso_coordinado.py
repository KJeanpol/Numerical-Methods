# -*- coding: utf-8 -*-
"""
Created on Mon Jun  1 04:07:40 2020

@author: Jeanpol
"""


from sympy import *

from scipy import optimize

import numpy as np

def descenso_coordinado(f, vars, xk, tol):

    n = len(vars)

    ite = 0
    while 1:
        xk_aux = xk.copy()
        ec = sympify(f)
        for v in range(0, n):
            ec_k = ec
            for j in range(0, n):
                if j != v:
                    ec_k = ec_k.subs(vars[j], xk[j])
    
            func = lambdify(vars[v], ec_k)
            resultado = optimize.minimize_scalar(func)
            xk[v] = resultado.x
        cond = []
        for i in range(0, n):
     
            elem = xk[i] - xk_aux[i]
            cond.append(elem)
        array = np.asarray(cond)
        norma = np.linalg.norm(array, ord=2)
        if norma < tol:
            break
        else:
            ite += 1
    return [xk, ite] 
print(descenso_coordinado('(x - 2)**2 + (y + 3)**2 + x * y', ['x', 'y'], [1, 1], 10**-5))