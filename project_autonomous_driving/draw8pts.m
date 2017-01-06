function draw8pts(points)
% points is an 8x2 dimensional vector
if size(points,2) == 2
    square1 = [points(1:4,:); points(1,:)];
    square2 = [points(5:8,:); points(5,:)];
    plot(square1(:,1),square1(:,2),'c');hold on
    plot(square2(:,1),square2(:,2),'c');hold on

    for i = 1:4
        plot([points(i,1) points(i+4,1)],[points(i,2) points(i+4,2)],'c');hold on
        text(points(i,1),points(i,2),int2str(i));
        text(points(i+4,1),points(i+4,2),int2str(i+4));
    end 
else
    square1 = [points(1:4,:); points(1,:)];
    square2 = [points(5:8,:); points(5,:)];
    plot3(square1(:,1),square1(:,2),square1(:,3),'c');hold on
    plot3(square2(:,1),square2(:,2),square2(:,3),'c');hold on

    for i = 1:4
        plot3([points(i,1) points(i+4,1)],[points(i,2) points(i+4,2)],[points(i,3) points(i+4,3)],'c');hold on
        text(points(i,1),points(i,2),int2str(i));
        text(points(i+4,1),points(i+4,2),int2str(i+4));
    end 
end
end