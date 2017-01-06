fg = figure
surf(peaks)
axis vis3d
for i=1:36
   camorbit(10,0,'data')
   drawnow
   % saveas(fg, strcat(int2str(i), '_angle.jpg'));
end