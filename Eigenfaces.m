function pozitia = Eigenfaces(training, poza, norma, media, HQB, proiectii)

z = zeros(1, training * 40);
poza = double(poza);
poza = poza - media;
poza = poza' * HQB;

for i = 1: size(proiectii, 1)
    switch norma
        case 'n1', z(i) = norm(poza - proiectii(i, :), 1);
        case 'n2', z(i) = norm(poza - proiectii(i, :), 2);
        case 'ninf', z(i) = norm(poza - proiectii(i, :), inf);
        case 'ncos', z(i) = 1 - dot(poza, proiectii(i, :)) / (norm(poza) * norm(proiectii(i, :)));
    end
end

[~, pozitia] = min(z);