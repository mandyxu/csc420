function newbox = boundIndex(box, size)
% box: four coordinates; size: the size of the image 
newbox = box;
newbox(:, 1) = max(round(newbox(:, 1)), 1);
newbox(:, 2) = max(round(newbox(:, 2)), 1);
newbox(:, 3) = min(round(newbox(:, 3)), size(2));
newbox(:, 4) = min(round(newbox(:, 4)), size(1));
end