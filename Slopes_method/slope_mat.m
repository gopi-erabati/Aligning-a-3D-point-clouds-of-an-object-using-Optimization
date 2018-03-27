function slope_mat(slope1,slope2,LATOUT1,LANOUT1,LATOUT2,LANOUT2)
This function takes slopes and corners of two images and merge them

m = size(slope1,2);
%to calculate similarity matrix basing on slops
for i = 1:m
    for j = 1:m
        A(i,j) = abs(slope1(i) - (slope2(j)));   
    end
end

%to find the minimum of similarity error
min_slope = min(min(A));

% to find the index of error point to get corresponding
%lines in the two images
for i = 1:m
    for j = 1:m
        if A(i,j) == min_slope;
            idx_i = i
            idx_j = j
        end       
    end
end

%to plot two image boundaries before merging
x = [LATOUT1 LATOUT2];
y = [LANOUT1 LANOUT2];
figure, plot(x,y)

% A = [LATOUT2(3) LANOUT2(3) 1;
%     LATOUT2(4) LANOUT2(4) 1];
% 
% B=  [LATOUT1(1); LATOUT1(6) ];
% 
% a = pinv(A)*B
% 
% B_ = [LANOUT1(1);LANOUT1(6)];
% 
% b = pinv(A)*B_
% 
% A_ = [LATOUT2(1) LANOUT2(1) 1;
%     LATOUT2(2) LANOUT2(2) 1;
%     LATOUT2(3) LANOUT2(3) 1;
%     LATOUT2(4) LANOUT2(4) 1;
%     LATOUT2(5) LANOUT2(5) 1;
%     LATOUT2(6) LANOUT2(6) 1;];
% 
% x_ = A_ * a;
% 
% y_ = A_ * b;
% 
% T = affine2d([a b [0 0 1]']);
% imt = imtransform([LATOUT2 LANOUT2],T);
% 
% xx = [LATOUT1' imt(:,1)];
% yy = [LANOUT1' imt(:,2)];
% figure, plot(xx,yy) 

% to megre two boundaries basing on slopes
xx = LATOUT2(1)-LATOUT1(3) ;
yy = LANOUT2(1)-LANOUT1(3);
    
% LATOUT2(1) = LATOUT1(3);
% LANOUT2(1) = LANOUT1(3);

LATOUT2 = LATOUT2 - xx;
LANOUT2 = LANOUT2 - yy;

LATOUT2(6) = LATOUT1(4);
LANOUT2(6) = LANOUT1(4);


%to display merged boundaries
x = [LATOUT1 LATOUT2];
y = [LANOUT1 LANOUT2];
figure, plot(x,y,'-b')





    