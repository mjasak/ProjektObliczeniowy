
function [q,qd,qdd] = lineartraj(t0,t1,q0,q1,Ts)
    
    T = t1-t0;
    h = q1-q0;
    
    a0 = q0;
    a1 = h/T;
    t = linspace(t0,t1,Ts);
    q = zeros(3,Ts);
    
    for i=1:Ts
        q(:,i) = a0 + a1.*(t(i)-t0);
        qd(:,i) = a1;
        qdd(:,i) = [0;0;0];
    end
end
