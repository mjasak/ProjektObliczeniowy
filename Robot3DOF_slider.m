function [phi, d2, d3] = Robot3DOF_slider(x3, y3 , z3)

% funckja do obliczania współrzędnych złączowych w każdej w chwili ruchu

%% wymiary robota
% ograniczenia na wysuw i wsuw to 8


%% odwrocona kinematyka
if (z3 - 10 <= 18) && (z3 - 10 >= 2) 
    d2 = z3 - 10;
else
    error('Out of range - d2')
end

if (sqrt( x3.^2 + y3.^2 ) - 10 <= 18) && (sqrt( x3.^2 + y3.^2 ) - 10 >= 2)
    d3 = sqrt( x3.^2 + y3.^2 ) - 10;
else
    error('Out of range - d3')
end

phi = atan(y3./x3);

end
