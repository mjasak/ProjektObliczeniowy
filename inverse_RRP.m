function q=inverse_RRP(pkt)

a1=0;
x=pkt(1); y=pkt(2);z=pkt(3);

fi1 = atan2(x,y);
r2 = x^2+y^2;
s = z-a1;

fi2 = atan2(s,sqrt(r2));

d3 = sqrt(r2+s^2);
if d3 > 100 || d3 < 0
    disp('d3 out of range')
    return
end
q = [fi1;fi2;d3];
end