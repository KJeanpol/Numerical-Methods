# -*- coding: utf-8 -*-
"""
Created on Sun May 31 04:00:40 2020

@author: Jeanpol
"""

import numpy as np


def gaussianElimination(A,B):
    n=len(A)
    A=np.array(A)
    B=np.array(B)
    X=(np.concatenate((A, B.T), axis=1)).astype(np.float)
    
    for i in range(0,n):
        pivot=X[i][i]
        pivotRow=X[i]
     #   print(pivot)
      #  print(pivotRow)
        M=np.zeros((1, n-i))
        m=M.size
        for k in range(1,m):
            M[k-1]=X[i+k][i] / pivot
        for k in range(1,m):
            X[i + k] = X[i + k] - pivotRow*M[k-1][k]
            
    X= backSubstitution(X[:,[0,n-1]],X[:,[n]])
    print(X)




def backSubstitution(A,B):
    n=len(B)
    X=np.zeros((n,1))
    X[n-1]=B[n-1]/A[n-1][n-1]
    for k in range(n-2,n-1):
        print(((A[k][k+1])*(X[k+1][k]))/(A[k][k]))
        div=A[k][k]
        if (div!=0):
             X[k][k]=int(((B[k][k])-((A[k][k+1])*(X[k+1][k])))/(A[k][k]))
            
        else:
            print("Error division por cero")
    return X

#gaussSeidel([[5,1,1],[1,5,1],[1,1,5]],[7,7,7],[0,0,0],0.0001,5)   
# gaussianElimination([[0.03, 58.9] ,[ 5.31, -6.10]], [[59.2],[47]])