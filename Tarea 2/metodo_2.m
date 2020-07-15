warning('off')
pkg load symbolic
function [x_0,itera] = metodo_2(F,vars,x_0,tol) 
    w=[];
    x=[];
    y=[];
    z=[];
    error=[];
    a=1;
    b=-2;
    itera=0;
    iteraciones=[];
    ep=tol+1;
    JF= jacobian(F,vars);

    while(ep>tol)
        Jx_kF = linsolve(double(Fx(JF,vars,x_0)), double(Fx(F, vars, x_0))');
        y_k=x_0 - (1/2)*(Jx_kF');
        z_k = (1/3)* (4* y_k -x_0);
        u_k = y_k  +double(linsolve(double(Fx(JF,vars,x_0)-3*Fx(JF,vars,z_k)),double(Fx(F, vars, x_0))'))';
        v_k = u_k  +2*double(linsolve(double(Fx(JF,vars,x_0)-3*Fx(JF,vars,z_k)),double(Fx(F, vars, u_k))'))';
        x_0=  v_k  +2*double(linsolve(double(Fx(JF,vars,x_0)-3*Fx(JF,vars,z_k)),double(Fx(F, vars, v_k))'))';
        itera = itera+ 1;
        iteraciones=[iteraciones itera];

        error=[error ep];
        ep=double(norm(Fx(F,vars,x_0)));
    endwhile
    plot(iteraciones,error,'b--o') 
     
endfunction

function F = Fx(f,vars,x_0) 
    F=subs(f, vars, x_0);     
endfunction

  