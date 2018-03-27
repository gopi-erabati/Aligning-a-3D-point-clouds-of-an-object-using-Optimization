function [slope,LATOUT,LONOUT] = corner_c(img)
%a function to detect slopes of lines used to make the rock after fitting
%to a polygon. This also gives the corners of polygon.
% 
% input - rock image
% output- slopes, coordinates of corners


%convert image to gray and binary
img = rgb2gray(img);
img = im2bw(img);

%to trace boundary of image
A_bound = bwtraceboundary(img,[208,619],'E');

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
[LATOUT,LONOUT] = reducem(x,y,30)

figure, plot(LATOUT,LONOUT)

m = size(LATOUT,1);

% to claculate slope of lines
for i =1 :m-1
    slope(i) = (LONOUT(i+1) - LONOUT(i))/(LATOUT(i+1)-LATOUT(i));
end




