function dpm(filename, im, models)
thres = -1;
result = [];
f = 1.5;
imr = imresize(im, f); % if we resize, it works better for small objects
fig = figure;
image(im); hold on;
n_models = size(models, 1);
for i = 1:n_models;
    % detect objects
    model = models{i}.model;
    try
        [ds, bs] = imgdetect(imr, model, thres); % you may need to reduce the threshold if you want more detections
        nms_thresh = 0.5;
        top = nms(ds, nms_thresh);
        if model.type == model_types.Grammar
            bs2 = [ds(:,1:4) bs];
        else
            bs2 = bs;
        end
        if ~isempty(ds)
            ds(:, 1:end-2) = ds(:, 1:end-2)/f;
            bs2(:, 1:end-2) = bs2(:, 1:end-2)/f;
        end;
        if ~isempty(bs2)
           showboxes(int2str(i), im, reduceboxes(model, bs2(top,:)), 'r');
        end
        ds = ds(top, :);
        ds2 = [ds ones(size(ds, 1), 1) * i];
    catch 
        ds2 = [];
    end
    result = [result; ds2];
end
saveas(fig, strcat(filename,'_bbox.jpg'))
path = strcat(filename, '_results.mat');
save(path, 'result');
hold off;
close all;
end 