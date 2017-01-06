function mod = shade (mask, edge)
[Y, X, Z] = size(mask);
mod = zeros(Y, X, Z);
for i = 1:Y
    for j = 1:X
        maskij = squeeze(mask(i, j, :));
        if sum(maskij) == 0
            mod(i, j, :) = [1 1 1];
        elseif isEdge(mask, i, j)
            mod(i, j, :) = [255 0 0];
        else
            mod(i, j, :) = maskij;
        end
    end
end
end