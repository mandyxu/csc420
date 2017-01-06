
plane = fitPlane(ptc, 10);
[x z] = meshgrid(0:0.5:10);
a = [1 2 3 4];
b = [-2 -2 3 30];
points_za = findY(a,x,z) + normrnd(0,0.5,[21,21]);
pointsa = [reshape(x, [21*21,1]) reshape(y, [21*21,1]) reshape(points_za, [21*21,1])];

