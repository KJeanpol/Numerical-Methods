# -*- coding: utf-8 -*-
"""
Created on Mon Jun 15 16:18:00 2020

@author: Jeanpol
"""

import numpy as np

def Thomas():
    xn=[]
    ci=0
    di=0
    qi=0
    bi=0
    A=createTridiagonal(100,1,5,1)
    d=createD(100)
    for i in range(0,100-1):
        if (i==0):
            ci=A[i+1][i]
            bi=A[i][i]
            di=d[i]
            pi=ci/bi
            qi=di/bi
            xn.append(qi)
        else:
            ai=A[i][i+1]
            bi=A[i][i]
            di=d[i]
            ci=A[i+1][i]
            pi=ci/(bi-pi*ai)
            qi=(di-qi*ai)/(bi-pi*ai)
            xn.append(qi-pi*xn[i-1])
            
    return xn

def createTridiagonal(N,a,b,c):
    matrix=np.zeros((N,N))
    np.fill_diagonal(matrix,b)
    n=N
    print(matrix[0][5])
    for i in range(0,n-1): 
        matrix[i][i+1]=c
        matrix[i+1][i]=a
    return matrix
    
def createD(N):
    n=N
    d=[]
    for i in range(0,n-1): 
        if((i==0) or (i==n-2)):
            d.append(-12)
        else:
             d.append(-14)
    return d
    
    
           
#lu([[4, -2, 1],[20, -7, 12],[ -8, 13, 17]],[11, 70, 17])