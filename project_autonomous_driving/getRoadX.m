function [x,image] = getRoadX(imset, imname)

% k = 5000;

%% load image & calibration & disparity & ground truth
image = getData(imname,imset, 'left');
[image_sy, image_sx, image_sz] = size(image.im); 


%% extract training features
[cloud, ~] = findCloud(imname,imset);
cloud = cloud.Location;
% index of each pixel in 2D image
[imidxx, imidxy] = meshgrid(1:image_sx,1:image_sy);

%% extracting HOG descriptors
desc = HOGdescriptor(image.im);
xdesc = reshape(desc,[image_sy*image_sx 9]);

%% generate training data x
xim = reshape(image.im, [image_sy * image_sx image_sz]);
xcloud = reshape(cloud, [image_sy * image_sx 3]);
xidx = reshape(imidxy, [image_sy * image_sx 1]);


x = [xim xcloud xidx xdesc];

end 
