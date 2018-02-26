function [RGBm] = matmultiply(img,M)

% Segment image to separate channels:
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

% Create transformation matrix:
Rm = M(1,:);
Gm = M(2,:);
Bm = M(3,:);

% Multiply input image with created matrix
RGBm = cat(3, Rm(1) * R + Rm(2) * G + Rm(3) * B, ...
              Gm(1) * R + Gm(2) * G + Gm(3) * B, ...
              Bm(1) * R + Bm(2) * G + Bm(3) * B);
          
          
end

