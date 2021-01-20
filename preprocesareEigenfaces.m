function [media, HQB, proiectii] = preprocesareEigenfaces(A, training, k)

A = double(A);
copyA = A;

media = mean(A, 2);
O = ones(1, training * 40);
A = A - media * O;
C = A' * A;
[V, ~] = eig(C);
V = copyA * V;
HQB = V(:, end: -1: end - k + 1);
proiectii = A' * HQB;