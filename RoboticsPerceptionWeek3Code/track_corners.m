function [ corners ] = track_corners(images, img_pts_init)
%TRACK_CORNERS 
% This function tracks the corners in the image sequence and visualizes a
% virtual box projected into the image
% Inputs:
%     images - size (N x 1) cell containing the sequence of images to track
%     img_pts_init - size (4 x 2) matrix containing points to initialize
%       the tracker
% Outputs:
%     corners - size (4 x 2 x N) array of where the corners are tracked to

corners = zeros(4,2,size(images,1));

%%%% INITIALIZATION CODE FOR TRACKER HERE %%%%

img_pts = img_pts_init; % img_pts is where you will store the tracked points
corners(:,:,1) = img_pts;
%%%%initialize(pointTracker,points,I)
%%%initializes points to track and sets the initial video frame. 
%%%The initial locations POINTS, must be an M-by-2 array of [x y] coordinates. 
%%%The initial video frame, I, must be a 2-D grayscale or RGB image and must be the same size and data type as the video frames passed to the step method.

%%%[points,point_validity] = step(pointTracker,I) 
tracker = vision.PointTracker('MaxBidirectionalError', 1);
initialize(tracker, img_pts_init, cell2mat(images(1)));

% Iterate through the rest of the images
for i = 2:size(images,1)
    %%%% CODE FOR TRACKING HERE %%%%
    % Store corners and visualize results (if desired)
    [img_pts,~]=step(tracker,cell2mat(image(i)));
    corners(:,:,i) = img_pts;
end

end

