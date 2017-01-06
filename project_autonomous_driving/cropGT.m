function out = cropGT(image,saveName,label)
% crop the ground road truth of the image.

gt = min((255 - label(:,:,1)) + label(:,:,3),255)/255;
temp = []; temp(:,:,1) = gt; temp(:,:,2)= gt; temp(:,:,3)= gt;
out = image.im .* uint8(temp);

fg = figure();
imshow(image.im .* uint8(temp))
title(saveName);
saveas(fg, strcat('data\report_img\',saveName,'_crop'), 'png');
end 