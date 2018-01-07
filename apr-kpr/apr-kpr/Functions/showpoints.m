function [  ] = showpoints(img,points)
img = double(img);
img(:)=mapminmax(img(:)',0,255)';
height = max(points(1:49))-min(points(1:49))+1;
thickness = height/100+1;
imshow(uint8(img));
for i=1:size(points,1)/2
    rectangle('Position',[points(i,1)-thickness/2,points(i+49)-thickness/2,thickness,thickness],'Curvature',[1,1],  'FaceColor','g','EdgeColor','g'); 
end


