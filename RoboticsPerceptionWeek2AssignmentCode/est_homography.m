function [ H ] = est_homography(video_pts, logo_pts)
% est_homography estimates the homography to transform each of the
% video_pts into the logo_pts
% Inputs:
%     video_pts: a 4x2 matrix of corner points in the video
%     logo_pts: a 4x2 matrix of logo points that correspond to video_pts
% Outputs:
%     H: a 3x3 homography matrix such that logo_pts ~ H*video_pts
% Written for the University of Pennsylvania's Robotics:Perception course

% YOUR CODE HERE
H = [];
%xlogo=Hxvideo ��video map ��logo��
[num_pts,~]=size(video_pts);
A = [];
for i=1:num_pts
    x1=video_pts(i,1);
    x2=video_pts(i,2);
    x1_prime=logo_pts(i,1);
    x2_prime=logo_pts(i,2);
    row_x=[-x1,-x2,-1,0,0,0,x1*x1_prime,x2*x1_prime,x1_prime];
    row_y=[0,0,0,-x1,-x2,-1,x1*x2_prime,x2*x2_prime,x2_prime];
    A=[A;row_x;row_y];
end
[U, S, V] = svd(A);
h=V(:,end);
H = [h(1) h(2) h(3);h(4) h(5) h(6);h(7) h(8) h(9)];


end

