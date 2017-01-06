function seg = drawSegment(image, imname, pred, com, seg)
f1 = figure;
imshow(double(image) .* shade(seg) / 255); hold on
n = size(pred, 1);
for i = 1:n
    midx = (pred(i, 1) + pred(i, 3))/2;
    midy = (pred(i, 2) + pred(i, 4))/2;
    text(midx, midy, strcat('  (', num2str(round(com(i, 1))), ', ', num2str(round(com(i, 2))), ', ', num2str(round(com(i, 3))), ')'), 'color', 'w', 'FontSize', 10, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom'); hold on;
    rectangle('Position', [midx midy 10 10], 'Curvature', [1,1], 'FaceColor', 'w'); hold on;
end
hold off;
saveas(f1,strcat('results/', imname, '_seg.jpg'));
end