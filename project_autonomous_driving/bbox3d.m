function [pt3d, pt2d, plane] = bbox3d(calib, image, ptc, ratio, normal)
% points is a Nx3 array, repr each point in real world coordinates. 
% [plane, pts] = ransac3d(points,10);
if nargin < 5
[model1,inliers,outliers] = fitPlane(ptc,2);
else
[model1,inliers,outliers] = fitPlane(ptc,2,normal);
end 

plane = model1.Parameters;
maxs = max(inliers.Location,[],1); 
mins = min(inliers.Location,[],1);

x0 = mins(1);
y0 = mins(2);
x1 = maxs(1);
y1 = maxs(2);

normplane = (plane(1:3) / norm(plane(1:3)));
p1 = [x0 y0 findZ(plane,x0,y0)];
p2 = [x0 y1 findZ(plane,x0,y1)];
p3 = [x1 y1 findZ(plane,x1,y1)];
p4 = [x1 y0 findZ(plane,x1,y0)];
p5 = p1 + normplane * ratio;
p6 = p2 + normplane * ratio;
p7 = p3 + normplane * ratio;
p8 = p4 + normplane * ratio;
pt3d = [p1;p2;p3;p4;p5;p6;p7;p8];

pt2d = proj2photo(calib, pt3d);
imshow(image.im);hold on
draw8pts(pt2d);
end