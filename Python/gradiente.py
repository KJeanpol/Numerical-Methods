# -*- coding: utf-8 -*-
"""
Created on Sun Mar 15 10:37:11 2020

@author: Jeanpol
"""


from sympy import sympify as sy
from sympy import symbols as symb
from sympy import *


def gradient(A,b,x,error,maxIter):
    D=diagonal(A)
    U=np.triu(A)
    L=bnp.tril(A)
    print(D)
    print(U)
    print(L)
        