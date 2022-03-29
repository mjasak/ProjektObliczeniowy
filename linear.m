% WSPOLRZEDNE ZEWNETRZNE
n_samples = 40;
[q,qd,qdd] = lineartraj(0,4,[1;5;3],[2;6;2],n_samples);

figure(1);
t = linspace(0,4,n_samples);
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
sgtitle("Cartesian coordinates for linear trajectory");
hold off

% WSPOLRZEDNE WEWNETRZNE
qw_lin = zeros(3,n_samples);
qdw_lin = zeros(3,n_samples);
qddw_lin = zeros(3,n_samples);

for i =1:n_samples
   qw_lin(:,i) =  inverse_RRP(q(:,i));
end

qdw_lin(:,2:n_samples) = diff(qw_lin,1,2);
qdw_lin(:,1) = [0;0;0];

qddw_lin(:,2:n_samples) = diff(qdw_lin,1,2);
qddw_lin(:,1) = [0;0;0];


figure(2);

subplot(3,1,1);
plot(t, qw_lin)
hold all
xlabel('t')
ylabel('Positions')
legend('Phi_1', 'Phi_2', 'd')
subplot(3,1,2);
plot(t, qdw_lin)
hold all
xlabel('t')
ylabel('Velocity')
legend('Phi_1 dot', 'Phi_2 dot', 'd dot')
subplot(3,1,3);
plot(t, qddw_lin)
hold all
xlabel('t')
ylabel('Acceleration')
legend('Phi_1 dot dot', 'Phi_2 dot dot', 'd dot dot')

sgtitle("Joint coordinates for linear trajectory");
hold off