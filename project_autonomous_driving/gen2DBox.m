dir_pic = 'data/test/left';
dir_res = 'data/test/results/';
dir_road = 'data/test/predroad/';
list_pic = dir(dir_pic);
n_pic = size(list_pic, 1);
thres = -0.7;
% n_pic = 5;
frame_rate = 1;
for i = 1:n_pic
    pic_name = list_pic(i).name;
    if size(pic_name, 2) > 4 && strcmp(pic_name(end-3:end), '.png')
        im = imread(strcat(dir_pic, '/', pic_name));
        pic_name = pic_name(1:end-4);
        out_file = {'frames/', pic_name};
        predroad = imread(strcat(dir_road, pic_name, '_predroad.png'));
        calib = load(strcat(dir_res, 'calib_', pic_name, '.mat'));
        calib = calib.file_calib.calib;
%         cloud = load(strcat(dir_res, 'cloud_', pic_name, '.mat'));
%         cloud = cloud.file_cloud.ptc.Location;
%         pred = load(strcat(dir_res, pic_name, '_results.mat'));
%         pred = pred.result;
%         pred = pred(pred(:, 6) > thres, :);
%         n_pred = size(pred, 1);
%         centers = zeros(n_pred, 3);
%         corners = cell(n_pred, 1);
%         for j = 1:n_pred
%             sub_cloud = getBox(cloud, pred(j, :));
%             [center, pts, seg] = centerOfMass(sub_cloud);
%             seg_pts = pts(seg, 1:3);
%             car_pixels = seg_pts(seg_pts(:, 2) < 1.5, :);
%             corners{j} = cloudEdges(car_pixels);
%             % [plane, inlier] = fitPlanePerp(seg_pts, 10, [0 1 0]);
%             % [plane, inlier] = fitPlaneFree(seg_pts, 0.1);
%             % pcshow(seg_pts); hold on;
%             % drawPlane(seg_pts, plane, inlier);
%             centers(j, :) = center;
%         end
        drawRoad(im, predroad, out_file, frame_rate);
%         draw2DBox(im, pred, centers, out_file, frame_rate);
%         draw3DBox(im, pred, corners, centers, calib, out_file, frame_rate);
        fprintf(strcat(pic_name, '\n'));
    end
end