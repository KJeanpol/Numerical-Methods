# -*- coding: utf-8 -*-
"""
Created on Sun Mar 15 10:37:11 2020

@author: Jeanpol
"""


from sympy import sympify as sy
from sympy import symbols as symb
from sympy import *
def gradient(funcion,variables):
    f=""
    for var in variables:
        f=f+str(diff(funcion, symb(var)))+" + "
    print(f[:-3])
    
        