pkg load symbolic
function [JF] = metodo1(f,vars,x_0,tol) 
    F=f;
    w=[];
    x=[];
    y=[];
    z=[];
    error=[];
    a=1;
    b=-2;
    itera=0;
    ep=tol+1;
    JF= jacobian(F,vars);
    Fx=subs(F, vars, x_0)   
endfunction

pkg load symbolic
syms x y z w
f=[(w**2)+x-(3*y)+(4*z)+(3/4),(3*w**2)+x-(y**2)+(z**2)+(13/4),(5*w)+(3*x**2)+y-(4*z**2)-(99/2),(8*w**2)-(14*x)+(6*y**2)-(7*z**2)+7];
vars=[w,x,y,z];
x0=[2 1 2 1];
tol=0.0001;
[JF]=metodo1(f,vars,x0,tol)