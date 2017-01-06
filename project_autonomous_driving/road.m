addpath(genpath(pwd));
imset = 'test';

dataid = getData([], imset, 'list'); ids = dataid.ids;

%% generate & save disparities for all images
% for i = 1:size(dataid.ids,2)
%     imname = ids{i}(1:end-4); i
%     disp = findDisparity(imname,imset);
% end 

%% generate & save point clouds
for i = 1:size(dataid.ids,2)
% for i = 1
    %% load image & calibration & disparity
    imname = ids{i}(1:end-4); i
    image = getData(imname, imset, 'left');
    calib = getData(imname,imset,'calib');
    
    % find cloud of the image
    [ptc, ptc_rs] = findCloud(imname,imset); % point cloud in shape (N x M x 3)


    
    % fit ground plane
    groundnormal = [0 1 0];
    maxdist = 2;
    [plane_road,inliers_road,outliers_road] = fitPlane(ptc,maxdist,groundnormal);
    
    % 4 corners in 3d coordinates
    corners4_road3d = drawPlane(inliers_road.Location, plane_road.Parameters); 
    corners4_road2d = proj2photo(calib,corners4_road3d);
    
    % show the generated results
%     figure;
%     imshow(image.im);hold on
%     plot(corners4_road2d(:,2), corners4_road2d(:,1))
%     figure;
%     pcshow(ptc)
    
    filepath = strcat(pwd, '\data\',imset,'\results\',imname);
    % saves road data to file
    file_road = [];
    file_road.plane = plane_road;
    file_road.pt2d = corners4_road2d;
    file_road.pt3d = corners4_road3d;
    file_road.inliers = inliers_road;
    file_road.outliers = outliers_road;
    filepath_road = strcat(filepath, '_road.mat');
    save(filepath_road, 'file_road');
    
    % saves point cloud data to file
    file_cloud = [];
    file_cloud.ptc = ptc;
    file_cloud.ptc3 = ptc_rs;
    filepath_cloud = strcat(filepath,'_cloud.mat');
    save(filepath_cloud, 'file_cloud');
    
    % saves calibration to .mat file
    file_calib = [];
    file_calib.calib = calib;
    filepath_calib = strcat(filepath,'_calib.mat');
    save(filepath_calib, 'file_calib');
end 

for i = 1
    break
    imname = ids{i}(1:end-4);
    
    %% run dpm on image to find car, person, cyclist
%     dpm(imname,imset);

    %% show point clouds of each predicted bbox in 3D
%     predictions = drawBox(image.im, imname, imset);
    predictions = [911 135 1067 347]-100;

    cropcloud = {}; 
    cropptc = {};
    for j = 1:size(predictions,1)
        [cropcloud{j}, cropptc{j}] = cropPred2c(ptc.Location, predictions(j,:));
        pcshow(cropcloud{j});hold on
    end 
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    
    
 
    

    
    f = figure;
    imshow(image.im);hold on
    %% fit plane to each of the point clouds and display the plane in 2D
    fig2d = figure;
%     for j = 1:size(predictions,1)
    for j = 1 
        [pt3d, pt2d, plane] = bbox3d(calib, image, cropptc{j}, 700);
    end
    
%     
%     imshow(edge(double(rgb2gray(image.im)), 'Canny', 0.1));        
%     image_lab = rgb2lab(image.im);

%     imshow(temp_im(:,:,2)+temp_im(:,:,3))

%     %% visualize the results from the object detector & adding labels 
%     dpm(imname,imset);
%     pred = drawBox(image.im, imname, imset);
%     
%     %% project 3d to photo coordinators
%     
    
%     %% load ground road truth & crop out the road from the image
%     gt_image = getData(imname,imset,'gt-left-road');
%     gt_road_crop = cropGT(image,strcat('gt_',imname),gt_image.gt);

    %% find center of mass    
%     [com, seg] = centersOfMass(cloud, pred);
%     
%     %% find the segmentations 
%     drawSegment(image.im, imname, pred, com, seg);
%     
%     %% generate text
%     genText(pred, com);
    
end 
