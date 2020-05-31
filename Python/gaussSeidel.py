# -*- coding: utf-8 -*-
"""
Created on Sun May 31 04:00:40 2020

@author: Jeanpol
"""

import numpy as np


def gaussSeidel(A,b,x,tol,maxIter):
    D=np.diag(A)
    D=np.diag(D)
    U=np.triu(A)
    L=np.tril(A)
    L=L-D
    U=U-D
    b=np.transpose(b)
    inverso=np.linalg.inv((L+D))
    k=0
    xk=x
    error=tol+1
    while(k<maxIter and error>tol):
        primero=np.matmul(-inverso,(U))
        xk= primero.dot(xk) + inverso.dot(b)
        k=k+1
        error=np.linalg.norm(xk)
    return [xk,error]


#gaussSeidel([[5,1,1],[1,5,1],[1,1,5]],[7,7,7],[0,0,0],0.0001,5)   
# gaussianElimination([0.03 58.9 ; 5.31 -6.10], [59.2;47])