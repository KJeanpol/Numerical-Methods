# -*- coding: utf-8 -*-
"""
Created on Sun Jun 14 20:35:20 2020

@author: Jeanpol
"""

from sympy import *
import numpy as np

x = symbols('x')


def simpson(f, a,b):
    f = sympify(f)
    fd = diff(f, x,x,x,x)
    fdda=np.absolute(fd.subs(x, a))
    fddb=np.absolute(fd.subs(x, b))
    h=(b-a)/2
    x0=a
    x1=(a+b)/2
    x2=b
    integral= (h/3)*(f.subs(x, x0)+4*f.subs(x, x1)+f.subs(x, x2))
    if (fdda>fddb):
        error= ((h**5)/90)*fdda
    else:
        error= ((h**5)/90)*fddb
    
    return [round(float(integral),4),round(error,4)]
print(simpson("ln(x)",2,5))