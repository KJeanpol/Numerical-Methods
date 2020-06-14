# -*- coding: utf-8 -*-
"""
Created on Sun Jun 14 05:05:12 2020

@author: Jeanpol
"""
from sympy import *
import numpy as np
x = symbols('x')
def lagrange(x, y, var):
    
    n = len(x)
    result=0
    for k in range(1,n+1):
        product=1;
        for j in range (1,n+1):
            if (j!=k):
                product = product * (var - x[j-1])/(x[k-1] - x[j-1])
        result = result + product * y[k-1]
    pprint(expand(result), use_unicode=True)
    return

print(lagrange([-2, 0, 1], [0, 1, -1], x))