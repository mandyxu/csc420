function [planeA, planeB, inlier] = fitPlanePerp (ptc, maxdist, normal)
ntheta = 36;
cloud = pointCloud(ptc);
perp = null(normal(1:3));
dtheta = 2 * pi / ntheta;
maxnum = 0;
for theta = 1:(ntheta - 1)
    rot = rotationVectorToMatrix(normal(1:3) / norm(normal(1:3)) * dtheta * theta);
    perp = rot * perp;
    [tempModelA, inlierA, ~] = pcfitplane(cloud, maxdist, perp(1:3, 1)');
    [tempModelB, inlierB, ~] = pcfitplane(cloud, maxdist, perp(1:3, 2)');
    tempInlier = unique(vertcat(inlierA, inlierB));
    if size(tempInlier, 1) > maxnum
        maxnum = size(tempInlier, 1);
        modelA = tempModelA;
        modelB = tempModelB;
        inlier = tempInlier;
    end
end
planeA = modelA.Parameters;
planeB = modelB.Parameters;
end