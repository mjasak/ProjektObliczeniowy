%plots
linear;
cubic;
quintic;

n=3;
figure(11);
plot(t,qw_lin(n,:));hold on;
plot(t,qw_cub(n,:));hold on;
plot(t, qw_quin(n,:));hold on;
title('Porównanie położeń w 1 parze kinematycznej');
legend('linear', 'cubic', 'quintic');
xlabel('t');
ylabel('Position');grid on;
hold off;

figure(12);
plot(t,qdw_lin(n,:));hold on;
plot(t,qdw_cub(n,:));hold on;
plot(t, qdw_quin(n,:));hold on;
title('Porównanie prędkości w 3 parze kinematycznej');
legend('linear', 'cubic', 'quintic');
xlabel('t');
ylabel('Velocity');grid on;
hold off;

figure(13);
plot(t,qddw_lin(n,:));hold on;
plot(t,qddw_cub(n,:));hold on;
plot(t, qddw_quin(n,:));hold on;
title('Porównanie przyspieszeń w 3 parze kinematycznej');
legend('linear', 'cubic', 'quintic');
xlabel('t');
ylabel('Acceleration');grid on;
hold off;
