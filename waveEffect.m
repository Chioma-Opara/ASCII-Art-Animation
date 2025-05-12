function waveEffect(asciiArt, numFrames, asciiDisplay, asciiMatrix)
    % asciiWaveEffect - Animates an ASCII image with a wave-like effect.
    %
    % Input:
    %   asciiArt (string) - Path to the ASCII text file.
    %   numFrames (integer) - number of times to modify image with effect

    % Set up the ASCII display UI and matrix
    if nargin < 4
        [asciiDisplay, ~, asciiMatrix] = setupAsciiDisplay(asciiArt);
    end

    % Get dimensions of the ASCII matrix
    [numRows, ~] = size(asciiMatrix);

    % Wave parameters                    
    waveAmplitude = 5;                   % Max horizontal shift in characters
    waveFrequency = 2 * pi / numRows;    % Wave frequency (how tightly packed the wave is)

    % Animate the wave
    for frame = 1:numFrames
        waveMatrix = asciiMatrix; % Copy original ASCII matrix

        % Apply wave shift to each row
        for i = 1:numRows
            shiftAmount = round(waveAmplitude * sin(waveFrequency * i + frame * 0.2));  

            if shiftAmount > 0
                % Shift row right: add spaces to the left
                waveMatrix(i, :) = [repmat(' ', 1, shiftAmount), waveMatrix(i, 1:end-shiftAmount)];
            elseif shiftAmount < 0
                % Shift row left: cut off left chars, add trailing spaces
                waveMatrix(i, :) = [waveMatrix(i, -shiftAmount+1:end), repmat(' ', 1, -shiftAmount)];
            end
        end

        % Convert matrix to a newline-separated string
        waveAsciiText = strjoin(cellstr(waveMatrix), '\n');  

        % Update the display
        set(asciiDisplay, 'String', waveAsciiText);

        pause(0.1);  % Control animation speed
    end
end
