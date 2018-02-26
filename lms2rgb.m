function [RGB] = lms2rgb(img)

% Ensure linear RGB:
img = im2double(img);

% Transformation matrix sRGB to LMS:
Rm = [5.47221206, -4.6419601, 0.16963708];
Gm = [-1.1252419, 2.29317094, -0.1678952];
Bm = [0.02980165, -0.19318073, 1.16364789];

% Segment image to separate channels:
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

% Multiply input image with created matrix
RGB = cat(3, Rm(1) * R + Rm(2) * G + Rm(3) * B, ...
              Gm(1) * R + Gm(2) * G + Gm(3) * B, ...
              Bm(1) * R + Bm(2) * G + Bm(3) * B);

          
end

