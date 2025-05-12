function animateAsciiShow(image1, image2, numReplays)
    % Run a sequence of ASCII animations with replay option.
    %
    % Input:
    %   image1 (string) - Path to the first image file.
    %   image2 (string, optional) - Path to second image (for transition).
    %   numReplays (int, optional) - Number of times to repeat the animation.
    %
    % Default: if numReplays not given, run only once

    if nargin < 3     % nargin here is the number of input arguments
        numReplays = 1;
    end

    scrollDirections = ["up", "down", "left", "right"]; % Available scroll directions

    % Step 1: Convert first image to ASCII
    asciiArt1 = img2txt(image1);

    % Setup figure and load ASCII matrix
    [asciiDisplay, asciiText, asciiMatrix] = setupAsciiDisplay(asciiArt1);

    for replay = 1:numReplays

        % Step 2: Display static ASCII image
        displayAsciiTextFile(asciiArt1, asciiDisplay, asciiText);
        pause(1);

        % Step 3: Wave
        waveEffect(asciiArt1, 30, asciiDisplay, asciiMatrix);
        pause(0.5);

        % Step 4: Dance
        dance(asciiArt1, 10, asciiDisplay, asciiMatrix);
        pause(0.5);

        % Step 5: Zoom out (if implemented)
        % try
        %     ZoomOut(asciiArt1, asciiDisplay, asciiMatrix);
        % catch
        %     disp("Zoom-out skipped (see write-up).");
        %     pause(1);
        % end

        % Step 6: Scroll in chosen direction (up, left, right, down) 
        chosenDirection = scrollDirections(randi(length(scrollDirections)));
        scroll(asciiArt1, chosenDirection, 50, asciiDisplay, asciiMatrix);
        % pause(0.1);

        % Step 7: Transition to second image (if provided)
        if nargin >= 2 && ~isempty(image2)
            transition(asciiArt1, image2, asciiDisplay, asciiMatrix);
        end

        pause(1); % Short break before next replay
    end

    disp('All replays complete!');
end
