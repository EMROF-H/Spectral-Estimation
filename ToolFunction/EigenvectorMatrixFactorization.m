function [signalEigenspaceMatrix, noiseEigenspaceMatrix] = EigenvectorMatrixFactorization(eigenvectorMatrix, signalNumber)
    M = length(eigenvectorMatrix);
    signalEigenspaceMatrix = eigenvectorMatrix(:, 1:signalNumber);
    noiseEigenspaceMatrix = eigenvectorMatrix(:, (signalNumber + 1):M);
end
