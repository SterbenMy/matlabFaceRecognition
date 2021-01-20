function pozitia = NN(A, training, poza, norma)

z = zeros(1, training * 40);
A = double(A);
poza = double(poza);

for i = 1: size(A, 2)
    switch norma
        case 'n1', z(i) = norm(poza - A(:, i), 1);
        case 'n2', z(i) = norm(poza - A(:, i), 2);
        case 'ninf', z(i) = norm(poza - A(:, i), inf);
        case 'ncos', z(i) = 1 - dot(poza, A(:, i)) / (norm(poza) * norm(A(:, i)));
    end
end

[~, pozitia] = min(z);