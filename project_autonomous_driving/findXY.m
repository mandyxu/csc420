function coord = findXY(iy, ix, z, py, px, f)
coord = [(ix - px) * z / f,  (iy - py) * z / f, z];
end