pt3d = [-10 5 100; 10 5 100; 10 5 300; -10 5 300; -10 5 100];

pt2d = proj2photo(calib, pt3d);
imshow(image.im);hold on
plot(pt2d(:,1),pt2d(:,2),'LineWidth',4);
