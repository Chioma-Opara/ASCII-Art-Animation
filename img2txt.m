function outputTxtFile = img2txt(imfile,varargin);
%IMG2TXT Converts an image to ASCII text and returns output file nae
%
%   img2txt(imfile) converts the image contained in the specified file
%                   using an ASCII character for every pixel in x-dimension
%   img2txt(imfile,stepx) converts the image contained in the specified file
%                   using an ASCII character for every stepx pixels in x-dimension
%
%   Returns:
%   outputTxtFile - Name of the generated ASCII text file
%
%   Modified version to return output filename

%   Copyright (c) by Federico Forte
%   Date:     2004/04/08 
%   Revision: 2004/04/27 

% Modified by: Chioma Opara
% Revision: 3/14/2025

ramp=['@@@@@@@######MMMBBHHHAAAA&&GGhh9933XXX222255SSSiiiissssrrrrrrr;;;;;;;;:::::::,,,,,,,........'];
  % the 'ramp' vector represents characters in order of intensity
im=imread(imfile);
im=mean(im,3);  % Convert to grayscale

% Define the output text file name
outputTxtFile = strcat(imfile, '.txt');

fid=fopen(outputTxtFile,'w');
stepx=1;
if length(varargin)>0,
  stepx=varargin{1};
end
stepy=2*stepx;
sizx=fix(size(im,2)/stepx);
sizy=fix(size(im,1)/stepy);
lumin=zeros(sizy,sizx);
for j=1:stepy,
  for k=1:stepx,
    lumin=lumin+im(j:stepy:(sizy-1)*stepy+j,k:stepx:(sizx-1)*stepx+k);
  end
end
str=ramp(fix(lumin/(stepx*stepy)/256*length(ramp))+1);
for h=1:sizy,
  fwrite(fid,[str(h,:),13,10]);
end
fclose(fid);