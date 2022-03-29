function p = forward_RRR(q);

a1 = 0.4;
a2 = 0.3;
a3 = 0.4;

r = a2*cos(q(2))+a3*cos(q(2)+q(3));
z = a1 + a2*sin(q(2))+a3*sin(q(2)+q(3));

x = r*cos(q(1));
y = r*sin(q(1));

p = [x;y;z];
end