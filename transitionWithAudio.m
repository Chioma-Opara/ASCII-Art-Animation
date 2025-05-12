function player = transitionWithAudio(image2, asciiDisplay, transitionAudio)
    % Displays one ASCII image, then flips to another.
    %
    % Input:
    %   asciiArt1 (string) - Path to the first ASCII text file.
    %   image2 (string) - Path to the second image file.
    %
    % Amendment: 
    % add audioplayer right before second image is displayed
    % do not display first image. Rather, play audio and display second
    % image

    % Convert the second image (if needed) to ASCII text
    asciiArt2 = img2txt(image2);  

    % Display new frame

    % Read ASCII text from the second file
    asciiText = fileread(asciiArt2); 
    lines = strsplit(asciiText, '\n'); % Split into lines
    asciiMatrix = char(lines);         % Convert to character matrix

    % Convert ASCII matrix into a newline-separated string
    scrolledAsciiText = strjoin(cellstr(asciiMatrix), '\n');

    %%% Eperimenting with sound insert
    [y,Fs] = audioread(transitionAudio);
    player = audioplayer(y, Fs);
    play(player);  % Start playing audio
    %%%

    % Update figure display
    set(asciiDisplay, 'String', scrolledAsciiText); 
end
