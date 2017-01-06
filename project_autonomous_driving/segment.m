function seg = segment(cloud, center, dim)
seg = logical(prod(abs(cloud(:, 1:3) - center) < dim, 2));
end