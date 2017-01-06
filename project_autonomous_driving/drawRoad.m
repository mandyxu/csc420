function drawRoad (im, predroad, out_file, numframe)
fg = figure('visible', 'off');
iptsetpref('ImshowBorder','tight')
imshow(im + cat(3, predroad, zeros([size(predroad) 2]))); hold off;
saveas(fg, strcat(out_file{1}, 'road_', out_file{2}, '.jpg'));
edges = roadEdges(im, predroad);
% for i = 1:numframe
%     height = size(im, 1);
%     level = round(height / 2 * (1 + i / numframe));
%     fg = figure('visible', 'off');
%     iptsetpref('ImshowBorder','tight')
%     highlight = highlightRoad(im, edges, level);
%     imshow(im + cat(3, zeros(size(predroad)), highlight, highlight)); hold off;
%     saveas(fg, strcat(out_file{1}, 'road_highlight_', out_file{2}, '_frame_', int2str(i), '.jpg'));
% end
close all;
end