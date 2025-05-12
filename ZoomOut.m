function ZoomOut(filename, asciiDisplay, asciiMatrix)

    % Set up the ASCII display UI and matrix
    if nargin < 4
        [asciiDisplay, ~, asciiMatrix] = setupAsciiDisplay(filename);
    end

    % Zoom-out effect: progressively reduce resolution
    numFrames = 10; % Number of zoom levels
    for zoomLevel = 1:numFrames
        % Compute block size (increases as zooming out)
        blockSize = max(round(1 + zoomLevel / (numFrames / 2)), 1);

        % Reduce ASCII matrix size using block processing
        reducedAscii = blockResize(asciiMatrix, blockSize);

        % Convert matrix to properly formatted text
        zoomedAsciiText = strjoin(cellstr(reducedAscii), '\n'); % Ensure new lines
        
        % Display in figure window
        set(asciiDisplay, 'String', zoomedAsciiText);
        pause(0.5); % Pause for animation effect
    end
end


% blockResize function used in the zoom out function
function reducedAscii = blockResize(asciiMatrix, blockSize)
    % Function to reduce ASCII resolution using block averaging
    [origHeight, origWidth] = size(asciiMatrix);
    newHeight = max(round(origHeight / blockSize), 5);   % having 5 here is too ensure we don't zoom out too much
    newWidth = max(round(origWidth / blockSize), 5);

    % Initialize reduced ASCII matrix
    reducedAscii = repmat('', newHeight, newWidth);

    % Process each block and replace it with the most frequent character
    for i = 1:newHeight
            for j = 1:newWidth
            % Define block range
            rowRange = (i-1)*blockSize + (1:blockSize);
            colRange = (j-1)*blockSize + (1:blockSize);
    
            % Ensure indices don't exceed matrix bounds
            rowRange(rowRange > origHeight) = [];
            colRange(colRange > origWidth) = [];
    
            % Extract block of characters
            if isempty(rowRange) || isempty(colRange)
                reducedAscii(i, j) = ' '; % Assign space if block is empty
                continue;
            end
            block = asciiMatrix(rowRange, colRange);
    
            % Choose the most representative character (most frequent)
            uniqueChars = unique(block);
            charCounts = histcounts(double(block), double(uniqueChars));
    
            if ~isempty(uniqueChars)
                [~, maxIdx] = max(charCounts);
                reducedAscii(i, j) = uniqueChars(maxIdx);
            else
                reducedAscii(i, j) = ' ';
            end
        end
    end

end