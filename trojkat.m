%% INPUT
pts = [[1;5;3],[2;6;2],[1;7;1]];

% pts(:,1);

n_samples = 40;

rank = 5;
type = 'o'; %o for own or b for built-in

%% PLOTS
if type == 'o'
    if rank == 5
        [q1,qd1,qdd1] = quintictraj(0,4,pts(:,1),pts(:,2),[0;0;0],[0;0;0],[0;0;0],[0;0;0],n_samples);
        [q2,qd2,qdd2] = quintictraj(4,8,pts(:,2),pts(:,3),[0;0;0],[0;0;0],[0;0;0],[0;0;0],n_samples);
        [q3,qd3,qdd3] = quintictraj(8,12,pts(:,3),pts(:,1),[0;0;0],[0;0;0],[0;0;0],[0;0;0],n_samples);
        q_quin = [q1,q2,q3];
        qd_quin = [qd1,qd2,qd3];
        qdd_quin = [qdd1,qdd2,qdd3];

    elseif rank == 3 
        [q1,qd1,qdd1] = cubictraj(0,4,pts(:,1),pts(:,2),[0;0;0],[0;0;0],n_samples);
        [q2,qd2,qdd2] = cubictraj(4,8,pts(:,2),pts(:,3),[0;0;0],[0;0;0],n_samples);
        [q3,qd3,qdd3] = cubictraj(8,12,pts(:,3),pts(:,1),[0;0;0],[0;0;0],n_samples);
        q_cub = [q1,q2,q3];
        qd_cub = [qd1,qd2,qd3];
        qdd_cub = [qdd1,qdd2,qdd3];
    else 
        disp('Wrong rank');
        return;
    end
    
elseif type == 'b'
    wpts = [pts,pts(:,1)];
    tpts = [0,4,8,12];
    tvec = linspace(0,12,3*n_samples);
    if rank == 3   
        [q,qd,qdd,pp] = cubicpolytraj(wpts, tpts, tvec);
    elseif rank == 5
        [q,qd,qdd,pp] = quinticpolytraj(wpts, tpts, tvec);
    end
else
    disp('Wrong type');
end

t = linspace(0,12,3*n_samples);




figure(1)
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
qw = zeros(3,3*n_samples);
qdw = zeros(3,3*n_samples);
qddw = zeros(3,3*n_samples);

for i =1:3*n_samples
   qw(:,i) =  inverse_RRP(q(:,i));
end
qdw(:,2:3*n_samples) = diff(qw,1,2);
qdw(:,1) = [0;0;0];

qddw(:,2:3*n_samples) = diff(qdw,1,2);
qddw(:,1) = [0;0;0];
figure(2);

subplot(3,1,1);
plot(t, qw)
hold all
xlabel('t')
ylabel('Positions')
legend('Phi_1', 'Phi_2', 'd')
subplot(3,1,2);
plot(t, qdw)
hold all
xlabel('t')
ylabel('Velocity')
legend('Phi_1 dot', 'Phi_2 dot', 'd dot')
subplot(3,1,3);
plot(t, qddw)
hold all
xlabel('t')
ylabel('Acceleration')
legend('Phi_1 dot dot', 'Phi_2 dot dot', 'd dot dot')

sgtitle("Joint coordinates for quintic trajectory");
hold off

figure(3);
plot3(q(1,:),q(2,:),q(3,:),'or','color','blue');grid on;xlabel('X');ylabel('Y');zlabel('Z');