
clear, clc, close all
trajType = 'cyclo';
robType = 'slider';   % planar nie dziala
createWayData;


switch trajType
    case 'harmonic'
        [q, qd, qdd] = harmonic_tr(points(:,1),points(:,2),trajTs, time(1), time(2));
    case 'cyclo'
        [q, qd, qdd] = cyclo_tr(points(:,1),points(:,2),trajTs, time(1), time(2));
    case 'ecliptic'
         [q, qd, qdd] = ecliptic_tr(points(:,1),points(:,2),trajTs, time(1), time(2));
    otherwise
        error ('Invalid trajectory type!');
end
        figure;
        plot(trajTs, q(2,:)); hold on;
        plot(trajTs, qd(2,:));
        plot(trajTs, qdd(2,:));

switch robType
    case 'slider'
        for i = 1 : length(q(1,:))
            [phi(i), d2(i), d3(i)] = Robot3DOF_slider(q(1,i), q(2,i) , q(3,i));
        end
        figure;
        plot(trajTs, phi, trajTs,d2,trajTs,d3);

    case 'planar'
        for i = 1 : length(q(1,:))
            [phi1(i),phi2(i), phi3(i)] = Robot3DOF_planar(q(1,i), q(2,i) , 40*pi/180);
        end  
    otherwise
        error ('Wrong type of robot')
end

function [q, qd, qdd] = harmonic_tr (q0, q1, ts , t0, t1)
    
    h = (q1-q0);
    T = t1 - t0;
    
    q = h/2 .* (1 - cos(pi*(ts-t0)/T)) + q0;
    qd = pi*h/(2*T) .* sin(pi*(ts-t0)/T);
    qdd= pi^2*h/(2*T^2) .* cos(pi*(ts-t0)/T);
    
end

function [q, qd, qdd] = cyclo_tr (q0, q1, ts , t0, t1)
    
    T = t1 - t0;
    
    q = (q1-q0) .* ( (ts - t0)/T - 1/(2*pi) .* sin( 2*pi*(ts - t0)/T) ) + q0;  
    qd = (q1-q0) / T .* ( 1 - cos( 2*pi*(ts-t0) / T));
    qdd= sin( 2*pi*(ts - t0)/T) * 2 * pi .* (q1-q0) / (T^2) ;
    
end

function [q, qd, qdd] = ecliptic_tr (q0, q1, ts , t0, t1)
    n = 1; % n is the ratio between the major and minor ellipse axes
    alfa = (n^2 - 1) / n^2;
    
    T = t1 - t0;
    h = (q1-q0); 
    
    q = h/2 .* (1 - cos(pi*(ts-t0)/T) ./ sqrt(1 - alfa * sin(pi*(ts-t0)/T).^2) ) + q0;
    qd = pi*h/(2*T) .* sin(pi*(ts-t0)/T) ./ (n^2 * sqrt(1 - alfa * sin(pi*(ts-t0)/T).^2) ).^3;
    qdd= pi^2.*h/(2*T^2) .* cos(pi*(ts-t0)/T) .* (1 + 2*alfa*sin(pi*(ts-t0)/T).^2) ./ (n^2 * sqrt(1 - alfa * sin(pi*(ts-t0)/T).^2) ).^5;
 
end