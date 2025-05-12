function dance(asciiArt, numFrames, asciiDisplay, asciiMatrix)
    % Creates a mirrored, dancing ASCII animation.
    %
    % Input:
    %   asciiArt (string) - Path to a text file containing ASCII art.
    %   numFrames (integer) - number of times to modify image with effect

    % Setup figure and load ASCII matrix
    if nargin < 4
        [asciiDisplay, ~, asciiMatrix] = setupAsciiDisplay(asciiArt);
    end

    % Get the number of rows in the matrix
    [numRows, ~] = size(asciiMatrix);

    % Run animation for 20 frames
    for frame = 1:numFrames
        % Reverse each row's characters and add a (broken) trailing space
        % This creates a visual "dancing" or flickering effect
        asciiMatrix = [asciiMatrix(:, end-1:-1:1), repmat(' ', numRows, 1)]; 

        % Convert matrix to properly formatted string with newlines
        scrolledAsciiText = strjoin(cellstr(asciiMatrix), '\n'); 

        % Update the UI display
        set(asciiDisplay, 'String', scrolledAsciiText);

        % Pause briefly between frames
        pause(0.1); 
    end
end
