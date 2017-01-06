function y = findY(plane,x,z)
% given x, z, and the plane in world, find y
y = -1/plane(2)*(plane(1)*x+plane(3)*z+plane(4));
end