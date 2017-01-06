function pred = drawbbox(imname)
img = getData(imname,'test','left-plot'); hold on
pred = getData(imname,'test','loadpred');
% image(img);hold on
showboxes('cyclist',img,pred.cyclist,'c');
showboxes('car',img,pred.car,'r');
showboxes('person',img,pred.person,'b');
end 