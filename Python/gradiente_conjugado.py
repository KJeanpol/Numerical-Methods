# -*- coding: utf-8 -*-
"""
Created on Mon Jun  1 04:22:00 2020

@author: Jeanpol
"""


from sympy import *

import numpy as np

g = '(x - 2)**4 + (x - 2 * y)**2'

def gradiente_conjugado(f, vars, xk, tol, b):
    n = len(vars)
    xk = np.asarray(xk)
    gk = []
    gk = np.asarray(gk)
    dk = []
    dk = np.asarray(dk)
    ak = 1
    ite = 0
    while 1:
        xk_aux = xk.copy()
        ec = sympify(f)
        dp = []
        gk = []
        for v in range(0, n):
            elem = diff(f, vars[v])
            dp.append(elem)
            df = dp[v]
            for j in range(0 , n):
                df = df.subs(vars[j], xk[j])
            gk.append(df)
        gk = np.asarray(gk)
        dk = [i * -1 for i in gk]
        dk = np.asarray(dk)
        while 1:
            s2=ak * dk
            s1 = xk + s2
            for v in range(0, n):
                ec_1 = ec
                for j in range(0, n):
                    ec_1 = ec_1.subs(vars[j], s1[j])
            for v in range(0, n):
                ec_2 = ec
                for j in range(0, n):
                    ec_2 = ec_2.subs(vars[j], xk[j])
            s3 = gk * dk
            s4 = ak * s3
            s5 = 0.5 * s4
            if (ec_1 - ec_2) <= s5:
                break
            else:
                ak = ak / 2

        xk = xk + ak * dk
        gk_aux = gk.copy()
        dk_aux = dk.copy()
        gk = []
        for v in range(0, n):
            elem = diff(f, vars[v])
            dp.append(elem)
            df = dp[v]
            for j in range(0, n):
                df = df.subs(vars[j], xk[j])
            gk.append(df)
        print("gk+1:", gk)
        gk_aux = np.asarray(gk_aux, dtype='float')
        gk = np.asarray(gk, dtype='float')
        dk_aux = np.asarray(dk_aux, dtype='float')
        if b == 1:
            n1 = np.linalg.norm(gk, ord=2)
            n2 = np.linalg.norm(gk_aux, ord=2)
            bk = n1 ** 2 / n2 ** 2

        elif b == 2:
            n1 = np.linalg.norm(gk, ord=2)
            dn = -1 * (dk_aux @ gk)
            bk = n1 ** 2 / dn
        else:
            n1 = np.linalg.norm(gk, ord=2)
            dn = dk_aux @ (gk - gk_aux)
            bk = n1 ** 2 / dn
        dk = (-1 * gk) + (bk * dk_aux)
        xk = np.asarray(xk, dtype='float')
        xk_aux = np.asarray(xk_aux, dtype='float')
        cpar = xk - xk_aux
        normax =np.linalg.norm(cpar, ord=2)
        normag = np.linalg.norm(gk, ord=2)
        if (normax or normag) < tol:
            break    
        else:
            ite += 1
    return [xk, ite]
# Ejemplo de prueba del metodo de gradiente conjugado
print(gradiente_conjugado(g, ['x', 'y'], [0, 3], 10**-5, 1))