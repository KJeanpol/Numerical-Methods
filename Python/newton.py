from sympy import *

x = symbols('x')


def newton(expr, x0, tol, maxIter):
    """ Newton Method

    Arguments:
        expr {string} -- is the polinomial expression
        x0 {float} -- is the initial value x_0
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
        fd = diff(expr, x)
        xNext = sympify(x0)
        for _iter in range(0, maxIter):
            xn = N(xNext)
            fdx = fd.subs(x, xn)
            if (fdx == 0):
                print("Error: Division by zero")
                return errReturn
            fx = f.subs(x, xn)
            xNext = xn - fx/fdx
            err = abs(xNext - xn)/abs(xNext)
            if (err <= tol):
                break
        return [N(xn), N(err), _iter, N(fx)]
    except:
        print("There was an error.")
        return errReturn
