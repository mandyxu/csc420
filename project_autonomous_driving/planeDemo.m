a = [1 0 0 0];
b = [0 1 0 0];
c = [cross(a(1:3), b(1:3)) 0];
n = 10;
ptsa = genRndPts(n, a, [0 0 0; 1 1 1], 0.1);
ptsb = genRndPts(n, b, [0 0 0; 1 1 1], 0.1);
ptsc = genRndPts(n, c, [0 0 0; 1 1 1], 0.1);
pts = [ptsa; ptsb];

%% One plane free fit demo
figure
drawPlane(ptsa, a);
[afit, inlier] = fitPlaneFree(pts, 0.8);
figure
drawPlane(pts, afit, inlier);

%% One plane given normal fit demo
% figure
% drawPlane(ptsa, a);
% [afit, inlier] = fitPlaneNormal(ptsa, 0.2, a);
% figure
% drawPlane(ptsa, afit, inlier);

%% Two plane perp fit demo
% figure
% drawPlane(pts, a); hold on
% drawPlane(pts, b); hold off
% [afit, bfit, inlier] = fitPlanePerp(pts, 0.2, c);
% figure
% drawPlane(pts, afit, inlier);
% drawPlane(pts, bfit, inlier);
