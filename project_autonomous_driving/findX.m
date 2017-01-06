function x = findX(plane,y,z)
% given x, z, and the plane in world, find y
x = -1/plane(1)*(plane(2)*y+plane(3)*z+plane(4));
end