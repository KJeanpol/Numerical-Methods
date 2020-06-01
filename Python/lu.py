# -*- coding: utf-8 -*-
"""
Created on Sun May 31 18:58:50 2020

@author: Jeanpol
"""

import numpy as np


def lu(X,B):
    n=len(X)
    L=np.eye(n)
    U=X
    
    for i in range(1,n):

        pivot =U[i-1][i-1]
        pivotRow=U[i-1]
        M=np.zeros((1, n-i))
        m=M.size+1
        for k in range(1,m):
            try:
                M[i-1][k-1]=(U[i + k -1][i-1] )/pivot
            except:
                M=(U[i + k -1][i-1] )/pivot
        for k in range(1,m):
            try:
                U[i+k-1]=U[i+k-1] - (np.multiply(pivotRow,M[i-1][k-1]))
                L[i+k-1][i-1]=M[i-1][k-1]
            except:
                U[i+k-1]=U[i+k-1] - (np.multiply(pivotRow,M))
                L[i+k-1][i-1]=M
                
    Y=((np.linalg.inv(L)).dot(np.transpose(B)))
    Xk=(np.linalg.inv(U)).dot( Y)

    return Xk

            
           
#lu([[4, -2, 1],[20, -7, 12],[ -8, 13, 17]],[11, 70, 17])