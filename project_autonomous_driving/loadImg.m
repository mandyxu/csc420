function im = loadImg(path, grayscale, c)
% path is the path of the image; 
% grayscale is a boolean - true=grayscaled; false=rgb
% c is the resize ratio - 1={keep the original size of the image}

    im = imread(path);
    if c ~= 1
        im = imresize(im, c);
    end 
    if grayscale
        im = double(rgb2gray(im))/255; %might not need to /255 sometimes 
    else 
        im = double(im)/255;
    end 
%     im = normalize(im, 0, 1);
end 