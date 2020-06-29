from sympy import *
from numpy import *
import numpy as np
import math
import matplotlib.pyplot as plt

'''
    Parametros:
        | ------
        | a:
        |    Valor a a evaluar
        | b:
        |    Valor b a evaluar
        | func:
        |   Función a evaluar
    Salidas:
        | --------
        |   bool :
        |       Booleano que indica si cumple el teorema de Bolzano
    '''
def isBolsano(a, b, func):
    
    f = lambda x: eval(func, {'x': x, 'pi': np.pi, 'e': np.e,
                              'exp': exp, 'sqrt': sqrt,
                              'arccos': acos, 'sin': sin, 'tan': tan, 
                              'ln': np.log,
                              'log10': np.log10})  
    
    fa = f(a)
    fb = f(b)
    
    print("------------")
    print(fa)
    print()
    print(fb)
    print("------------")

    return (fa * fb <= 0)

'''
    Parametros:
        | ------
        | f:
        |    Función de una variable a evaluar
        | a:
        |    Valor a del intervalo
        | b:
        |    Valor b del intervalo
        | tol:
        |   Tolerancia
    Salidas:
        | --------
        |   i :
        |       Número de iteraciones realizadas para llegar a la solución
        |   x :
        |       Valor al que converge la función
    '''
def biseccion(f, a, b, tol):
    
    #Inicializacion de la variable i que cuenta las iteraciones y x que es la aproximacion 
    
    i = 0
    x = 0
    
    if (isBolsano(a, b, f)):
        
        #Si cumple con el teorema el metodo continúa ejecutandose
        itArray = []
        errArray = []
        tempA = a
        tempB = b
        e = (b - a) / 2
        while (e >= tol):
            
            #Mientras no haya alcanzado el margen de error sigue dividiendo los intervalos que cumplan  con el teorema
            
            x = (tempA + tempB) / 2
            if(isBolsano(x, tempB, f)):
                tempA = x
            elif(isBolsano(tempA, x, f)):
                tempB = x
            i = i + 1
            e = (b - a) / (2**i)
            itArray.append(i)
            errArray.append(e)


    plt.plot(itArray,errArray)
    plt.ylabel('Errores')
    plt.xlabel('Iteraciones')

    plt.show()
        
    return i, x

#biseccion("((log10(7/x)/((1/10)*ln(10)))+(x*(6-x)/(((2*10**2*arccos(x/20)-x*sqrt(10**2-(x**2/4)))**2/(2*(40/ln(10))**2))*((1/(20**2*arccos(x/20)-x*sqrt(10**2-(x**2/4))))+(1/pi*10**2)))))", 0.1, 19, 10**(-10))
'''
    Parametros:
        | ------
        | function:
        |    Función de una variable a evaluar
        | x0:
        |    Valor x0 inicial
        | x1:
        |    Valor x1 inicial
        | tol:
        |   Tolerancia
    Salidas:
        | --------
        |   iterations :
        |       Número de iteraciones realizadas para llegar a la solución
        |   x1 :
        |       Valor al que converge la función
    '''
def secante(function, x0, x1, tol):

    f = lambda x: eval(function,  {'x': x, 'pi': np.pi, 'e': np.e,
                                                      'exp': exp, 'sqrt': sqrt,
                                      'arccos': acos, 'sin': sin, 'tan': tan, 
                                              'ln': np.log, 'log10': math.log10})

    #Número de iteraciones y arreglos de iteraciones inician en cero y vacios
    iterations = 0
    itArray = []
    errArray = []

    while(abs(f(x1)) >= tol):

        #Calcula la aproximacion y reacsigna los nuevos valores a x0 y x1
        x = x1 - f(x1)*((x1 - x0) / (f(x1) - f(x0)))
        x0 = x1
        x1 = x

        #Incrementa el número de iteraciones
        iterations += 1
        itArray.append(iterations)
        errArray.append(abs(f(x1)))

    #Grafica
    plt.plot(itArray,errArray)
    plt.ylabel('Errores')
    plt.xlabel('Iteraciones')

    plt.show()
    return [x1, iterations]
    
#secante("((log10(7/x)/((1/10)*ln(10)))+(x*(6-x)/(((2*10**2*arccos(x/20)-x*sqrt(10**2-(x**2/4)))**2/(2*(40/ln(10))**2))*((1/(20**2*arccos(x/20)-x*sqrt(10**2-(x**2/4))))+(1/pi*10**2)))))", 0.1, 19, 10**(-10))

'''
    Parametros:
        | ------
        | f:
        |    Función de una variable a evaluar
        | x0:
        |    Valor x0 inicial
        | x1:
        |    Valor x1 inicial
        | tol:
        |   Tolerancia
    Salidas:
        | --------
        |   iterations :
        |       Número de iteraciones realizadas para llegar a la solución
        |   xn :
        |       Valor al que converge la función
    '''
def falsaPosicion(function, x0, x1, tol):

    f = lambda x: eval(function,  {'x': x, 'pi': np.pi, 'e': np.e,
                                                      'exp': exp, 'sqrt': sqrt,
                                      'arccos': acos, 'sin': sin, 'tan': tan, 
                                              'ln': np.log, 'log10': math.log10})
    itArray = []
    errArray = []
    
    #Revisa si cumple el teorema de Bolzano
    if(f(x0)*f(x1) <= 0):

        iterations = 0
        xn = x1

        while(abs(f(xn)) >= tol):

            #Calcula la siguiente aproximacion
            xn = x1 - f(x1)*((x1 - x0) / (f(x1) - f(x0)))
            
            #Escoge el nuevo subintervalo para la siguiente aproximación
            if(f(x0)*f(xn)):
                x1 = xn
            else:
                x0 = xn

            #Incrementa el numero de iteraciones
            iterations += 1
            itArray.append(iterations)
            errArray.append(abs(f(xn)))

    #Grafica
    plt.plot(itArray,errArray)
    plt.ylabel('Errores')
    plt.xlabel('Iteraciones')

    plt.show()

    return [xn, iterations]

#falsaPosicion("((log10(7/x)/((1/10)*ln(10)))+(x*(6-x)/(((2*10**2*arccos(x/20)-x*sqrt(10**2-(x**2/4)))**2/(2*(40/ln(10))**2))*((1/(20**2*arccos(x/20)-x*sqrt(10**2-(x**2/4))))+(1/pi*10**2)))))", 0.1, 19, 10**(-10))

