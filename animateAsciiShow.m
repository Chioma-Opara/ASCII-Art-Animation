function animateAsciiShow(image1, image2, numReplays)
    % Run a sequence of ASCII animations along with synchronized audio with replay option.
    %
    % Input:
    %   image1 (string) - Path to the first image file.
    %   image2 (string, optional) - Path to second image (for transition).
    %   numReplays (int, optional) - Number of times to repeat the animation.
    %
    % Default: if numReplays not given, run only once
    % Update: included audio sync in the "mini-video"

    if nargin < 3     % nargin here is the number of input arguments
        numReplays = 1;
    end

    scrollDirections = ["up", "down", "left", "right"]; % Available scroll directions

    % Step 1: Convert first image to ASCII
    asciiArt1 = img2txt(image1);

    % Setup figure and load ASCII matrix
    [asciiDisplay, asciiText, asciiMatrix] = setupAsciiDisplay(asciiArt1);

    for replay = 1:numReplays

        %% Video Intro
        % Audio 1: movie trailer intro sound effect
        audio = 'mixkit-movie-trailer-epic-impact.wav';
        info = audioinfo(audio);
        Fs = info.SampleRate;
        
        [y,Fs] = audioread(audio, [1,2*Fs]);
        player1 = audioplayer(y, Fs);
        play(player1);  % Start playing audio
        pause(1.2);

        % Step 2: Display static ASCII image
        displayAsciiTextFile(asciiArt1, asciiDisplay, asciiText);
        pause(1.5);

        % Audio 2: dog barking
        audio = 'mixhit-dog-barking-twice.wav';
        [y,Fs] = audioread(audio);
        player2 = audioplayer(y, Fs);
        play(player2);  % Start playing audio
        pause(1.5);

        %% Animations
        %% Effect 1: 
        % Audio 3: tranquilness sound effect
        audio = 'tranquilness-ambient.mp3';
        info = audioinfo(audio);
        Fs = info.SampleRate;
        
        [y,Fs] = audioread(audio, [1,20*Fs]);
        y = fadeInOutAudio(y, Fs, 3, 2);  % apply fade in and fade out effects to audio
        player = audioplayer(y, Fs);
        
        play(player);  % Start playing audio
        pause(1.5);

        % Step 3: Wave
        waveEffect(asciiArt1, 130, asciiDisplay, asciiMatrix);
        % pause(0.5);
        stop(player);

        %% Effect 2

        % transition audio: bell transition
        audio = 'bell-transition.mp3';
        info = audioinfo(audio);
        Fs = info.SampleRate;
        [y,Fs] = audioread(audio, [2, 3*Fs]);
        player1 = audioplayer(y, Fs);

        play(player1);
        pause(3.5);
        
        % Audio 4: short dance
        audio = 'mixhit-sabre-dance-short.mp3';
        info = audioinfo(audio);
        Fs = info.SampleRate;
        
        [y,Fs] = audioread(audio, [1,5*Fs]);
        player = audioplayer(y, Fs);
        
        play(player);  % Start playing audio

        % Step 4: Dance
        dance(asciiArt1, 30, asciiDisplay, asciiMatrix);
        stop(player);
        pause(0.5);

        %% Effect 3

        % Audio 5: mouse wheel scroll
        audio = 'mouse-wheel-scroll.mp3';
        info = audioinfo(audio);
        Fs = info.SampleRate;

        nFrames = 100;
        chosenDirection = scrollDirections(randi(length(scrollDirections)));

        [y,Fs] = audioread(audio,  [4, 7*Fs]);
        player = audioplayer(y, Fs);

        play(player); % start playing audio
        pause(1.5)

        scrollMatrix = asciiMatrix;

        for frame = 1:nFrames
            %%%%%%%
            % Step 6: Scroll in chosen direction (up, left, right, down) 
            scrollMatrix = scrollOneStep(scrollMatrix, chosenDirection);

            % Convert matrix to properly formatted text
            scrolledAsciiText = strjoin(cellstr(scrollMatrix), '\n'); % Ensure new lines

            % Display in figure window
            set(asciiDisplay, 'String', scrolledAsciiText);
            %%%%%%

            % If audio finished, loop it
            if ~isplaying(player)
                play(player);
            end
            pause(0.1); % scroll speed
        end
        stop(player);
                
        %% Effect 4
        % Step 7: Transition to second image (if provided)
        if nargin >= 2 && ~isempty(image2)
            asciiArt2 = img2txt(image2);  
            transitionAudio = 'mixkit-arrow-whoosh.wav';

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
            pause(0.1)
            %%%

            % Update figure display
            set(asciiDisplay, 'String', scrolledAsciiText); 

            % Audio 7: birds in trees
            audio = 'mixkit-little-birds-singing-in-the-trees.wav';
            [y,Fs] = audioread(audio);
            
            % === Apply simple fade-out directly here ===
            % fadeDuration = 3; % seconds you want for fade out
            % numFadeSamples = round(fadeDuration * Fs); % number of samples for fade
            % totalSamples = size(y,1);
            % 
            % if numFadeSamples > totalSamples
            %     numFadeSamples = totalSamples;
            % end
            % 
            % fadeCurve = linspace(1, 0.05, numFadeSamples)'; % from 1 to 0
            % y(end-numFadeSamples+1:end, :) = y(end-numFadeSamples+1:end, :) .* fadeCurve;
            % === End fade-out section ===

            y = fadeInOutAudio(y, Fs, 0, 3);  % apply fade out to final audio
            
            player2 = audioplayer(y, Fs);
            
            play(player2);  % Start playing audio
            pause(8);
            stop(player2);
        end

        pause(1); % Short break before next replay
    end

    disp('All replays complete!');

     % === Close figure ===
    if isvalid(asciiDisplay)
        delete(ancestor(asciiDisplay, 'figure'));
    end
end
