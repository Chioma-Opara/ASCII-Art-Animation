% Chioma Opara  
% Project 1 (Free Section): Animated ASCII Art Generator  
% Date: Feb 14, 2025  

% Description:  
% This script runs an animated ASCII Art sequence.  
% The user provides an image, which is converted into ASCII characters  
% and animated using a series of visual effects (scrolling, dancing, wave, etc.).  
% Optionally, the animation can transition into a second image.  

% Main animation call:  
% - 'image.jpg' is the input image to be converted to ASCII and animated.  
% - 'flowerpot2.jpg' is the optional second image used in the transition effect.  
% - 3 is an optional replay argument. Causes the video to loop three times
% The function animateAsciiShow runs a series of modular animation effects  
% in one figure window to create a cohesive ASCII animation experience.

animateAsciiShow('image.jpg', 'flowerpot2.jpg', 3)
