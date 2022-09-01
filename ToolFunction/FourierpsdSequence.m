function fourierpsdSequence = FourierpsdSequence(inputVectorSignal)
    [dimension, samplePoints] = size(inputVectorSignal);
    fourierpsdSequence = zeros(samplePoints, 1);

    for n = 1:dimension
        fourierpsdSequence = fourierpsdSequence + abs(fft(inputVectorSignal(n, :).')).^2;
    end

end
