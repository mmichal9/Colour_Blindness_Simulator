% Tis is a small Matlab scrip that implements matrix manipulation for  for color blindnes simulation.

% This scrip is based on arcicla found on:
% http://ixora.io/projects/colorblindness/color-blindness-simulation-research/
% http://vision.psychol.cam.ac.uk/jdmollon/papers/colourmaps.pdf

% Curentry available Color blindnes simulations:
% 'Protanopia'
% 'Deuteranopia'
% 'Tritanomaly'

% Pleace run the following code to test the code :
img = imread('img/img1.jpg');
newImg = coltrans(img, 'Protanopia');