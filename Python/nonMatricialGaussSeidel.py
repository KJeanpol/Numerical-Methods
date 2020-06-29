# -*- coding: utf-8 -*-
"""
Created on Sun Jun 28 22:52:20 2020

@author: Jeanpol
"""

import numpy as np

def nonMatricialGaussSeidel(A,b,x0,tol):
    error=tol+1
    x=x0
    n=len(A[0])
    k=0
    
    while(error>tol):
        xant=x
        for i in range(0,n):
            suma=0;
            for j in range(0,i-1):
                
                suma=suma+A[i][j]*x[j]  
            for j in range(0,i-1):
                
                suma=suma+A[i][j]*xant[j]  
            
            x[i]=(1/A[i][i])*(b[i]-suma)
        k=k+1
        pp=np.array(xant).transpose()-np.array(x).transpose()
        error=np.linalg.norm(pp)
    print(x)    
    return [x,k]

    
nonMatricialGaussSeidel([[5, 1, 1], [1, 5, 1],[1, 1, 5]],[7, 7, 7],[0, 0, 0],0.0001)