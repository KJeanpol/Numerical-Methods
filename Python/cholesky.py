# -*- coding: utf-8 -*-
"""
Created on Sun May 31 22:34:51 2020

@author: Jeanpol
"""

import numpy as np
from math import sqrt
from pprint import pprint
 
def cholesky(A,B):
    """Performs a Cholesky decomposition of A, which must 
    be a symmetric and positive definite matrix. The function
    returns the lower variant triangular matrix, L."""
    n = len(A)

    # Create zero matrix for L
    L = [[0.0] * n for i in range(n)]

    # Perform the Cholesky decomposition
    for i in range(n):
        for k in range(i+1):
            tmp_sum = sum(L[i][j] * L[k][j] for j in range(k))
            
            if (i == k): # Diagonal elements
                # LaTeX: l_{kk} = \sqrt{ a_{kk} - \sum^{k-1}_{j=1} l^2_{kj}}
                L[i][k] = sqrt(A[i][i] - tmp_sum)
            else:
                # LaTeX: l_{ik} = \frac{1}{l_{kk}} \left( a_{ik} - \sum^{k-1}_{j=1} l_{ij} l_{kj} \right)
                L[i][k] = (1.0 / L[k][k] * (A[i][k] - tmp_sum))
    mul=L*np.transpose(L)
    X=np.linalg.inv(mul).dot( np.transpose(B))
    return X
 
#cholesky([[25, 15, -5, -10] ,[ 15, 10, 1, -7], [-5, 1, 21, 4], [-10, -7, 4, 18]],[-25, -19, -21, -5])
    