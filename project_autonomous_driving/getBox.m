function sub = getBox (cloud, box)
bounds = boundIndex(box, size(cloud));
sub = cloud(bounds(2):bounds(4), bounds(1):bounds(3), :);
end