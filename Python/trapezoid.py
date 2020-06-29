# -*- coding: utf-8 -*-
"""
Created on Sun Jun 14 20:08:12 2020

@author: Jeanpol
"""

from sympy import *
import numpy as np

x = symbols('x')


def trapezoid(f, a,b):
    f = sympify(f)
    fd = diff(f, x)
    fdd=diff(fd, x)
    fdda=np.absolute(fdd.subs(x, a))
    fddb=np.absolute(fdd.subs(x, b))
    h=b-a
    integral= (h/2)*(f.subs(x, a)+f.subs(x, b))
    if (fdda>fddb):
        error= ((h**3)/12)*fdda
    else:
        error= ((h**3)/12)*fddb
    
    return [round(float(integral),4),round(error,4)]
print(trapezoid("ln(x)",2,5))