function [plane, inlier] = fitPlaneNormal (ptc, maxdist, normal)
[model, inlier, ~] = pcfitplane(pointCloud(ptc), maxdist, normal(1:3));
plane = model.Parameters;
end