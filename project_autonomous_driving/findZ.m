function z = findZ(plane,x,y)
% given x, y, and the plane in world, find z
z = -1/plane(3)*(plane(1)*x+plane(2)*y+plane(4));
end