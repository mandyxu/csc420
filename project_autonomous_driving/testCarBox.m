a = [1 0 0 0];
b = [0 1 0 0];
c = [cross(a(1:3), b(1:3)) 0];
ptsa = genRndPts(20, a, [0 0 0; 1 1 1], 0.1);
ptsb = genRndPts(20, b, [0 0 0; 1 1 1], 0.1);
ptsc = genRndPts(20, c, [0 0 0; 1 1 1], 0.1);
pts = [ptsa; ptsb];

%% One plane fit demo
[x, y] = meshgrid(0:1/30:1, 0:1/30:1);
x = reshape(x, [], 1);
y = reshape(y, [], 1);
for i = 1:36
    z = i / 40 - 0.45 + (x + y) * 0.0001; 
    pt = [ptsc; [x y z]];
    [c, inlier] = fitPlaneNormal(pt, 0.2, c);
    fg = figure;
    drawPlane(ptsc, c, inlier(inlier < size(ptsc, 1))); hold off
    saveas(fg, strcat('demo\one_plane_test_', int2str(i), '_angle.jpg'));
    close all;
end

%% Two plane fitted demo
% [b, a, inlier] = fitPlanePerp(pts, 0.2, c);
% fg = figure;
% drawPlane(pts, a, inlier); hold on;
% drawPlane(pts, b, inlier); hold off;
% for i=1:36
%    camorbit(10,0,'data')
%    saveas(fg, strcat('demo\two_plane_test_', int2str(i), '_angle.jpg'));
% end

%% Two plane fit demo

% for i=1:36
%     rot = rotationVectorToMatrix(c(1:3) / norm(c(1:3)) * 2 * pi / 36 * i);
%     a(1:3) = rot * a(1:3)';
%     b(1:3) = rot * b(1:3)';
%     [a, inliera] = fitPlaneNormal(pts, 0.2, a);
%     [b, inlierb] = fitPlaneNormal(pts, 0.2, b);
%     inlier = unique(vertcat(inliera, inlierb));
%     fg = figure;
%     drawPlane(pts, a, inlier); hold on;
%     drawPlane(pts, b, inlier); hold off;
%     saveas(fg, strcat('demo\rotate_plane_test_', int2str(i), '_angle.jpg'));
%     close all;
% end
