# Importacion del paquete numerico de Python
import numpy as np
#Importacion del paquete cientifico de Python
import scipy.linalg
"""
Metodo de Eliminacion Gaussiana para resolver sistemas de ecuaciones lineales
:param matrizA: matriz de tamano mxn
:param matrizB: vector de tamano m
:returns: lista con las solciones del sistema de ecuaciones lineales
"""
def eliminacion_gaussiana(matrizA, matrizB):
# Se convierte las matrices a array para el manejo de operaciones
    matrizA = np.asarray(matrizA)
    matrizB = np.asarray(matrizB)
    # Se genera la matriz aumenta de la matrizA con matrizB
    matrizAUG = np.insert(matrizA, matrizA.shape[1], matrizB, 1)
    # Se calcula la matriz triangular superior
    matrizI, matrizL, matrizU = scipy.linalg.lu(matrizAUG)
    # Sustitucion hacia atras para la matriz triangular superior
    x4 = matrizU[3][4] / matrizU[3][3]
    x3 = (matrizU[2][4] - matrizU[2][3] * x4) / matrizU[2][2]
    x2 = (matrizU[1][4] - matrizU[1][2] * x3 - matrizU[1][3] * x4) / matrizU[1][1]
    x1 = (matrizU[0][4] - matrizU[0][1] * x2 - matrizU[0][2] * x3 - matrizU[0][3] *
    x4) / matrizU[0][0]
    # Se retorna el vector solucion
    sol = [x1, x2, x3, x4]
    return sol
# Ejemplo de prueba para el metodo de eliminacion gaussiana
print(eliminacion_gaussiana([[0.03, 58.9] ,[ 5.31, -6.10]], [[59.2],[47]]))