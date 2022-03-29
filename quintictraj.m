
function [q,qd,qdd] = quintictraj(t0,t1,q0,q1,v0,v1,a_0,a_1,Ts)
    
    T = t1-t0;
    h = q1-q0;
    
    a0 = q0;
    a1 = v0;
    a2 = 0.5*a_0;
    a3 = (20*h - (8*v1+12*v0)*T - (3*a_0-a_1)*T^2)/2/T^3;
    a4 = (-30*h + (14*v1+16*v0)*T + (3*a_0-2*a_1)*T^2)/2/T^4;
    a5 = (12*h - (6*v1+6*v0)*T + (a_1-a_0)*T^2)/2/T^5;
    t = linspace(t0,t1,Ts);
    q = zeros(3,T);
    
    for i=1:Ts
        q(:,i) = a0 + a1.*(t(i)-t0) + a2.*(t(i)-t0).^2 + a3.*(t(i)-t0).^3 + a4.*(t(i)-t0).^4 + a5.*(t(i)-t0).^5;
        qd(:,i) = a1 + 2*a2.*(t(i)-t0) + 3*a3.*(t(i)-t0).^2 + 4*a4.*(t(i)-t0).^3 + 5*a5.*(t(i)-t0).^4;
        qdd(:,i) = a2 + 6*a3.*(t(i)-t0)+ 12*a4.*(t(i)-t0).^2 + 20*a5.*(t(i)-t0).^3;
    end
end
