function [plane, inlier] = fitPlaneFree (ptc, maxdist)
[model, inlier, ~] = pcfitplane(pointCloud(ptc), maxdist);
plane = model.Parameters;
end