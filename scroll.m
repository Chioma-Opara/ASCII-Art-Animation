function scroll(asciiArt, direction, numFrames, asciiDisplay, asciiMatrix)
    % Simulates a scrolling effect on the ascii image
    %
    % Inputs: 
    % asciiArt (string) - Path to a text file containing ASCII art.
    % direction (string) - The direction of scrolling to simulate (up, down, left or right)
    % numFrames (integer) - number of times to modify image with effect

    % Setup figure and load ASCII matrix
    if nargin < 5
        [asciiDisplay, ~, asciiMatrix] = setupAsciiDisplay(asciiArt);
    end

    % Get the ASCII matrix size
    [numRows, numCols] = size(asciiMatrix);

    % Scrolling effect: Shift characters left over multiple frames
    for frame = 1:numFrames

        switch direction 

            case "left"
            % Shift each row left by removing the first character and adding a space at the end
            asciiMatrix = [asciiMatrix(:, 2:end), repmat(' ', numRows, 1)]; 
        
            case "right"
            % Shift each row right by removing the last character and adding a
            % space at the beginning
            asciiMatrix = [repmat(' ', numRows, 1), asciiMatrix(:, 1: 1: end-1)]; 


            case "up"
            % Shift each row right by removing the last character and adding a
            % space at the beginning
            asciiMatrix = vertcat(repmat(' ', 1, numCols), asciiMatrix(1: 1: end-1, :)); 


            case "down"
            % Shift each row right by removing the last character and adding a
            % space at the beginning
            asciiMatrix = vertcat(asciiMatrix(2:end, :), repmat(' ', 1, numCols)); 

        end

    
        % Convert matrix to properly formatted text
        scrolledAsciiText = strjoin(cellstr(asciiMatrix), '\n'); % Ensure new lines
        
        % Display in figure window
        set(asciiDisplay, 'String', scrolledAsciiText);
        pause(0.1); % Pause to control animation speed
    end
end