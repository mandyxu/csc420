function out = roadEdges (im, predroad)
level = size(im, 1);
prev_first = 1;
prev_last = size(im, 2);
pertor = 0.05;
maxdist = 20;
out = zeros(level, 2);
for i = level:-1:1
    current = squeeze(predroad(i, :));
    tor = min(1, round(numel(current) * pertor));
    firstt = find(current, tor);
    lastt = find(current, tor, 'last');
    if size(firstt, 2) < tor
        first = prev_first;
        last = prev_last;
    else
        first = firstt(tor);
        last = lastt(tor);
    end
    if i < level
        if first - prev_first > maxdist
            first = prev_first;
        end
        if last - prev_last > maxdist
            last = prev_last;
        end
        first = round((first + prev_first) / 2);
        last = round((last + prev_last) / 2);
    end
    out(i, :) = [first last];
    prev_first = first;
    prev_last = last;
end
end