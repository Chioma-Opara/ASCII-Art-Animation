function yFaded = fadeInOutAudio(y, Fs, fadeInDuration, fadeOutDuration)
    % Apply fade-in at the start and fade-out at the end of an audio signal
    %
    % Inputs:
    %   y - audio signal
    %   Fs - sampling rate in Hz
    %   fadeInDuration - duration of fade-in in seconds
    %   fadeOutDuration - duration of fade-out in seconds
    %
    % Output:
    %   yFaded - audio signal with both fade-in and fade-out applied

    totalSamples = size(y,1);

    % === Fade-in part ===
    numFadeInSamples = round(fadeInDuration * Fs);
    if numFadeInSamples > totalSamples
        numFadeInSamples = totalSamples;
    end

    fadeInCurve = linspace(0, 1, numFadeInSamples)'; % From silence to full volume
    yFaded = y;
    yFaded(1:numFadeInSamples, :) = y(1:numFadeInSamples, :) .* fadeInCurve;

    % === Fade-out part ===
    numFadeOutSamples = round(fadeOutDuration * Fs);
    if numFadeOutSamples > totalSamples
        numFadeOutSamples = totalSamples;
    end

    fadeOutCurve = linspace(1, 0, numFadeOutSamples)'; % From full volume to silence
    yFaded(end-numFadeOutSamples+1:end, :) = yFaded(end-numFadeOutSamples+1:end, :) .* fadeOutCurve;

end
