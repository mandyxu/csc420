function draw2DBox (im, pred, centers, out_file, frame)

pred = boundIndex(pred, size(im));
npred = size(pred, 1);
color = {'g', 'r', 'g', 'm', 'b'};
label = {'Cyclist', 'Car', 'Unknown', 'Unkown', 'Person'};
for t = 1:frame
    fg = figure('visible', 'off');
    iptsetpref('ImshowBorder','tight')
    imshow(im); hold on
    for i = 1:npred
        if centers(i,2) > 0
            x1 = pred(i, 1);
            y1 = pred(i, 2);
            x2 = pred(i, 3);
            y2 = pred(i, 4);
            type = pred(i, 7);
            xm = x1 + (x2 - x1) / frame * t;
            line([x1 x1 xm xm x1]', [y1 y2 y2 y1 y1]', 'Color', color{type}, 'Linewidth', 1.5, 'Linestyle', '-'); hold on;
            text(x1, y1, strcat(label{type}, ''), 'Color', 'c', 'FontName', 'Comic Sans MS', 'FontSize', 15, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom'); hold on;
            text((x1 + x2) / 2, (y1 + y2) / 2, strcat('(', int2str(round(centers(i, 1))), ',', int2str(-round(centers(i, 2))), ',', int2str(round(centers(i, 3))), ')'), 'Color', 'c', 'FontName', 'Comic Sans MS', 'FontSize', 8, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle'); hold on;
    
        end
    end 
    hold off;
    saveas(fg, strcat(out_file{1}, 'label_', out_file{2}, '_frame_' , int2str(t), '.jpg'));
    close all;
end

end