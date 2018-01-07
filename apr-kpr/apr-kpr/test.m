%% Matlab R2014a
clear;close all;
%% loading model
addpath('Functions');
feature=zeros(6076,1);
fitting_model='models/APR-KPR.mat';
ourModel = load(fitting_model); 
image_path='./test_images/';
img_list=dir([image_path,'*.jpg']);
%% the parameter 'iterTimes' can be set to 3 or 6, it means 2apr-1kpr or 2apr-1kpr-2apr-1kpr.
iterTimes = 6;
%% main loop
for i=1:size(img_list,1)
    imgname = [image_path img_list(i).name];
    test_image = im2single(imread(imgname));
    faceDetector = vision.CascadeObjectDetector();
    bbox = step(faceDetector, test_image); 
    % testing all face boxes given by the face detector in one image
    for ii=1:size(bbox,1)
        ii
        test_init_shape = InitShape(bbox(ii,:),ourModel.refShape);
        shape = fitting_GC_CLR(test_image,bbox(ii,:),test_init_shape,ourModel.Model,iterTimes);
        showpoints(test_image,shape);
        rectangle('Position',bbox(ii,:),'LineWidth',1,'Edgecolor','g');
        pause;
    end
end