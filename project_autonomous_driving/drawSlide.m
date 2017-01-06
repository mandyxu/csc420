function drawSlide (im_name, slide_name, frame)

dir_pic = 'data/test/left/';
dir_res = 'frames/';
dir_slide = 'slides/';
im = imread(strcat(dir_pic, im_name, '.png.'));
[height, width, ~] = size(im);
bound = 20;
string = textscan(fopen(strcat(dir_slide, slide_name, '.txt')), '%s', 'Delimiter', '\n');
string = string{1};
if frame == 1
    total = 1
else
    total = 2 * frame;
end
for t = 1:total
    fg = figure('visible', 'off');
    iptsetpref('ImshowBorder', 'tight')
    imshow(im); hold on
    x0 = round(bound + (width / 2 - bound) / frame * (frame - min(t, frame)));
    x1 = width - x0;
    y0 = round(bound + (height / 2 - bound) / frame * (frame - min(t, frame)));
    y1 = height - y0;
    rectangle('Position', [x0, y0, x1 - x0, y1 - y0], 'FaceColor', 'w', 'EdgeColor', 'c', 'LineWidth', 3, 'Curvature', 0.2); hold on;
    if t >= frame
        text(4 * bound, height / 2, string, 'Color', 'b', 'FontName', 'Comic Sans MS', 'FontSize', 14, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle'); hold on;
    end
    hold off;
    saveas(fg, strcat(dir_res, slide_name, '_frame_' , int2str(t), '.jpg'));
    close all;
end

end