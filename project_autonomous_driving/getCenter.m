function center = getCenter(cloud, seg)
center = zeros(1, 3);
for i = 1:3
    center(i) = median(squeeze(cloud(seg, i)));
end
end