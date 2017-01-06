function points = genRndPts (n, normal, bounds, sigma)
incr = (bounds(2, :) - bounds(1, :)) / n;
[~, dir] = max(abs(normal(1:3)));
if (dir == 1)
    [y, z] = meshgrid(bounds(1, 1):incr(1):bounds(2, 1), bounds(1, 2):incr(2):bounds(2, 2));
    x = findX(normal, y, z) + normrnd(0, sigma, [n + 1, n + 1]);
elseif (dir == 2)
    [x, z] = meshgrid(bounds(1, 1):incr(1):bounds(2, 1), bounds(1, 2):incr(2):bounds(2, 2));
    y = findY(normal, x, z) + normrnd(0, sigma, [n + 1, n + 1]);
elseif (dir == 3)
    [x, y] = meshgrid(bounds(1, 1):incr(1):bounds(2, 1), bounds(1, 2):incr(2):bounds(2, 2));
    z = findZ(normal, x, y) + normrnd(0, sigma, [n + 1, n + 1]);
end
points = [reshape(x, [], 1) reshape(y, [], 1) reshape(z, [], 1)];
end