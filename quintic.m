n_samples=40;
% WSPOLRZEDNE ZEWNETRZNE
[q,qd,qdd] = quintictraj(0,4,[1;5;3],[2;6;2],[0;0;0],[0;0;0],[0;0;0],[0;0;0],40);
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

sgtitle("Cartesian coordinates for quintic trajectory");
hold off

% WSPOLRZEDNE WEWNETRZNE
qw_quin = zeros(3,n_samples);
qdw_quin = zeros(3,n_samples);
qddw_quin = zeros(3,n_samples);
for i =1:n_samples
   qw_quin(:,i) =  inverse_RRP(q(:,i));
end
qdw_quin(:,2:n_samples) = diff(qw_quin,1,2);
qdw_quin(:,1) = [0;0;0];

qddw_quin(:,2:n_samples) = diff(qdw_quin,1,2);
qddw_quin(:,1) = [0;0;0];
figure(2);

subplot(3,1,1);
plot(t, qw_quin)
hold all
xlabel('t')
ylabel('Positions')
legend('Phi_1', 'Phi_2', 'd')
subplot(3,1,2);
plot(t, qdw_quin)
hold all
xlabel('t')
ylabel('Velocity')
legend('Phi_1 dot', 'Phi_2 dot', 'd dot')
subplot(3,1,3);
plot(t, qddw_quin)
hold all
xlabel('t')
ylabel('Acceleration')
legend('Phi_1 dot dot', 'Phi_2 dot dot', 'd dot dot')

sgtitle("Joint coordinates for quintic trajectory");
hold off