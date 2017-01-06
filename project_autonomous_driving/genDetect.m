dir_pic = '/h/u16/g6/00/xumengd1/csc420/project/data_road/testing/image_2';
dir_det = '/h/u16/g6/00/xumengd1/csc420/project/code/dpm/detector';
list_pic = dir(dir_pic);
list_det = dir(dir_det);
n_pic = size(list_pic, 1);
n_det = size(list_det, 1);
n_detector = 0;
name_detector = cell(n_det, 1);
for i = 1:n_det
    detect = list_det(i).name;
    if size(detect, 2) > 4 && strcmp(detect(end-3:end), '.mat')
        n_detector = n_detector + 1;
        name_detector{n_detector} = detect;
    end
end
detectors = cell(n_detector, 1);
for i = 1:n_detector
   detectors{i} = load(strcat(dir_det, '/', name_detector{i}));
end
for i = 1:n_pic
    pic = list_pic(i).name;
    fprintf(strcat(pic, '\n'));
    if size(pic, 2) > 4 && strcmp(pic(end-3:end), '.png')
        im = imread(strcat(dir_pic, '/', pic));
        dpm(pic(1:end-4), im, detectors);
    end
end