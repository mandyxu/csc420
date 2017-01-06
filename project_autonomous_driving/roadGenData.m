pwd_road_data = 'data\data_road\training\';
imset = 'train';

x_file = getRoadData(pwd_road_data,[],'image_2','list'); x_ids = x_file.ids;
y_file = getRoadData(pwd_road_data,[],'gt_image_2','list'); y_ids = y_file.ids;

x_size = size(x_file.ids,2);
y_size = size(y_file.ids,2);

X = []; Y = [];
for i = 1
    x_id = x_ids(i);
    temp = strsplit(x_id{1},'_');
    y_id = strcat(temp{1},'_road_',temp{2});
    img_x = imread(strcat(pwd_road_data,'\image_2\',x_id{1}));
    img_y = imread(strcat(pwd_road_data,'\gt_image_2\',y_id));
    
    img_depth = roadDepth(x_id{1},imset);
    flatten_img = reshape(img,1,[]);
    X = [X; flatten_img];
end 
% img = imread(strcat(pwd_road_data,'image_2\um_000000.png'));
% img_gt = imread(strcat(pwd_road_data,'gt_image\um_lane_000000.png'));
% y = reshape(img_gt, [], 1);


