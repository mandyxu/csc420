function [frag, ptc] = cropPred2c(cloud, box)
% crop the image wrt the given the prediction box, 
% return the point cloud of the cropped fragment of image. 
bbox = boundIndex(box, size(cloud));
frag = cloud(bbox(2):bbox(4),bbox(1):bbox(3),:);

new_crop = reshape(frag,[size(frag,1)*size(frag,2) 3]);
ptc = pointCloud(double(new_crop));

end 

