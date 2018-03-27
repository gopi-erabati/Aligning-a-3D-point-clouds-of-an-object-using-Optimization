function sameref(Img_c,Img_a)
%This function takes two images and find boundaries and merge them basing
% %on slopes.
% example
% sameref(Img_c,Img_a)

%to find slopes and corners
[slope1,LATOUT1,LANOUT1] = corner_c(Img_c);
[slope2,LATOUT2,LANOUT2] = corner_a(Img_a);

%to merge two images
slope_mat(slope1,slope2,LATOUT1,LANOUT1,LATOUT2,LANOUT2);