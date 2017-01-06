function out = combineBoxes (pred)
ncyclist = size(pred.cyclist, 1);
ncar = size(pred.car, 1);
nperson = size(pred.person, 1);
out = [[pred.cyclist ones(ncyclist, 1)]; [pred.car ones(ncar, 1) * 2]; [pred.person ones(nperson, 1) * 3]];
end