# -*- coding: utf-8 -*-
"""
Created on Sun Jun 28 20:58:22 2020

@author: Jeanpol
"""

import numpy as np

def nonMatricialJacobi(A,b,x0,tol):
    error=tol+1
    x=x0
    n=len(A[0])
    k=0
    
    while(error>tol):
        for i in range(0,n):
            suma=0;
            for j in range(0,n):
                if (j!=i):
                    suma=suma+A[i][j]*x[j]  
            x[i]=(1/A[i][i])*(b[i]-suma)
        k=k+1
        p=np.array(np.array(A).dot((np.array(x).transpose())))
        pp=p-np.array(b).transpose()
        error=np.linalg.norm(pp)
    print(x)    
    return [x,k]

    
nonMatricialJacobi([[5, 1, 1], [1, 5, 1],[1, 1, 5]],[7, 7, 7],[0, 0, 0],0.0001)