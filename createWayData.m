
Waypoints = 2;

%position of EE
switch robType
    case 'slider'
        points = [15,  0, 15; 15, 15, 15]';
    case 'planar'
        points = [30,  0; 25, 3]';
    otherwise
        error ('Wrong type of robot')
end
%way point times
time = [0 10]';

%trajectory sample time
ts = 0.2;
trajTs = 0 : ts : time(end);

