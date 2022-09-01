function [eigenvectorMatrix,eigenvalueMatrix] = EigenvalueDecomposition(inputMatrix)
    [eigenvectorMatrix,eigenvalueMatrix] = eig(inputMatrix);
    eigenvalueMatrix = real(eigenvalueMatrix);
end