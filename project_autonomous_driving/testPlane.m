% this file is to test the correctness of fitplane. 

[x y] = meshgrid(0:0.5:10);
a = [1 2 3 4];
b = [-2 -2 3 30];
points_za = findZ(a,x,y) + normrnd(0,0.5,[21,21]);
points_zb = findZ(b,x,y) + normrnd(0,1,[21,21]);
pointsa = [reshape(x, [21*21,1]) reshape(y, [21*21,1]) reshape(points_za, [21*21,1])];
pointsb = [reshape(x, [21*21,1]) reshape(y, [21*21,1]) reshape(points_zb, [21*21,1])];
points = [pointsa; pointsb];
[A, subpoints] = ransac3d(points,10);
% A = fitPlane(points);
z = -1/A(3)*(A(1)*x+A(2)*y+A(4));



maxs = max(subpoints,[],1);
mins = min(subpoints,[],1);

x0 = mins(1);
y0 = mins(2);
x1 = maxs(1);
y1 = maxs(2);

plane = A; 
ratio = (maxs(3) - mins(3)) / 2;
normal = (plane(1:3) / norm(plane(1:3)))';
p1 = [x0 y0 findZ(plane,x0,y0)];
p2 = [x0 y1 findZ(plane,x0,y1)];
p3 = [x1 y1 findZ(plane,x1,y1)];
p4 = [x1 y0 findZ(plane,x1,y0)];
p5 = p1 + normal * ratio;
p6 = p2 + normal * ratio;
p7 = p3 + normal * ratio;
p8 = p4 + normal * ratio;
pt3d = [p1;p2;p3;p4;p5;p6;p7;p8];

% plot3()
% surf(x,y,z);hold on
plot3(points(:,1),points(:,2),points(:,3),'go');hold on
plot3(subpoints(:,1),subpoints(:,2),subpoints(:,3),'ro');hold on
draw8pts(pt3d);
