function z = corner_b(img)
%a function to detect slopes of lines used to make the rock after fitting
%to a polygon. This also gives the corners of polygon.
% 
% input - rock image
% output- slopes, coordinates of corners


%convert image to gray and binary
img = rgb2gray(img);
img = im2bw(img);
figure, imshow(img)

%to trace boundary of image
A_bound = bwtraceboundary(img,[385,670],'NE');

%as image is mirror image , this is used to correct the image
temp = A_bound(:,1);
A_bound(:,1) = A_bound(:,2);
A_bound(:,2) = -temp;

%used to form a delaunay triangle with points which is used by convex hull
DT = delaunayTriangulation(A_bound(:,1),A_bound(:,2));

k = convexHull(DT);

x = DT.Points(k,1);
y = DT.Points(k,2);


%used to reduce the corners
[LATOUT,LONOUT] = reducem(x,y,10);

%size(LATOUT)

LATOUT = -LATOUT;
LONOUT = LONOUT;

figure, plot(LATOUT,LONOUT)