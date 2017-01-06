function draw3DBox (im, pred, corners, centers, calib, out_file, n_frame)
pred = boundIndex(pred, size(im));
npred = size(pred, 1);
color = {'g', 'r', 'g', 'm', 'b'};
label = {'Cyclist', 'Car', 'Unknown', 'Unkown', 'Person'};
for t = 1:n_frame
    fg = figure('visible', 'off');
    iptsetpref('ImshowBorder','tight')
    imshow(im); hold on
    for i = 1:npred
        if centers(i,2) > 0
            
            type = pred(i, 7);
            corner = boundIndex3D(proj2photo(calib, corners{i}), size(im));
            x1 = double(min(corner(:, 1)));
            y1 = double(min(corner(:, 2)));
            mid = corners{i} * t / n_frame + centers(i, :) * (1 - t / n_frame);
            % mid = corners{i};
            corner = boundIndex3D(proj2photo(calib, mid), size(im));
            line(corner(:, 1), corner(:, 2), 'Color', color{type}, 'Linewidth', 1.5, 'Linestyle', '-'); hold on;

            text(x1, y1, strcat(label{type}, ''), 'Color', 'c', 'FontName', 'Comic Sans MS', 'FontSize', 15, 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom'); hold on;
    
        end
    end
    hold off;
    saveas(fg, strcat(out_file{1}, 'bound_', out_file{2}, '_frame_', int2str(t), '.jpg'));
    close all;
end

end