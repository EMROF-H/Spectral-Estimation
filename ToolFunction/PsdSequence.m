function psdSequence = PsdSequence(independentSequence, noiseEigenspaceMatrix)
    [M, vectorNumber] = size(noiseEigenspaceMatrix);
    steeringVectorSequence = GenerateSteeringMatrix(independentSequence.', M);
    squarenormSequence = zeros(length(independentSequence), 1);

    for n = 1:vectorNumber
        squarenormSequence = squarenormSequence + (steeringVectorSequence' * noiseEigenspaceMatrix(:, n)).^2;
    end

    psdSequence = 1 ./ squarenormSequence;
end
