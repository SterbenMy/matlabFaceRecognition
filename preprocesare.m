function [media, HQB, proiectii] = preprocesare(A, alg, training, k)

switch alg
    case 'algEigenfaces', [media, HQB, proiectii] = preprocesareEigenfaces(A, training, k);
    case 'algEigenfacesRC', [media, HQB, proiectii] = preprocesareEigenfacesRC(A, training, k);
    case 'algLEC', [media, HQB, proiectii] = preprocesareLEC(A, training, k);
    case 'algTensori', [media, HQB, proiectii] = preprocesareTensori(A, training, k);
end