function disparityMap = findDisparity(imname, imset)
left = imread(strcat(pwd,'\data\',imset,'\left\',imname,'.png'));
right = imread(strcat(pwd,'\data\',imset,'\right\',imname,'.png'));

disparityRange = [0 16*15];
disparityMap = disparity(rgb2gray(left),rgb2gray(right),'BlockSize',15,'DisparityRange',disparityRange)/disparityRange(2);

imshow(disparityMap);
colormap jet;
imwrite(disparityMap,strcat('data\',imset,'\results\',imname,'_left_disparity.png'));

end 