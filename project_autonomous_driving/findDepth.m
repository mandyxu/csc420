function depth = findDepth(disp, calib)

% Need to take min with 500 because disparity contains 0 values
depth = calib.f * calib.baseline ./ disp.disparity; 
depth = min(depth, 4000); 
% new_cloud = reshape(cloud,[size(cloud,1)*size(cloud,2) 3]);
% pcshow(cloud);
% xlabel('X');
% ylabel('Y');
% zlabel('Z');
% 
% gt_image = getData(filename,imset,'gt-left-road');
% gt = min((255 - gt_image.gt(:,:,1)) + gt_image.gt(:,:,3),255)/255;
% temp = []; temp(:,:,1) = gt; temp(:,:,2)= gt; temp(:,:,3)= gt;
% crop = cloud .* temp;
% new_crop = reshape(crop,[size(crop,1)*size(crop,2) 3]);
% road_3d = new_crop(sum(new_crop,2)~=0,:);
% pc = pointCloud(road_3d);

% pcshow(crop)
% xlabel('X');
% ylabel('Y');
% zlabel('Z');
% 
% % Plot the depth
% dist = 10;
% [x, y] = meshgrid(1:dist:X, 1:dist:Y);
% fg = figure();
% surf(x, y, depth(1:dist:Y, 1:dist:X)); axis ij;
% axis equal; xlabel('x'); ylabel('y'); zlabel('z');
% title(strcat('Depth plot for image ', filename));
% saveas(fg, strcat('data\',imset,'\results\', filename, '_depth'), 'png');

end 