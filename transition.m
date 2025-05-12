function transition(asciiArt1, image2, asciiDisplay, asciiMatrix)
    % Displays one ASCII image, then flips to another.
    %
    % Input:
    %   asciiArt1 (string) - Path to the first ASCII text file.
    %   image2 (string) - Path to the second image file.

    % Convert the second image (if needed) to ASCII text
    asciiArt2 = img2txt(image2);  

    % Display the first ASCII image
    if nargin < 3
        [asciiDisplay, ~, asciiMatrix] = setupAsciiDisplay(asciiArt1);
    end

    % Get size of the ASCII matrix
    % [~, ~] = size(asciiMatrix);

    % Loop to display both frames
    for frame = 1:2
        if frame == 2
            % Read ASCII text from the second file
            asciiText = fileread(asciiArt2); 
            lines = strsplit(asciiText, '\n'); % Split into lines
            asciiMatrix = char(lines);         % Convert to character matrix
        end

        % Convert ASCII matrix into a newline-separated string
        scrolledAsciiText = strjoin(cellstr(asciiMatrix), '\n');

        % Update figure display
        set(asciiDisplay, 'String', scrolledAsciiText);

        % Pause between image switches
        pause(2); 
    end
end
