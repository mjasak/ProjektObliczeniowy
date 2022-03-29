function [q,qd,qdd] = cubictraj(t0,t1,q0,q1,v0,v1,Ts)
    
    T = t1-t0;
    h = q1-q0;
    a0 = q0;
    a1 = v0;
    a2 = (3*h-(2*v0+v1)*T)/T^2;
    a3 = (-2*h + (v0+v1)*T)/T^3;
    t = linspace(t0,t1,Ts);
    q = zeros(3,T);
    
    for i=1:Ts
        q(:,i) = a0 + a1.*(t(i)-t0) + a2.*(t(i)-t0).^2 + a3.*(t(i)-t0).^3;
        qd(:,i) = a1 + 2*a2.*(t(i)-t0) + 3*a3.*(t(i)-t0).^2;
        qdd(:,i) = 2*a2 + 6*a3.*(t(i)-t0);
    end
end
