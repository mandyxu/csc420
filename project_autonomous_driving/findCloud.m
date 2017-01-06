function [ptc, ptc_rs] = findCloud(imname, imset)
disp = getData(imname, imset, 'disp');
calib = getData(imname, imset, 'calib');

depth = findDepth(disp, calib);
[Y, X] = size(depth);

px = calib.K(1, 3);
py = calib.K(2, 3);

cloud = zeros(Y, X, 3);
for ix = 1:X
    for iy = 1:Y
       cloud(iy, ix, :) = findXY(iy, ix, depth(iy, ix), py, px, calib.f);
    end
end
cloud = single(cloud);
ptc = pointCloud(cloud); %convert to point cloud format
ptc_rs = pointCloud(reshape(cloud,[size(cloud,1)*size(cloud,2) 3]));

end