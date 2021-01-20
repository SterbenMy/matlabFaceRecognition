function pozitia = KNN(A, training, poza, norma, k)

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

[~, pozitii] = sort(z);
vecini = zeros(1, k);

for i = 1: k
    if mod(pozitii(i), training) ~= 0
        vecini(i) = floor(pozitii(i) / training) + 1;
    else
        vecini(i) = floor(pozitii(i) / training);
    end
end

gasit = mode(vecini);
pozitia = (gasit - 1) * training + 1;
