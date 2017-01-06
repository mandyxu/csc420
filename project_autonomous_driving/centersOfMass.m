function [com, seg] = centersOfMass(cloud, pred)
% pred is a n x 7 array with [x_left, y_top, x_right, y_bottom, ID, score, type]
% type 1 = cyclist, type 2 = car, type 3 = person

% default dimensions of cyclist, car and person
defDim = [2 1 2; 5 2 2; 0.5 0.5 2];
[n, ~] = size(pred);
[Y, X, ~] = size(cloud);
com = zeros(n, 3);
seg = zeros(Y, X, 3);
for i = 1:n
    boxi = squeeze(boundIndex(pred(i, 1:4), [Y, X]));
    [comi, segi] = centerOfMass(getBox(cloud, boxi), pred(i, 5), defDim(pred(i, 7), :));
    com(i, :) = comi;
    seg(boxi(2):boxi(4), boxi(1):boxi(3), pred(i, 7)) = max(squeeze(seg(boxi(2):boxi(4), boxi(1):boxi(3), pred(i, 7))), segi);
end
end 