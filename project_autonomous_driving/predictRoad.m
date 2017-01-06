%% predict on test set
path = strcat('data\road_svmmodel_hog_86.mat'); 
model = load(path);
svmmodel = model.svmmodel;
imset = 'test';
data = getData([], imset, 'list'); ids = data.ids;
N = size(ids,2);
N = 3;
for i = 1:N
    imname = ids{i}(1:end-4); i
    [testx, testim] = getRoadX(imset, imname);
    py = predict(svmmodel, double(testx));
    %display the predicted outputs
    iy = reshape(py, [size(testim.im,1) size(testim.im,2)]);
%     imshow(testim.im)
%     f = figure('Visible', 'off');imshow(iy)
    imwrite(iy, strcat('data\test\results\aa_',imname,'_predroad.png'));
end 