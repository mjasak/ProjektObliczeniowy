function fi=inverse_RRR(pkt)

a1=0.4;
a2=0.3;
a3 = 0.4;
x=pkt(1); y=pkt(2);z=pkt(3);

fi1 = atan2(x,y);

r2 = x^2 + y^2;
s = z-a1;

if r2 > (a2+a3)^2
    disp('Zadane polozenie jest nieosiagalne');
    return
end
D = (r2 + (z-a1)^2 - a2^2 - a3^2)/2/a2/a3;
fi3_1 = atan2(D, sqrt(1-D^2));
%fi3_2 = atan2(D,-sqrt(1-D^2));
fi3 = fi3_1;
fi2 = atan2(sqrt(r2),s) - atan2(a2+a3*cos(fi3),a3*sin(fi3));

fi = [fi1; fi2; fi3];

end