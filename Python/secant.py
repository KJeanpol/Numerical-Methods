from sympy import *

x = symbols('x')


def secant(expr, x0, x1, tol, maxIter):
    """ Secant Method

    Arguments:
        expr {string} -- is the polinomial expression
        x0 {float} -- is the initial value x_0
        x1 {float} -- is the initial value x_1
        tol {float} -- is the tolerance
        maxIter {int} -- is the max amount of iterations
    Returns:
        xn {float} -- is the solution
        err {float} -- is the error
        _iter {int} -- is the amount of iterations
        fx {float} -- is f(xn)

    """
    errReturn = [0, 0, 0, 0]
    try:
        f = sympify(expr)
        xLast = sympify(x0)
        xn = x1
        for _iter in range(1, maxIter):
            div = f.subs(x, xn) - f.subs(x, xLast)
            if (div == 0):
                print("Error: Division by zero")
                return errReturn
            fx = f.subs(x, xn)
            xNext = xn - (fx*(xn - xLast))/div
            err = abs(xNext - xn)/abs(xNext)
            if (err <= tol):
                break
            xLast = xn
            xn = xNext
        return [N(xn), N(err), _iter, N(fx)]
    except:
        print("There was an error.")
        return errReturn
