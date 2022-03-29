wpts = [1,2,4,3; 5,6,4,2; 3,2,1,0];
tpts = 0:3;

tvec = 0:0.1:4;
%{
[q,qd,qdd,pp] = cubicpolytraj(wpts, tpts, tvec);

plot(tvec, qdd)
hold all
plot(tpts, wpts, 'x')
xlabel('t')
ylabel('Positions')
legend('X-positions','Y-positions', 'Z-positions')
hold off
%}
