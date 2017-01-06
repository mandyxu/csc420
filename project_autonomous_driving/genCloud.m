function genCloud ()

direct = 'detection\';
direct_right = 'detection\right\';
name = 'um_000000';

left = imread(strcat(direct, name, '.png'));
right = imread(strcat(direct_right, name, '.png'));
calib = load(strcat(direct, name, '.txt'));
calib

end