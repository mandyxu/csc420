function dist = dist2plane(plane, points)
% Calculates the shortest distance from each point in points to the plane. 
% plane is a 4x1 vector, representing a plane in 3D
% points are Nx3 vector, each row repr (x,y,z)
% Output is a Nx1 vector. 
X = [points ones(size(points,1),1)];
dist = (X * plane).^2 / sum(plane(1:3) .^ 2);
end 