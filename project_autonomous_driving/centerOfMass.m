function [center, pts, seg] = centerOfMass(cloud)
% default dimensions of the car and max tolerance for center of mass
dim = 0.5 * [5 4 5];
eps = 1;
% reshape the cloud ^.^
[Y, X, ~] = size(cloud);
[mX, mY] = meshgrid(1:X, 1:Y);
pts = cat(3, cloud, cat(3, mX, mY));
pts = reshape(pts, [], 5);
% initialize
seg = true(X * Y, 1);
temp = getCenter(pts, seg);
center = temp + 2 * eps;
% repeatedly find center and resegment
counter = 0;
while (max(abs(center - temp)) > eps) && (counter < 2)
    center = temp;
    seg = segment(pts, center, dim);
    temp = getCenter(pts, seg);
    counter = counter + 1;
end
end 