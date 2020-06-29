# -*- coding: utf-8 -*-
"""
Created on Sun Jun 14 05:53:54 2020

@author: Jeanpol
"""



import numpy as np
import matplotlib.pyplot as plt

x = np.array([-2, 0, 1]) # x coordinates in space
y = np.array([0,1,-1]) # f(x)


def _poly_newton_coefficient(x, y):
    """
    x: list or np array contanining x data points
    y: list or np array contanining y data points
    """

    m = len(x)

    x = np.copy(x)
    a = np.copy(y)
    for k in range(1, m):
        a[k:m] = (a[k:m] - a[k - 1])/(x[k:m] - x[k - 1])

    return a

def newton_polynomial(x_data, y_data, x):
    """
    x_data: data points at x
    y_data: data points at y
    x: evaluation point(s)
    """
    a = _poly_newton_coefficient(x_data, y_data)
    n = len(x_data) - 1  # Degree of polynomial
    p = a[n]

    for k in range(1, n + 1):
        p = a[n - k] + (x - x_data[n - k])*p

    return p

print (newton_polynomial([-2, 0, 1],[0, 1, -1],x))

  