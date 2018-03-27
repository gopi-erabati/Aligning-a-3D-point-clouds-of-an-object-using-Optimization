% This ocde is used to merge the three given pointclouds of a rock
% using ICP with pre alignment process

%loading of pointclouds
a_pc = pcread('a_pc.ply');
b_pc = pcread('c_pc.ply');
c_pc = pcread('b_pc.ply');

%downsamplping of point clouds B and A
gridSize = 0.1;
fixed = pcdownsample(b_pc, 'gridAverage', gridSize);
moving = pcdownsample(a_pc, 'gridAverage', gridSize);

%initial alignement of point clouds
tform = affine3d([1 0 0 0 ;0 1 0 0 ; 0 0 1 0; 20 -100 0 1]);
moving = pctransform(moving,tform);

%registration of point clouds using ICP
tform = pcregrigid(moving, fixed, 'Metric','pointToPoint','InlierRatio',0.1);
ptCloudAligned = pctransform(moving,tform);


ptCloudScene = ptCloudAligned;
%for third cloud 
%%downsamplping of point clouds C and previous result
gridSize = 0.1;
fixed = pcdownsample(ptCloudScene, 'gridAverage', gridSize);
moving = pcdownsample(c_pc, 'gridAverage', gridSize);

%initial alignment of the third cloud
tform = affine3d([1 0 0 0 ;0 1 0 0 ; 0 0 1 0; -70 -80 0 1]);
moving = pctransform(moving,tform);

%registration of point clouds using ICP
tform = pcregrigid(moving, fixed, 'Metric','pointToPoint','InlierRatio',0.1);
ptCloudAligned = pctransform(moving,tform);


% Visualize the input images.
figure
showPointCloud(ptCloudAligned); hold on;
showPointCloud(b_pc); hold on;
showPointCloud(ptCloudScene); hold on;

