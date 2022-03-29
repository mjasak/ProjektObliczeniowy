function [phi1,phi2, phi3] = Robot3DOF_planar(x3,y3, theta)

% funckja do obliczania współrzędnych złączowych w każdej w chwili ruchu

%% wymiary robota
% BASE ------l1------ X1Y1 -----l2----- X2Y2 ---l3--- X3Y3 (EE)
l1 = 20;
l2 = 10;
l3 = 5;

%% prosta kinematyka
% 
% x3 = l1 * cos(phi1) + l2 * cos(phi1 + phi2) + l3 * cos(phi1 + phi2 + phi3);
% y3 = l1 * sin(phi1) + l2 * sin(phi1 + phi2) + l3 * sin(phi1 + phi2 +phi3);
% theta = phi1 + phi2 +phi3;
 

%% odwrocona kinematyka
x2 = x3 - l3*cos(theta);
y2 = y3 - l3*sin(theta);

phi2 = acos( (x2.^2 + y2.^2 - l1^2 - l2^2) / 2*l1*l2 );

c1 = ((l1 + l2.*cos(phi2)).*x2 + l2.*y2.*sin(phi2)) ./ (x2.^2 + y2.^2);
s1 = ((l1 + l2.*cos(phi2)).*y2 + l2.*x2.*sin(phi2)) ./ (x2.^2 + y2.^2);

phi1 = atan(s1./c1);

phi3 = theta - (phi1 + phi2);

end

