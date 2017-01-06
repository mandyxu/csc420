function corner = ground_plane (predroad, cloud)
    sub_cloud = select(cloud, find(predroad));
    sub_pts = sub_cloud.Location;
    x0 = min(sub_pts((sub_pts(:, 3) < 10), :),[], 1);
    x1 = max(sub_pts((sub_pts(:, 3) < 10), :),[], 1);
    maxd = max(max(sub_pts(:, 3)));
    x2 = [x0(1:2) maxd];
    x3 = [x1(1:2) maxd];
    corner = [x0; x1; x2; x3; x0];
end