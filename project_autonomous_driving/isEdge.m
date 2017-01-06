function out = isEdge(box, y, x)
[Y, X, ~] = size(box);
radius = 2;
out = 0;
for i = 1:3
    surround = squeeze(box(max(1, y - radius):min(Y, y + radius), max(1, x - radius):min(X, x + radius), i));
    if max(max(surround)) ~= min(min(surround))
        out = 1;
    end
end
end