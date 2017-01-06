function newbox = boundIndex3D(box, size)
% box: four coordinates; size: the size of the image 
newbox = box;
newbox(:, 1) = min(max(round(newbox(:, 1)), 1), size(2));
newbox(:, 2) = min(max(round(newbox(:, 2)), 1), size(1));
end