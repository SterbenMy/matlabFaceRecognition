function varargout = ProjectGUI(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ProjectGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ProjectGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

%gui 
function ProjectGUI_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
global firstTime
global applied
global loaded
global pozaCautata
global BD
global config
global alg
global norma
global k
global kKNN kEig kEigRC kLEC kTensori
global valRR valTMI valTPP
global algList configList

axes(handles.pozaCautata);
grid off;
axes(handles.pozaGasita);
grid off;

algList = 'algNN algKNN algEigenfaces algEigenfacesRC algLEC algTensori';
configList = 'config60la40 config80la20 config90la10';

firstTime = true;
applied = false;
loaded = false;
pozaCautata = [];
BD = 'bdORL';
config = 'config60la40';
alg = 'algNN';
norma = 'n1';
k = 0;

kKNN = [1; 3; 5; 7; 9; 11];
kEig = [20; 40; 60; 80; 100; 120; 140; 160];
kEigRC = [5; 10; 15; 20; 25; 30; 35; 40];
kLEC = [20; 35; 50; 65; 80; 95; 110; 125];
kTensori = [2; 6; 10; 14; 18; 22; 26; 30];
valRR = fillStatisticsTables('%d %5.2f  %5.2f  %5.2f  %5.2f\r\n', 'rr.txt')
valTMI = fillStatisticsTables('%d %8.6f  %8.6f  %8.6f  %8.6f\r\n', 'tmi.txt')
valTPP = fillStatisticsTables('%d %8.6f\r\n', 'tpp.txt')

function varargout = ProjectGUI_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function bdORL_CreateFcn(hObject, eventdata, handles)
function bdCTOVD_CreateFcn(hObject, eventdata, handles)

function config60la40_CreateFcn(hObject, eventdata, handles)
function config80la20_CreateFcn(hObject, eventdata, handles)        
function config90la10_CreateFcn(hObject, eventdata, handles)

function algNN_CreateFcn(hObject, eventdata, handles)
function algKNN_CreateFcn(hObject, eventdata, handles)
function algEigenfaces_CreateFcn(hObject, eventdata, handles)
function algEigenfacesRC_CreateFcn(hObject, eventdata, handles)
function algLEC_CreateFcn(hObject, eventdata, handles)
function algTensori_CreateFcn(hObject, eventdata, handles)

function n1_CreateFcn(hObject, eventdata, handles)
function n2_CreateFcn(hObject, eventdata, handles)
function ninf_CreateFcn(hObject, eventdata, handles)
function ncos_CreateFcn(hObject, eventdata, handles)

function kValues_CreateFcn(hObject, eventdata, handles)
function load_CreateFcn(hObject, eventdata, handles)
function exit_CreateFcn(hObject, eventdata, handles)

function pozaCautata_ButtonDownFcn(hObject, eventdata, handles)
function autoIncarcare_Callback(hObject, eventdata, handles)

function kValues_Callback(hObject, eventdata, handles)
global applied
applied = false;

function bdORL_Callback(hObject, eventdata, handles)
global applied
applied = false;

function bdCTOVD_Callback(hObject, eventdata, handles)
global applied
applied = false;

function config60la40_Callback(hObject, eventdata, handles)
global applied
applied = false;

function config80la20_Callback(hObject, eventdata, handles)
global applied
applied = false;

function config90la10_Callback(hObject, eventdata, handles)
global applied
applied = false;

function algNN_Callback(hObject, eventdata, handles)
global applied
applied = false;
set(handles.kValues, 'Value', 1);
set(handles.kValues, 'Enable', 'OFF');

function algKNN_Callback(hObject, eventdata, handles)
global applied kKNN
applied = false;
set(handles.kValues, 'String', {'     --- // ---', kKNN});
set(handles.kValues, 'Value', 1);
set(handles.kValues, 'Enable', 'ON');

function algEigenfaces_Callback(hObject, eventdata, handles)
global applied kEig
applied = false;
set(handles.kValues, 'String', {'     --- // ---', kEig});
set(handles.kValues, 'Value', 1);
set(handles.kValues, 'Enable', 'ON');

function algEigenfacesRC_Callback(hObject, eventdata, handles)
global applied kEigRC
applied = false;
set(handles.kValues, 'String', {'     --- // ---', kEigRC});
set(handles.kValues, 'Value', 1);
set(handles.kValues, 'Enable', 'ON');

function algLEC_Callback(hObject, eventdata, handles)
global applied kLEC
applied = false;
set(handles.kValues, 'String', {'     --- // ---', kLEC});
set(handles.kValues, 'Value', 1);
set(handles.kValues, 'Enable', 'ON');

function algTensori_Callback(hObject, eventdata, handles)
global applied kTensori
applied = false;
set(handles.kValues, 'String', {'     --- // ---', kTensori});
set(handles.kValues, 'Value', 1);
set(handles.kValues, 'Enable', 'ON');

function n1_Callback(hObject, eventdata, handles)
global applied
applied = false;

function n2_Callback(hObject, eventdata, handles)
global applied
applied = false;

function ninf_Callback(hObject, eventdata, handles)
global applied
applied = false;

function ncos_Callback(hObject, eventdata, handles)
global applied
applied = false;


%btn OK
function btnOptiuni_Callback(hObject, eventdata, handles)
global valRR valTMI valTPP
global media HQB proiectii
global A BD training config alg alg2 norma k
global firstTime notFirstTime
global applied
global tpp

if notFirstTime
    changed = false;
    bringBackOldValues()
elseif firstTime
    firstTime = false;
    notFirstTime = true;
    changed = true;
end

if ~isequal(config, get(get(handles.Config, 'SelectedObject'), 'Tag')) || ~isequal(BD, get(get(handles.BD, 'SelectedObject'), 'Tag'))
    changed = true;
end

if ~isequal(BD, get(get(handles.BD, 'SelectedObject'), 'Tag'))
    saveResults()
    BD = get(get(handles.BD, 'SelectedObject'), 'Tag');
    valRR = fillStatisticsTables('%d %5.2f  %5.2f  %5.2f  %5.2f\r\n', 'rr.txt');
    valTMI = fillStatisticsTables('%d %8.6f  %8.6f  %8.6f  %8.6f\r\n', 'tmi.txt');
    valTPP = fillStatisticsTables('%d %8.6f\r\n', 'tpp.txt');
end

switch BD
    case 'bdORL', dir = 'att_faces\s';
    case 'bdCTOVD', dir = 'to_complete';
end

currentK = getSelectedK(handles);
alg = get(get(handles.Alg, 'SelectedObject'), 'Tag');
norma = get(get(handles.Norma, 'SelectedObject'), 'Tag');
config = get(get(handles.Config, 'SelectedObject'), 'Tag');
switch config
    case 'config60la40', training = 6;
    case 'config80la20', training = 8;
    case 'config90la10', training = 9;
end

if changed
    A = zeros(10304, training * 40);

    for i = 1: 40
        cd(strcat('att_faces\s', num2str(i)));
        for j = 1: training
            poza = imread(strcat(num2str(j), '.pgm'));
            A(:, (i - 1) * training + j) = reshape(poza, size(poza, 1) * size(poza, 2), 1);
        end
        cd ..
        cd ..
    end
end

if changed || ~isequal(k, currentK) || ~isequal(alg, alg2)
    if get(handles.kValues, 'Value') == 1 && ~isequal(alg, 'algNN')
        warndlg('Please choose a valid value for k.', 'Data Error');
        return
    end
    if isequal(alg, 'algNN') || isequal(alg, 'algKNN')
        k = currentK;
        tpp = 0;
        rememberOldValues(handles)
        saveWhatToDisplay(alg, config, valRR, valTMI, valTPP, handles) 
        applied = true;
        return
    end
    k = currentK;
    tic
    [media, HQB, proiectii] = preprocesare(A, alg, training, k);
    tpp = toc;
    saveWhatToDisplay(alg, config, valRR, valTMI, valTPP, handles) 
end
rememberOldValues(handles)
applied = true;

function btnCautare_Callback(hObject, eventdata, handles)
global kKNN kEig kEigRC kLEC kTensori
global valRR valTMI valTPP algList
global media HQB proiectii
global pozaCautata 
global persoane n
global A config alg training norma k
global applied
global loaded
global tpp

checkData(handles)
if ~applied
    return
end

tmi = 0;
if get(handles.autoIncarcare, 'Value') == 1
    contor = 0;
    for i = 1: 40
        n = 1;
        for j = training + 1: 10
            cd(strcat('att_faces\s', num2str(i)));
            pozaCautata = imread(strcat(num2str(j), '.pgm'));
            loadPozaCautata(hObject, handles)
            pozaCautata = reshape(pozaCautata, 10304, 1);
            cd ..
            cd ..
            
            tic
            switch alg
                case 'algNN'
                    pozitia = NN(A, training, pozaCautata, norma);
                case 'algKNN'
                    if get(handles.kValues, 'Value') == 1
                        warndlg('Please choose a valid value for k.', 'Data Error');
                        return
                    end
                    pozitia = KNN(A, training, pozaCautata, norma, k);

                case 'algEigenfaces'
                    if get(handles.kValues, 'Value') == 1
                        warndlg('Please choose a valid value for k.', 'Data Error');
                        return
                    end
                    pozitia = Eigenfaces(training, pozaCautata, norma, media, HQB, proiectii);
                case 'algEigenfacesRC'
                    if get(handles.kValues, 'Value') == 1
                        warndlg('Please choose a valid value for k.', 'Data Error');
                        return
                    end
                    pozitia = EigenfacesRC(training, pozaCautata, norma, media, HQB, proiectii);
                case 'algLEC'
                    if get(handles.kValues, 'Value') == 1
                        warndlg('Please choose a valid value for k.', 'Data Error');
                        return
                    end
                    pozitia = Eigenfaces(training, pozaCautata, norma, media, HQB, proiectii);
                case 'algTensori'
                    
            end
            tmi = tmi + toc;
  
            pozaGasita = A(:, pozitia); 
            pozaGasita = reshape(pozaGasita, 112, 92);
            loadPozaGasita(hObject, handles, pozaGasita)
%             pause(0.75)
            
            if mod(pozitia, training) ~= 0
                gasit = floor(pozitia / training) + 1;
            else
                gasit = floor(pozitia / training);
            end
            if gasit == i 
                contor = contor + 1;
            end
        end
    end
    rr = 100 / ((10 - training) * 40) * contor;
    tmi = tmi / ((10 - training) * 40);
    currentK = getSelectedK(handles);

    n = zeros(1, size(split(algList, ' '), 1));
    n(1) = 1; 
    n(2) = size(kKNN, 1); 
    n(3) = size(kEig, 1);
    n(4) = size(kEigRC, 1);
    n(5) = size(kLEC, 1);
    n(6) = size(kTensori, 1);
    
    switch alg 
        case 'algNN',           idxAlg = 1;     idxK = 1;   
        case 'algKNN',          idxAlg = 2;     idxK = find(kKNN == currentK);
        case 'algEigenfaces',   idxAlg = 3;     idxK = find(kEig == currentK);
        case 'algEigenfacesRC', idxAlg = 4;     idxK = find(kEigRC == currentK);
        case 'algLEC',          idxAlg = 5;     idxK = find(kLEC == currentK);
        case 'algTensori',      idxAlg = 6;     idxK = find(kTensori == currentK);
    end
    
    switch config
        case 'config60la40', idxConfig = 1;
        case 'config80la20', idxConfig = 2;
        case 'config90la10', idxConfig = 3;
    end
    
    switch norma
        case 'n1', idxNorma = 1;
        case 'n2', idxNorma = 2;
        case 'ninf', idxNorma = 3;
        case 'ncos', idxNorma = 4;
    end
    
    sumK = 0;
    for i = 1: idxAlg - 1
        sumK = sumK + n(i);
    end
    valRR(3 * sumK + (idxConfig - 1) * n(idxAlg) + idxK, idxNorma + 1) = rr;
    valTMI(3 * sumK + (idxConfig - 1) * n(idxAlg) + idxK, idxNorma + 1) = tmi;
    
    sumK = 0;
    for i = 3: idxAlg - 1
        sumK = sumK + n(i);
    end
    
    valTPP(3 * sumK + (idxConfig - 1) * n(idxAlg) + idxK, 2) = tpp;
else
    if ~loaded 
        warndlg('Please load an image/new image or check the box.', 'Search Error');
        return
    end
    
    pozaCautata = reshape(pozaCautata, 10304, 1);
    switch alg
        case 'algNN', pozitia = NN(A, training, pozaCautata, norma);
        case 'algKNN'
            if get(handles.kValues, 'Value') == 1
                warndlg('Please choose a valid value for k.', 'Data Error');
                return
            end
            pozitia = KNN(A, training, pozaCautata, norma, k);
        case 'algEigenfaces'
            if get(handles.kValues, 'Value') == 1
                warndlg('Please choose a valid value for k.', 'Data Error');
                return
            end
            pozitia = Eigenfaces(training, pozaCautata, norma, media, HQB, proiectii);
        case 'algEigenfacesRC'
            if get(handles.kValues, 'Value') == 1
                warndlg('Please choose a valid value for k.', 'Data Error');
                return
            end
            pozitia = EigenfacesRC(training, pozaCautata, norma, media, HQB, proiectii);
    end

    pozaGasita = A(:, pozitia); 
    pozaGasita = reshape(pozaGasita, 112, 92);
    loadPozaGasita(hObject, handles, pozaGasita)
end

function btnStatistica_Callback(hObject, eventdata, handles)
global applied

if ~applied
    waitfor(warndlg('Click OK to save options.', 'Save Error'));
    return
end
Statistici

%incarca poza
function load_Callback(hObject, eventdata, handles)
global pozaCautata
global loaded

[FileName, PathName] = uigetfile({'*.pgm; *.PGM', 'PGM Files (*.pgm, *.PGM)';...
	'*.tif; *.TIF', 'TIF Files (*.tif, *.TIF)';...
	'*.jpg; *.JPG', 'JPG Files (*.jpg, *.JPG)';...
	'*.gif; *.GIF', 'GIF Files (*.gif, *.GIF)';...
	'*.bmp; *.BMP', 'BMP Files (*.bmp, *.BMP)';...
	'*.*', 'All Files(*.*)'}, 'Select the input file');
	
if isequal(FileName, 0) || isequal(PathName, 0)
	warndlg('Error: user pressed cancel. Select an image file.', 'Load Error')
else
	[~, ~, ext] = fileparts(FileName);
	if isequal(ext, '.tif') || isequal(ext, '.TIF') ||...
	isequal(ext, '.jpg') || isequal(ext, '.JPG') ||...
	isequal(ext, '.bmp') || isequal(ext, '.BMP') ||...
	isequal(ext, '.gif') || isequal(ext, '.GIF') ||...
	isequal(ext, '.png') || isequal(ext, '.pgm')
		cd(PathName)
		handles.FileName = FileName;
		pozaCautata = imread(FileName);
        loaded = true;
		loadPozaCautata(hObject, handles)
	else
		warndlg('Error: invalid file format. Select image file.', 'Load Error');
	end
	cd ..
    cd ..
end

function checkData(handles)
global BD config alg norma k
global applied

if isnan(k)
    k = 0;
end

kvalue = getSelectedK(handles);

if ~isequal(BD, get(get(handles.BD, 'SelectedObject'), 'Tag'))
    warndlg('Click OK to save the new option for: Baza de date', 'Save Error');
    return
end
if ~isequal(config, get(get(handles.Config, 'SelectedObject'), 'Tag'))
    warndlg('Click OK to save the new option for: Configurare', 'Save Error');
    return
end
if ~isequal(alg, get(get(handles.Alg, 'SelectedObject'), 'Tag'))
    warndlg('Click OK to save the new option for: Algoritmul', 'Save Error');
    return
end
if ~isequal(norma, get(get(handles.Norma, 'SelectedObject'), 'Tag'))
    warndlg('Click OK to save the new option for: Norma', 'Save Error');
    return
end
if get(handles.kValues, 'Value') == 1 && isequal('algKNN', get(get(handles.Norma, 'SelectedObject'), 'Tag'))
    warndlg('Please choose a valid value for k.', 'Data Error');
    return
end
if ~isequal(k, kvalue)
    warndlg('Click OK to save the new option for: k', 'Save Error');
    return
end
if ~applied
    waitfor(warndlg('Click OK to save options.', 'Save Error'));
    return
end

%axis 1
function loadPozaCautata(hObject, handles)
global pozaCautata

axes(handles.pozaCautata);
cla;
colormap(gray);
imagesc(pozaCautata);
axis image;
grid off;
set(gca, 'xtick', []);
set(gca, 'ytick', []);
handles.poza = pozaCautata;
guidata(hObject, handles);
%axis 2
function loadPozaGasita(hObject, handles, pozaGasita)
axes(handles.pozaGasita);
cla;
colormap(gray);
imagesc(pozaGasita);
axis image;
grid off;
set(gca, 'xtick', []);
set(gca, 'ytick', []);
handles.poza = pozaGasita;
guidata(hObject, handles);

function Z = fillStatisticsTables(format, extensie)
global kKNN kEig kEigRC kLEC kTensori
global BD
global algList configList

config = strsplit(configList, ' ');
alg = strsplit(algList, ' ');
Z = [];

newFolder1 = strcat(BD,'_results');
if ~exist(newFolder1, 'dir')
   mkdir(newFolder1)
end

for i = 1: size(alg, 2)
    newFolder2 = strcat(newFolder1, '\', alg{i});
    if ~exist(newFolder2, 'dir')
       mkdir(newFolder2)
    end
    
    if (isequal(alg{i}, 'algNN') || isequal(alg{i}, 'algKNN')) && isequal(extensie, 'tpp.txt')
        continue;
    end
    
    for j = 1: size(config, 2)
        file = strcat(BD, '_results\', alg{i}, '\', config{j}, '_', extensie);
        
        switch alg{i}
            case 'algNN', valk = 1;
            case 'algKNN',  valk = kKNN;
            case 'algEigenfaces', valk = kEig;
            case 'algEigenfacesRC', valk = kEigRC;
            case 'algLEC', valk = kLEC;
            case 'algTensori', valk = kTensori;
        end

        if isfile(file)
            fid = fopen(file, 'r');
            A = textscan(fid, format);
            B = double(cell2mat(A(:, 1)));
            C = double(cell2mat(A(:, 2: end)));
            A = [B C];
            Z = [Z; A];
            fclose(fid);
        else
            if isequal(extensie, 'tpp.txt')
                results = zeros(1, size(valk, 1));
            else
                results = zeros(4, size(valk, 1));
            end
            A = double([valk'; results]);
            fid = fopen(file, 'w');
            fprintf(fid, format, A);
            Z = [Z; A'];
            fclose(fid);
        end
    end
end

function saveWhatToDisplay(algoritm, configuratie, valRR, valTMI, valTPP, handles)
global kKNN kEig kEigRC kLEC kTensori
global algList

setappdata(0, 'algoritm', algoritm);

switch algoritm
    case 'algNN',           idxAlg = 1;
    case 'algKNN',          idxAlg = 2;
    case 'algEigenfaces',   idxAlg = 3;
    case 'algEigenfacesRC', idxAlg = 4;
    case 'algLEC',          idxAlg = 5;
    case 'algTensori',      idxAlg = 6;
end

switch configuratie
    case 'config60la40', idxConfig = 1;
    case 'config80la20', idxConfig = 2;
    case 'config90la10', idxConfig = 3;
end

algs = strsplit(algList, ' ');
n = size(algs, 2);
sizeK = zeros(n, 1);

for i = 1: n
    switch algs{1, i}
        case 'algNN',           sizeK(i) = 1;   
        case 'algKNN',          sizeK(i) = size(kKNN, 1);
        case 'algEigenfaces',   sizeK(i) = size(kEig, 1);
        case 'algEigenfacesRC', sizeK(i) = size(kEigRC, 1);
        case 'algLEC',          sizeK(i) = size(kLEC, 1);
        case 'algTensori',      sizeK(i) = size(kTensori, 1);
    end
end

sumK = 0;
for q = 1: idxAlg - 1
    sumK = sumK + sizeK(q);
end

from = 3 * sumK + (idxConfig - 1) * sizeK(idxAlg) + 1;
to = from + sizeK(idxAlg) - 1;
% toate de k
RR = valRR(from: to, :);
TMI = valTMI(from: to, :);
% doar 1 k ales
% k = get(handles.kValues, 'Value');
% if isequal(algoritm, 'algNN')
  %   RR = valRR(from + k - 1, :);
 %    TMI = valTMI(from + k - 1, :);
% else
%     RR = valRR(from + k - 2, :);
  %   TMI = valTMI(from + k - 2, :);
% end

if isequal(algoritm, 'algNN') || isequal(algoritm, 'algKNN')
    TPP = 0;
else
    sumK = 0;
    for q = 3: idxAlg - 1
        sumK = sumK + sizeK(q);
    end

    from = 3 * sumK + (idxConfig - 1) * sizeK(idxAlg) + 1;
    to = from + sizeK(idxAlg) - 1;

    TPP = valTPP(from: to, :);
end

setappdata(0, 'RR', RR);
setappdata(0, 'TMI', TMI);
setappdata(0, 'TPP', TPP);

function saveResults()
global kKNN kEig kEigRC kLEC kTensori
global BD
global valRR valTMI valTPP
global algList configList

config = strsplit(configList, ' ');
alg = strsplit(algList, ' ');

n = size(alg, 2);
m = size(config, 2);
sizeK = zeros(n, 1);
idxAlg = zeros(n, 1);
idxConfig = zeros(m, 1);

for i = 1: n
    switch alg{1, i}
        case 'algNN',           idxAlg(i) = 1;     sizeK(i) = 1;   
        case 'algKNN',          idxAlg(i) = 2;     sizeK(i) = size(kKNN, 1);
        case 'algEigenfaces',   idxAlg(i) = 3;     sizeK(i) = size(kEig, 1);
        case 'algEigenfacesRC', idxAlg(i) = 4;     sizeK(i) = size(kEigRC, 1);
        case 'algLEC',          idxAlg(i) = 5;     sizeK(i) = size(kLEC, 1);
        case 'algTensori',      idxAlg(i) = 6;     sizeK(i) = size(kTensori, 1);
    end
end

for i = 1: m
    switch config{1, i}
        case 'config60la40', idxConfig(i) = 1;
        case 'config80la20', idxConfig(i) = 2;
        case 'config90la10', idxConfig(i) = 3;
    end
end

for i = 1: n
    for j = 1: m
        sumK = 0;
        for k = 1: idxAlg(i) - 1
            sumK = sumK + sizeK(k);
        end
        
        from = 3 * sumK + (idxConfig(j) - 1) * sizeK(idxAlg(i)) + 1;
        to = from + sizeK(i) - 1;
        
        A = valRR(from: to, :);
        file = strcat(BD, '_results\', alg{i}, '\', config{j}, '_rr.txt');
        fid = fopen(file, 'w');
        fprintf(fid, '%d %5.2f  %5.2f  %5.2f  %5.2f\r\n', A');
        fclose(fid);
        
        A = valTMI(from: to, :);
        file = strcat(BD, '_results\', alg{i}, '\', config{j}, '_tmi.txt');
        fid = fopen(file, 'w');
        fprintf(fid, '%d %8.6f  %8.6f  %8.6f  %8.6f\r\n', A');
        fclose(fid);
        if isequal(alg{i}, 'algNN') || isequal(alg{i}, 'algKNN')
            continue;
        end
        
        sumK = 0;
        for k = 3: idxAlg(i) - 1
            sumK = sumK + sizeK(k);
        end
        
        from = 3 * sumK + (idxConfig(j) - 1) * sizeK(idxAlg(i)) + 1;
        to = from + sizeK(i) - 1;
        
        A = valTPP(from: to, :);
        file = strcat(BD, '_results\', alg{i}, '\', config{j}, '_tpp.txt');
        fid = fopen(file, 'w');
        fprintf(fid, '%d %8.6f\r\n', A');
        fclose(fid);
    end
end

function rememberOldValues(handles)
global BD2 config2 alg2 norma2 k2

BD2 = get(get(handles.BD, 'SelectedObject'), 'Tag');
config2 = get(get(handles.Config, 'SelectedObject'), 'Tag');
alg2 = get(get(handles.Alg, 'SelectedObject'), 'Tag');
norma2 = get(get(handles.Norma, 'SelectedObject'), 'Tag');
k2 = getSelectedK(handles);

function bringBackOldValues()
global BD config alg norma k
global BD2 config2 alg2 norma2 k2

BD = BD2;
config = config2;
alg = alg2;
norma = norma2;
k = k2;

function currentK = getSelectedK(handles)
strk = get(handles.kValues, 'String');
valk = get(handles.kValues, 'Value');
currentK = char(strk(valk));
currentK = str2double(currentK);
if isnan(currentK) 
    currentK = 0; 
end

%iesire
function exit_Callback(hObject, eventdata, handles)
close all

function MainGUI_CloseRequestFcn(hObject, eventdata, handles)
saveResults()
delete(handles.MainGUI)
close all
