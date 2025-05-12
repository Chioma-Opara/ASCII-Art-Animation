% Chioma Opara
% MTH 261
% Final Prject: Animated ASCII Art Generator with synchronized audio
% Date: April 29, 2025  

% This script runs an animated ASCII Art sequence with synchronized audio.  
% The user provides an image, which is converted into ASCII characters  
% and animated using a series of visual effects (scrolling, dancing, wave, etc.).  
% Each animation is accompanied by an audio clip matched to its style.  
% Transition sounds are added between animation segments to create a seamless, cohesive experience.  
% The final animation sequence can be replayed multiple times

% Main animation call:  
% - 'image.jpg' is the input image to be converted to ASCII and animated.  
% - 'flowerpot2.jpg' is the optional second image used in the transition effect.  
% - 1 is an optional replay argument. Causes the video to loop once
% The function animateAsciiShow runs a series of modular animation effects  
% in one figure window to create a cohesive ASCII animation experience.

animateAsciiShow('image.jpg', 'flowerpot2.jpg', 1)
