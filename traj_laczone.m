%% INPUT
pts = [[1;5;3],[2;6;2],[1;7;1]];

% pts(:,1);

n_samples = 40;

rank = 5;
type = 'o'; %o for own or b for built-in

    
        [q1,qd1,qdd1] = lineartraj(0,4,pts(:,1),pts(:,2),n_samples);
        [q2,qd2,qdd2] = lineartraj(4,8,pts(:,2),pts(:,3),n_samples);
        [q3,qd3,qdd3] = lineartraj(8,12,pts(:,3),pts(:,1),n_samples);
        q_lin = [q1,q2,q3];
        qd_lin = [qd1,qd2,qd3];
        qdd_lin = [qdd1,qdd2,qdd3];
        
        [q1,qd1,qdd1] = quintictraj(0,4,pts(:,1),pts(:,2),[0;0;0],[0;0;0],[0;0;0],[0;0;0],n_samples);
        [q2,qd2,qdd2] = quintictraj(4,8,pts(:,2),pts(:,3),[0;0;0],[0;0;0],[0;0;0],[0;0;0],n_samples);
        [q3,qd3,qdd3] = quintictraj(8,12,pts(:,3),pts(:,1),[0;0;0],[0;0;0],[0;0;0],[0;0;0],n_samples);
        q_quin = [q1,q2,q3];
        qd_quin = [qd1,qd2,qd3];
        qdd_quin = [qdd1,qdd2,qdd3];


        [q1,qd1,qdd1] = cubictraj(0,4,pts(:,1),pts(:,2),[0;0;0],[0;0;0],n_samples);
        [q2,qd2,qdd2] = cubictraj(4,8,pts(:,2),pts(:,3),[0;0;0],[0;0;0],n_samples);
        [q3,qd3,qdd3] = cubictraj(8,12,pts(:,3),pts(:,1),[0;0;0],[0;0;0],n_samples);
        q_cub = [q1,q2,q3];
        qd_cub = [qd1,qd2,qd3];
        qdd_cub = [qdd1,qdd2,qdd3];

    wpts = [pts,pts(:,1)];
    tpts = [0,4,8,12];
    tvec = linspace(0,12,3*n_samples);

    [q_cub_m,qd_cub_m,qdd_cub_m,pp] = cubicpolytraj(wpts, tpts, tvec);

    [q_quin_m,qd_quin_m,qdd_quin_m,pp] = quinticpolytraj(wpts, tpts, tvec);


qw = zeros(3,3*n_samples);
qdw = zeros(3,3*n_samples);
qddw = zeros(3,3*n_samples);


for i =1:3*n_samples
   qw_lin(:,i) =  inverse_RRP(q_lin(:,i));
end
qdw_lin(:,2:3*n_samples) = diff(qw_lin,1,2);
qdw_lin(:,1) = [0;0;0];

qddw_lin(:,2:3*n_samples) = diff(qdw_lin,1,2);
qddw_lin(:,1) = [0;0;0];

for i =1:3*n_samples
   qw_cub(:,i) =  inverse_RRP(q_cub(:,i));
end
qdw_cub(:,2:3*n_samples) = diff(qw_cub,1,2);
qdw_cub(:,1) = [0;0;0];

qddw_cub(:,2:3*n_samples) = diff(qdw_cub,1,2);
qddw_cub(:,1) = [0;0;0];

for i =1:3*n_samples
   qw_quin(:,i) =  inverse_RRP(q_quin(:,i));
end
qdw_quin(:,2:3*n_samples) = diff(qw_quin,1,2);
qdw_quin(:,1) = [0;0;0];

qddw_quin(:,2:3*n_samples) = diff(qdw_quin,1,2);
qddw_quin(:,1) = [0;0;0];


t = linspace(0,12,3*n_samples);
n=2
figure(11);
plot(t,qw_lin(n,:));hold on;
plot(t,qw_cub(n,:));hold on;
plot(t, qw_quin(n,:));hold on;
title('Porównanie położeń wzdłuż osi X układu globalnego');
legend('linear', 'cubic', 'quintic');
xlabel('t');
ylabel('Position');grid on;
hold off;

figure(12);
plot(t,qdw_lin(n,:));hold on;
plot(t,qdw_cub(n,:));hold on;
plot(t, qdw_quin(n,:));hold on;
title('Porównanie prędkości wzdłuż osi X układu globalnego');
legend('linear', 'cubic', 'quintic');
xlabel('t');
ylabel('Position');grid on;
hold off;

figure(13);
plot(t,qddw_lin(n,:));hold on;
plot(t,qddw_cub(n,:));hold on;
plot(t, qddw_quin(n,:));hold on;
title('Porównanie przyspieszeń wzdłuż osi X układu globalnego');
legend('linear', 'cubic', 'quintic');
xlabel('t');
ylabel('Position');grid on;
hold off;

 n=2;
figure(21);
plot(t, q_quin(n,:));hold on;
plot(t,q_quin_m(n,:));hold on;
title('Porównanie położeń wzdłuż osi Y układu globalnego');
legend('own', 'build-in');
xlabel('t');
ylabel('Position');grid on;
hold off;

figure(22);
plot(t, qd_quin(n,:));hold on;
plot(t,qd_quin_m(n,:));hold on;
title('Porównanie prędkości wzdłuż osi Y układu globalnego');
legend('own', 'build-in');
xlabel('t');
ylabel('Position');grid on;
hold off;

figure(23);
plot(t, qdd_quin(n,:));hold on;
plot(t,qdd_quin_m(n,:));hold on;
title('Porównanie przyspieszeń wzdłuż osi Y układu globalnego');
legend('own', 'build-in');
xlabel('t');
ylabel('Position');grid on;
hold off;
