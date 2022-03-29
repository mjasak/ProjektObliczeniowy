nb = linspace(1,100);
n = linspace(1,100);
[Nb, N] = meshgrid(nb,n);
y = sqrt(2*log(1+Nb)./(1+N));

figure(2);
surf(Nb,N,y);xlabel("Nb"); ylabel("N");
%contour(Nb,N,y)