function corners = cloudEdges (cloud)
maxs = max(cloud);
mins = min(cloud);
if prod(size(maxs) > [0 2])
    maxs(2) = max(mins(2) + 1.5, maxs(2));
    x000 = [mins(1) mins(2) mins(3)];
    x001 = [mins(1) mins(2) maxs(3)];
    x010 = [mins(1) maxs(2) mins(3)];
    x011 = [mins(1) maxs(2) maxs(3)];
    x100 = [maxs(1) mins(2) mins(3)];
    x101 = [maxs(1) mins(2) maxs(3)];
    x110 = [maxs(1) maxs(2) mins(3)];
    x111 = [maxs(1) maxs(2) maxs(3)];
    corners = [x000; x001; x011; x010; x000; x100; x101; x001; x011; x111; x101; x100; x110; x010; x110; x111];
else
    corners = [0 0 0];
end
end