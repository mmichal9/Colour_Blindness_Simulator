function [newCol] = coltrans(img,type)

% Ensure linear RGB:
img = im2double(img);

lmsred = rgb2lms(cat(3, [1],[0],[0]));
% lmsgreen = rgb2lms(cat(3, [0],[1],[0]));
lmsblue = rgb2lms(cat(3, [0],[0],[1]));
lmswhite = rgb2lms(cat(3, [1],[1],[1]));

% Calculations based on:
% http://ixora.io/projects/colorblindness/color-blindness-simulation-research/
% http://vision.psychol.cam.ac.uk/jdmollon/papers/colourmaps.pdf
% format of the calculations:
% for R:           for G:                 for G:
% | l |   |0,A,B|       | l |   |1,0,0|       | l |   |1,0,0|
% | m | * |0,1,0|       | m | * |A,0,B|       | m | * |0,1,0|
% | s |   |0,0,1|       | s |   |0,0,1|       | s |   |A,b,0|

switch type
    case 'Protanopia'
        % Protanopia:
        A = [lmsblue(1),lmswhite(1)];
        A = A';
        B = [lmsblue(2),lmsblue(3);lmswhite(2),lmswhite(3)];
        EqProt = B\A;
        
        % Protanopia Matrix:
        ProtR = [0, EqProt(1), EqProt(2)];
        ProtG = [0, 1, 0];
        ProtB = [0, 0, 1];
        M = [ProtR;ProtG;ProtB];
        
    case 'Deuteranopia'
        % Deuteranopia:
        A = [lmsblue(2),lmswhite(2)];
        A = A';
        B = [lmsblue(1),lmsblue(3);lmswhite(1),lmswhite(3)];
        EqDeut = B\A;

        % Deuteranopia Matrix:
        DeutR = [1, 0, 0];
        DeutG = [EqDeut(1), 0, EqDeut(2)];
        DeutB = [0, 0, 1];
        M = [DeutR;DeutG;DeutB];
        
    case 'Tritanomaly'
        %Tritanomaly
        A = [lmsred(3),lmswhite(3)];
        A = A';
        B = [lmsred(1),lmsred(2);lmswhite(1),lmswhite(2)];
        EqTrit = B\A;

        % Tritanomaly Matrix:
        TritR = [1,0,0];
        TritG = [0, 1, 0];
        TritB = [EqTrit(1), EqTrit(2), 0];
        M = [TritR;TritG;TritB];
        
    otherwise
        %return basic Matrix:
        M = [1,0,0;0,1,0;0,0,1];
        disp('Incorect color transformation name')
end

% Convert and show output:
newCol = matmultiply(img,M);
imshow(newCol);
end





