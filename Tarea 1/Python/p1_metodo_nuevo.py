from sympy import *
import numpy as np
import matplotlib.pyplot as plt
import math

'''
    Parametros:
        | ------
        | func:
        |    Funcion de una variable
        | xo:
        |    Valor para iniciar la aproximacion
        | tol:
        |   Tolerancia
    Salidas:
        | --------
        |   xAprox:
        |       Aproximacion hacia donde converge la funcion
        |   itera:
        |       Numero de iteraciones realizadas
    '''
def ssm(func,xo,tol):

    
    f = lambda x: eval(func, {'x': x, 'pi': np.pi, 'e': np.e,
                                  'exp': exp, 'sqrt': sqrt,
                                  'arccos': acos, 'sin': sin, 'tan': tan, 
                                  'ln': np.log, 'log10': math.log10})

     #Las iteraciones inician en cero y los arreglos de iteraciones en vacio   
    xC = xo
    itera = 0
    error = [ ]
    iteracion = [ ]
    tempTol = 1

    #Condicion de parada
    while(tempTol >= tol):

        itera += 1

        fx = f(xC)
        z = f(xC +fx)
            
        y = xC - ((fx**2)/(z-fx))
        fy = f(y)

        #Calculo de la nueva aproximacion
        xAprox = xC - (fx**3)/((z-fx)*(fx-fy))
        tempTol = abs(xAprox-xC)
        xC = xAprox

        #Concatenacion de iteraciones
        error.append(tempTol)
        iteracion.append(itera)

    #Grafica
    plt.plot(iteracion,error)
    plt.ylabel('Errores')
    plt.xlabel('Iteraciones')
    plt.show()

    return xAprox, itera


ssm("((log10(7/x)/((1/10)*ln(10)))+(x*(6-x)/(((2*10**2*arccos(x/20)-x*sqrt(10**2-(x**2/4)))**2/(2*(40/ln(10))**2))*((1/(20**2*arccos(x/20)-x*sqrt(10**2-(x**2/4))))+(1/pi*10**2)))))",1, 10**(-10))
