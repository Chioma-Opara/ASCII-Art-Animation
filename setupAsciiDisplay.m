function [asciiDisplay, asciiText, asciiMatrix] = setupAsciiDisplay(filename)
    % Check if the file exists
    if ~isfile(filename)
        error('File "%s" not found.', filename);
    end

    % Read ASCII text from file
    asciiText = fileread(filename); 
    lines = strsplit(asciiText, '\n'); % Split text into lines

    % Convert ASCII text into a character matrix
    asciiMatrix = char(lines);

    % Get the ASCII matrix size
    [numRows, numCols] = size(asciiMatrix);

    % Scaling factors (adjustable based on screen resolution)
    charWidth = 8;   % Approximate width of one character in pixels
    charHeight = 15; % Approximate height of one character in pixels

    % Calculate figure size based on ASCII dimensions
    figWidth = numCols * charWidth;
    figHeight = numRows * charHeight;

    % Ensure figure doesn't exceed screen size
    screenSize = get(0, 'ScreenSize'); % [left, bottom, width, height]
    maxWidth = screenSize(3) * 0.9; % 90% of screen width
    maxHeight = screenSize(4) * 0.9; % 90% of screen height

    % Limit figure size to avoid oversized windows
    figWidth = min(figWidth, maxWidth);
    figHeight = min(figHeight, maxHeight);

    % Create figure window with dynamic size
    fig = figure('Name', ['ASCII Text: ', filename], 'NumberTitle', 'off', ...
                 'MenuBar', 'none', 'ToolBar', 'none', ...
                 'Position', [100, 75, figWidth, figHeight]);

    % Calculate dynamic font size based on figure and text size
    baseFontSize = 10;  % Default readable font size
    scaleFactor = min(figWidth / (numCols * charWidth), figHeight / (numRows * charHeight));
    dynamicFontSize = round(baseFontSize * scaleFactor * 0.85); % Adjusted to fit properly

    % Create a uipanel to hold the text
    panel = uipanel('Parent', fig, 'BorderType', 'none', ...
                    'Units', 'normalized', 'Position', [0 0 1 1]);

    % Text box to display ASCII art
    asciiDisplay = uicontrol('Parent', panel, 'Style', 'text', 'FontName', 'Courier', ...
                             'FontSize', dynamicFontSize, 'HorizontalAlignment', 'center', ...
                             'Units', 'normalized', 'Position', [0.01 0.01 0.98 0.98]);
end
