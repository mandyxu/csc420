addpath(genpath(pwd));
imset = 'train';


data = getData([], imset, 'list'); ids = data.ids;
num_train = floor(size(data.ids,2)*0.9);

%% train svm model on training set
k = 1000; %modify to change the size of training set
X = []; 
Y = [];
% num_train = 3;
for i = 1:num_train
    imname = ids{i}(1:end-4); i
    %% load image & calibration & disparity & ground truth
    image = getData(imname, imset, 'left');
    [image_sy, image_sx, image_sz] = size(image.im); 
    idx = randperm(image_sy*image_sx,k);

    x = getRoadX(imset, imname);
    x = x(idx,:);
    
    %% generate labels y (local)
    image_gt = getData(imname, imset,'gt-left-road');
    gt = min((255 - image_gt.gt(:,:,1)) + image_gt.gt(:,:,3),255)/255;
    y = reshape(gt, [image_sy * image_sx 1]);
    y = y(idx,:);

    %% concatenate to global X & Y
    X = [X; x];
    Y = [Y; y];
end 

%% fit & save the SVM model
svmmodel = fitcsvm(double(X), double(Y));
path = strcat('data\road_svmmodel_hog_86.mat');
save(path, 'svmmodel');


scores = [];
for i = num_train:size(data.ids,2)
% for i = num_train:num_train+1
    imname = ids{i}(1:end-4); i
    image = getData(imname, imset, 'left');
    [image_sy, image_sx, image_sz] = size(image.im); 
    idx = randperm(image_sy*image_sx,k);
    [x, image] = getRoadX(imset, imname);

    
    %% generate labels y (local)
    image_gt = getData(imname, imset,'gt-left-road');
    gt = min((255 - image_gt.gt(:,:,1)) + image_gt.gt(:,:,3),255)/255;
    y = reshape(gt, [image_sy * image_sx 1]);

    %% concatenate to global X & Y
    py = predict(svmmodel, double(x));
    scores = [scores mean(py == y)];
    
%     iy = reshape(py, [image_sy, image_sx]);
end 

mean(scores)
