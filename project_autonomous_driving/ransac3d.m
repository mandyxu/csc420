function [best_plane, sub_points] = ransac3d(points, thres)
S = 1000; k = 10;
n = size(points,1);
maxnum = 0;
best_plane = zeros(1,4);
for s = 1:S
    % randomly pick k numbers from 1 to n without replacement
    idx = randperm(n,k);
    sample = points(idx,:);
    plane = fitPlane(sample,thres);
    dist = dist2plane(plane,points);
    count = sum(dist < thres);
    if count > maxnum
        maxnum = count;
        best_plane = plane;
        pts = dist < thres;
    end 
end
sub_points = points(pts, :);
end 