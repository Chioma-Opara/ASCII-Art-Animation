function asciiMatrix = scrollOneStep(asciiMatrix, direction)
    % A modified version of the scroll function. Simulates a scrolling effect on the ascii image for one single step
    %
    % Inputs: 
    % asciiMatrix (matrix) - matrix representing ascii art
    % direction (string) - The direction of scrolling to simulate (up, down, left or right)


    % Get the ASCII matrix size
    [numRows, numCols] = size(asciiMatrix);

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
end