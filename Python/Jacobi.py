# -*- coding: utf-8 -*-
"""
Created on Sun May 31 00:23:56 2020

@author: Jeanpol
"""

import numpy as np


def jacobi(A,b,x,tol,maxIter):
    D=np.diag(A)
    D=np.diag(D)
    U=np.triu(A)
    L=np.tril(A)
    L=L-D
    U=U-D
    b=np.transpose(b)
    Dinv=np.linalg.inv(D)
    k=0
    xk=x
    error=tol+1
    while(k<maxIter and error>tol):
        primero=np.matmul(-Dinv,(L+U))
        xk= primero.dot(xk) + Dinv.dot(b)
        k=k+1
        error=np.linalg.norm(xk)
    return [xk,error]


#jacobi([[5,1,1],[1,5,1],[1,1,5]],[7,7,7],[0,0,0],0.0001,20)