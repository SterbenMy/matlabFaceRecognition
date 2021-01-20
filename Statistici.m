function varargout = Statistici(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Statistici_OpeningFcn, ...
                   'gui_OutputFcn',  @Statistici_OutputFcn, ...
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

function Statistici_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
alg = getappdata(0, 'algoritm');
set(handles.figure1, 'Name', strcat('Statistici - ', alg))

RR = getappdata(0, 'RR')
TMI = getappdata(0, 'TMI')
TPP = getappdata(0, 'TPP')

axes(handles.rataRecunoastere);
for i = 1 : size(RR, 1)
    g = strcat('k=', num2str(int32(RR(i, 1))));
    plot(1: 1: 4, RR(i, 2: 5), 'o', 'DisplayName', g, 'LineWidth', 2)
%     plot(1: 1: 4, RR(i, 2: 5), 'o:', 'DisplayName', g, 'LineWidth', 2)
    ylim([0 100])
    legend('Location', 'southwest', 'NumColumns', 2)
    pause(0.75)
    hold on
end
hold off
grid on
ylabel('Succes (%)')
ytickformat('%g')
xlabel('norm Values')
xticklabels({'n1', ' ', 'n2', ' ', 'ninf', ' ', 'ncos'})

axes(handles.timpMediuInterogare);
for i = 1 : size(RR, 1)
    g = strcat('k=', num2str(int32(TMI(i, 1))));
    plot(1: 1: 4, TMI(i, 2: 5), 'o', 'DisplayName', g, 'LineWidth', 2)
%     plot(1: 1: 4, TMI(i, 2: 5), 'o:', 'DisplayName', g, 'LineWidth', 2)
    legend('Location', 'northwest', 'NumColumns', 4)
    pause(0.75)
    hold on
end
hold off
grid on
ylabel('Duration (sec.)')   
xlabel('norm Values')
xticklabels({'n1', ' ', 'n2', ' ', 'ninf', ' ', 'ncos'})

if TPP == 0
    axes(handles.timpPreprocesare)
    title('( lipseste )   ', 'FontSize', 13, 'FontWeight', 'normal')
    cla
else
    axes(handles.timpPreprocesare)
    title('')
    plot(1: 1: 8, TPP(:, 2), 'o--', 'LineWidth', 2);
    grid on
    ylabel('Duration (sec.)')
    xlabel('k Values')
    xticklabels(num2cell(TPP(:, 1)))
end


function varargout = Statistici_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function rataRecunoastere_CreateFcn(hObject, eventdata, handles)
function timpMediuInterogare_CreateFcn(hObject, eventdata, handles)
function timpPreprocesare_CreateFcn(hObject, eventdata, handles)

function btnClear_Callback(hObject, eventdata, handles)
axes(handles.rataRecunoastere);
cla reset
axes(handles.timpMediuInterogare);
cla reset
axes(handles.timpPreprocesare)
cla reset
