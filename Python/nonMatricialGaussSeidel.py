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
    xant=x
    while(error>tol):
        
        for i in range(0,n):
            suma=0;
            for j in range(0,n):
                
                suma=suma+A[i][j]*x[j]
            for j in range(0,n):
                suma=suma+A[i][j]*xant[j]      
            x[i-1]=(1/A[i][i])*(b[i]-suma)
        k=k+1
        err=np.array(x).transpose()-np.array(xant).transpose()
        print(err)
        error=np.linalg.norm(err)  
        xant=x;
    print(x)
    return [x,k]
    
nonMatricialGaussSeidel([[5, 1, 1], [1, 5, 1],[1, 1, 5]],[7, 7, 7],[0, 0, 0],0.0001)