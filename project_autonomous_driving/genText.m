function genText(pred, com)
n = size(pred, 1);
counts = zeros(1, 3);
norms = zeros(1, n);
minDist = 100;
minLoc = zeros(1, 3);
minType = 2;
types = {'cyclist', 'car', 'person'};
for i = 1:n
    counts(pred(i, 7)) = counts(pred(i, 7)) + 1;
    norms(i) = norm(com(i, :));
    if minDist > norms(i)
        minDist = norms(i);
        minLoc = com(i, :);
        minType = pred(i, 7);
    end
end
if minLoc(1) < 0
    fprintf('There is a %s %0.1f meters %s \n', types{minType}, -minLoc(1), 'to your left.');
else
    fprintf('There is a %s %0.1f meters %s \n', types{minType}, minLoc(1), 'to your right.');
end
fprintf('It is the CLOSEST to you and it is %0.1f meters away from you. \n', minDist);
fprintf('There is a TOTAL of %s cyclists, %s cars, and %s people in front of you.\n', num2str(counts(1)), num2str(counts(2)), num2str(counts(3)));
for i = 1:n
    if com(i, 1) < 0
        fprintf('There is a %s %0.1f meters %s \n', types{pred(i, 7)}, -com(i, 1), 'to your left.');
    else
        fprintf('There is a %s %0.1f meters %s \n', types{pred(i, 7)}, com(i, 1), 'to your right.');
    end
    fprintf('It is %0.1f meters away from you. \n', norms(i));
end
end 
