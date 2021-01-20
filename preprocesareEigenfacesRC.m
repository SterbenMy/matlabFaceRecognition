function [media, HQB, proiectii] = preprocesareEigenfacesRC(A, training, k)

A2 = zeros(10304, 40);
for i = 1 : 40
    A2(:, i) = mean(A(:, training * (i - 1) + 1: training * i), 2);
end

media = mean(A2, 2);
O = ones(1, 40);
A2 = A2 - media * O;
C = A2' * A2;
[V, ~] = eig(C);
V = A2 * V;
HQB = V(:, end: -1: end - k + 1);
proiectii = A2' * HQB;