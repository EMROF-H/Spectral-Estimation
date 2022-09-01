function sineVectorSignal = SineVectorSample(amplitudeVector,frequencyVector,phaseVector,size)
    dimension = length(amplitudeVector);
    sineVectorSignal = zeros(dimension,size);
    nSignal = 0:1:(size - 1);

    for row = 1:dimension
        sineVectorSignal(row,:) = amplitudeVector(row) * exp(1i * frequencyVector(row) * nSignal);
    end
end
