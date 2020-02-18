from sympy import *

x = symbols('x')


def bisection(expr, a, b, tol):
    """ Bisection Method

    Arguments:
        expr {string} -- is the polinomial expression
        a {float} -- is "a" in bisection interval [a, b]
        b {float} -- is "b" in bisection interval [a, b]
        tol {float} -- is the tolerance
    Returns:
        xn {float} -- is the solution
        err {float} -- is the error
        _iter {int} -- is the amount of iterations
        fx {float} -- is f(xn)

    """
    errReturn = [0, 0, 0, 0]
    try:
        f = sympify(expr)
        fa = f.subs(x, a)
        fb = f.subs(x, b)
        if (fa * fb > 0):
            return errReturn
        maxIter = 1 + round(N((log(b - a) - log(tol)) / log(2)))
        for _iter in range(0, maxIter):
            xn = (a + b)/2
            fx = f.subs(x, xn)
            err = abs(b - a)
            if (fx == 0):
                a = xn
                b = xn
            elif ((fb * fx) > 0):
                b = xn
                fb = fx
            else:
                a = xn
                fa = fx
            if (err <= tol):
                break
        return [xn, err, _iter, fx]
    except:
        print("There was an error.")
        return errReturn
