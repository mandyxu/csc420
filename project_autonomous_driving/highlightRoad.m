function out = highlightRoad (im, edges, level)
height = size(im, 1);
level = min(level, height);
if level < 0
    level = size(im, 1);
end
newroad = zeros(size(im, 1), size(im, 2));
for i = round(height/2):level
    first = round(edges(i, 1));
    last = round(edges(i, 2));
    newroad(i, first:last) = 255 * (i - height / 2) / (level - height / 2);
end
out = uint8(newroad);
end