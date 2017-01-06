function pred = drawBox(image, imname, imset)
pred = combineBoxes(getData(imname, imset, 'loadpred'));
npred = size(pred, 1);
color = ['c', 'r', 'b'];
name = {'Cyclist', 'Car', 'Person'};

fg = figure;
imshow(image); hold on;
for i = 1:npred
    x1 = pred(i, 1);
    y1 = pred(i, 2);
    x2 = pred(i, 3);
    y2 = pred(i, 4);
    dir = pred(i, 5);
    type = pred(i, 7);
    line([x1 x1 x2 x2 x1]', [y1 y2 y2 y1 y1]', 'color', color(type), 'linewidth', 1.5, 'linestyle', '-'); hold on;
    text(x1, y1, strcat(name{type}), 'color', 'w', 'FontSize', 10, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom'); hold on;
end
hold off;
saveas(fg, strcat('data\',imset,'\results\', imname, '_label.jpg'));

end