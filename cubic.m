
% WSPOLRZEDNE ZEWNETRZNE
[q,qd,qdd] = cubictraj(0,4,[1;5;3],[2;6;2],[0;0;0],[0;0;0],40);

n_samples=40;
figure(1);
t = linspace(0,4,40);
subplot(3,1,1);
plot(t, q)
hold all
xlabel('t')
ylabel('Positions')
legend('X-positions','Y-positions', 'Z-positions')
subplot(3,1,2);
plot(t, qd)
hold all
xlabel('t')
ylabel('Velocity')
legend('X-velocity','Y-velocity', 'Z-velocity')
subplot(3,1,3);
plot(t, qdd)
hold all
xlabel('t')
ylabel('Acceleration')
legend('X-acceleration','Y-acceleration', 'Z-acceleration')

sgtitle("Cartesian coordinates for cubic trajectory");
hold off

% WSPOLRZEDNE WEWNETRZNE
qw_cub = zeros(3,n_samples);
qdw_cub = zeros(3,n_samples);
qddw_cub = zeros(3,n_samples);
for i =1:n_samples
   qw_cub(:,i) =  inverse_RRP(q(:,i));
end
qdw_cub(:,2:n_samples) = diff(qw_cub,1,2);
qdw_cub(:,1) = [0;0;0];

qddw_cub(:,2:n_samples) = diff(qdw_cub,1,2);
qddw_cub(:,1) = [0;0;0];
figure(2);

subplot(3,1,1);
plot(t, qw_cub)
hold all
xlabel('t')
ylabel('Positions')
legend('Phi_1', 'Phi_2', 'd')
subplot(3,1,2);
plot(t, qdw_cub)
hold all
xlabel('t')
ylabel('Velocity')
legend('Phi_1 dot', 'Phi_2 dot', 'd dot')
subplot(3,1,3);
plot(t, qddw_cub)
hold all
xlabel('t')
ylabel('Acceleration')
legend('Phi_1 dot dot', 'Phi_2 dot dot', 'd dot dot')

sgtitle("Joint coordinates for cubic trajectory");
hold off
