function [LMS] = rgb2lms(img)

% Ensure linear RGB:
img = im2double(img);

% Transformation matrix sRGB to LMS:
Rm = [0.31399022, 0.63951294, 0.04649755];
Gm = [0.15537241, 0.75789446, 0.08670142];
Bm = [0.01775239, 0.10944209, 0.87256922];

% Segment image to separate channels:
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

% Multiply input image with created matrix
LMS = cat(3, Rm(1) * R + Rm(2) * G + Rm(3) * B, ...
              Gm(1) * R + Gm(2) * G + Gm(3) * B, ...
              Bm(1) * R + Bm(2) * G + Bm(3) * B);

          
end

