% Chioma Opara
% Project 1: Manipulating images using matrix operations
% Feb 14, 2025
%
%
% Description:
% This script loads a color image and applies various image processing 
% techniques using matrix operations. Techniques include grayscale 
% conversion, color filtering (sepia, hue rotation, custom filters), 
% brightness adjustments, flipping, cropping, and color transformations.
% It also explores the reversibility of matrix transformations and 
% assembles a Warhol-style image.


%% Section 2: Load Image and Basic Preprocessing
ImJPG = imread('image.jpg'); % read in the image as an array
[m, n, l] = size(ImJPG); % check the dimensions of the array

% Finding range of colours in image
maxImJPG = max(max(ImJPG));
minImJPG = min(min(ImJPG));

% Show original image
figure, imshow(ImJPG), title('original');

%% Section 3.1: Extracting the RGB channels
ImJPG_R = ImJPG(:, :, 1);
ImJPG_G = ImJPG(:, :, 2);
ImJPG_B = ImJPG(:, :, 3);

%Section 3.2: Displaying the gray scale image
GrayMatrix = [1/3 1/3 1/3; 1/3 1/3 1/3; 1/3 1/3 1/3]; % filter matrix
for i= 1:m
    for j=1:n
        PixelColor = reshape(double(ImJPG(i, j, :)), 3, 1);
        ImJPG_Gray(i, j, :) = uint8(GrayMatrix * PixelColor);
    end 
end
imshow(ImJPG_Gray), title('ImJPG-gray');

%% Section 3.3:Sepia Matrix
SepiaMatrix = [.393 .769 .189; .349 .686 .168; .272 .534 .131]; % filter matrix
for i= 1:m
    for j=1:n
        PixelColor = reshape(double(ImJPG(i, j, :)), 3, 1);
        ImJPG_Sepia(i, j, :) = uint8(SepiaMatrix * PixelColor);
    end 
end
imshow(ImJPG_Sepia), title('Sepia');

%% Section 3.4: Red Channel Only Filter
filterMatrix = [1 0 0; 0 0 0; 0 0 0];
for i= 1:m
    for j=1:n
        PixelColor = reshape(double(ImJPG(i, j, :)), 3, 1);
        ImJPG_filter(i, j, :) = uint8(filterMatrix * PixelColor);
    end 
end
imshow(ImJPG_filter), title('red-filter');

%% Section 3.5: Color Channel Swapping Filter
filterMatrix2 = [0 0 1; 0 1 0; 1 0 0];
for i= 1:m
    for j=1:n
        PixelColor = reshape(double(ImJPG(i, j, :)), 3, 1);
        ImJPG_filter2(i, j, :) = uint8(filterMatrix2 * PixelColor);
    end 
end
imshow(ImJPG_filter2), title('color-swapping');

%% Section 3.6: Experimenting with hue rotation 
theta = 180;
A = [.213 .715 .072; .213 .715 .072; .213 .715 .072];
B = cos(theta) * [.787 -.715 -0.072; -.213 .285 -.072; -.213 -.715 .928];
C = sin(theta) * [.213 -.715 .928; .143 .140 -.283; -.787 .715 .072];

filterMatrix3 = A + B + C;
for i= 1:m
    for j=1:n
        PixelColor = reshape(double(ImJPG(i, j, :)), 3, 1);
        ImJPG_filter3(i, j, :) = uint8(filterMatrix3 * PixelColor);
    end 
end
imshow(ImJPG_filter3), title('hue-rotation');

%% Section 3.7

filterMatrix4 = [0 0 0.75; 0 0.5 0; 0.75 0 0];
% Note on this filter:
% Row 1: the red channel comes with the intensity of blue in the original
% Row 2: Green is muted
% Row 3: blue channel comes with intensity of red

for i= 1:m
    for j=1:n
        PixelColor = reshape(double(ImJPG(i, j, :)), 3, 1);
        ImJPG_filter4(i, j, :) = uint8(filterMatrix4 * PixelColor);
    end 
end
imshow(ImJPG_filter4), title('custom-color-transformation');
%% Section 3.8: Other Matrix-Based Transformations
ImJPG1 = ImJPG(100:m - 100, 100: n-70);  % kinda crops and turns it to grayscale. Could use in 4.2 
ImJPG_flip = flip(ImJPG);
ImJPG_90 = rot90(ImJPG); 
ImJPG255 = 255-ImJPG;
ImJPG50 = ImJPG-50;
ImJPG_uint = uint8(1.25 * ImJPG);

figure, imshow(ImJPG1), title('Cropped');
figure, imshow(ImJPG_flip), title('Flipped');
figure, imshow(ImJPG_90), title('Rotated 90°');
figure, imshow(ImJPG255), title('255-ImJPG');
figure, imshow(ImJPG50), title('ImJPG-50');
figure, imshow(ImJPG_uint), title('ImJPG-uint');

%%%% do: 
imshow(flip(rgb2gray(ImJPG)')')

%% Section 3.9: Filter matrix to delete a colour in the image
filterMatrix5 = [0 0 0; 0 1 0; 0 0 1];    % this matrx deletes the red channel from image
for i= 1:m
    for j=1:n
        PixelColor = reshape(double(ImJPG(i, j, :)), 3, 1);
        ImJPG_filter5(i, j, :) = uint8(filterMatrix5 * PixelColor);
    end 
end
imshow(ImJPG_filter5);

%%%%% Part 4: Exercises
%% Section 4.1: Applying and Reversing Color Transformation
transformationMatrix = [.7 .15 .15; .15 .7 .15; .15 .15 .7];
for i= 1:m
    for j=1:n
        PixelColor = reshape(double(ImJPG(i, j, :)), 3, 1);
        ImJPG_transformed(i, j, :) = uint8(transformationMatrix * PixelColor);
    end 
end
imshow(ImJPG_transformed);

% Applying the inverse of transformationMatrix to transformed image
transformation_inv = inv(transformationMatrix);
for i= 1:m
    for j=1:n
        PixelColor = reshape(double(ImJPG_transformed(i, j, :)), 3, 1);
        ImJPG_transformedInv(i, j, :) = uint8(transformation_inv * PixelColor);
    end 
end
imshow(ImJPG_transformedInv);

%% Section 4.2: Warhol-Style Images

% Warhol Image 1: 
warholMatrix1 = [ImJPG, ImJPG_filter4; ImJPG_transformed, ImJPG_Sepia];
figure, imshow(warholMatrix1), title('warhol1');

% Warhol Image 2: 
warholMatrix2 = [ImJPG, ImJPG50; ImJPG255, ImJPG_flip];
figure, imshow(warholMatrix2), title('warhol2');

% Warhol Image 3: 
warholMatrix3 = [ImJPG, ImJPG_uint; ImJPG_filter2, ImJPG_Gray];
figure, imshow(warholMatrix3), title('warhol3');