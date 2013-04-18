function varargout = dicomreadgui(varargin)
% DICOMREADGUI M-file for dicomreadgui.fig
%      DICOMREADGUI, by itself, creates a new DICOMREADGUI or raises the existing
%      singleton*.
%
%      H = DICOMREADGUI returns the handle to a new DICOMREADGUI or the handle to
%      the existing singleton*.
%
%      DICOMREADGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DICOMREADGUI.M with the given input arguments.
%
%      DICOMREADGUI('Property','Value',...) creates a new DICOMREADGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dicomreadgui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dicomreadgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dicomreadgui

% Last Modified by GUIDE v2.5 17-May-2010 21:10:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dicomreadgui_OpeningFcn, ...
                   'gui_OutputFcn',  @dicomreadgui_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before dicomreadgui is made visible.
function dicomreadgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dicomreadgui (see VARARGIN)
load 'miudata.mat';
handles.lowc=0;
handles.hic=4000;
sourcepmat=zeros(20,3);
handles.sourcepmat=sourcepmat;
cases=[(mat_gray(1)*ones(10,1)),ones(10,1),0.001*ones(10,1)];
handles.cases=cases;
handles.mat_gray=mat_gray;
set(handles.slider3,'userdata',0);
set(handles.slider3,'value',0,'visible','off')
handles.prevelements=0;
    set (handles.bmd,'string',num2str(CT_det(2)))
    set (handles.kvp,'string',num2str(CT_det(1)))
    set (handles.px1,'string',num2str(mat_gray(1)))
    set (handles.mat1,'string',char(mat_names))
    set (handles.cn3,'visible','off')
    set (handles.px3,'visible','off','string',num2str(mat_gray(1)))
    set (handles.mat3,'visible','off','string',char(mat_names))
    set (handles.rho3,'visible','off')
    set (handles.cn2,'visible','off')
    set (handles.px2,'visible','off','string',num2str(mat_gray(1)))
    set (handles.mat2,'visible','off','string',char(mat_names))
    set (handles.rho2,'visible','off')
% Choose default command line output for dicomreadgui
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dicomreadgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = dicomreadgui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in next.
function next_Callback(hObject, eventdata, handles)
% hObject    handle to next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hand=get(handles.uipanel1,'selectedobject');
str=get(hand,'string');
pic=handles.pic;
sdm=size(pic);
aaxdr=xlim;
aaydr=ylim;
if isequal(str,'x-y plane')
currentpz=handles.currentpz;
hic=str2num(get(handles.HC,'string'));
lowc=str2num(get(handles.LC,'string'));
lenf=handles.lenf;
if currentpz<sdm(3)
currentpz=currentpz+1;
set(handles.snums,'string',num2str(currentpz))
imshow (pic(:,:,currentpz),'DisplayRange',[lowc hic],'InitialMagnification','fit')
handles.currentpz=currentpz;
guidata(hObject, handles);
end
elseif isequal(str,'x-z plane')
currentpx=handles.currentpx;
hic=str2num(get(handles.HC,'string'));
lowc=str2num(get(handles.LC,'string'));
lenf=handles.lenf;
if currentpx<sdm(1)
currentpx=currentpx+1;
set(handles.snums,'string',num2str(currentpx))
alpha=zeros(sdm(2),sdm(3));
alpha(:,:)=pic(currentpx,:,:);
imshow (alpha,'DisplayRange',[lowc hic],'InitialMagnification','fit')
handles.currentpx=currentpx;
guidata(hObject, handles);
end    
elseif isequal(str,'y-z plane')
currentpy=handles.currentpy;
hic=str2num(get(handles.HC,'string'));
lowc=str2num(get(handles.LC,'string'));
lenf=handles.lenf;
if currentpy<sdm(2)
currentpy=currentpy+1;
set(handles.snums,'string',num2str(currentpy))
alpha=zeros(sdm(1),sdm(3));
alpha(:,:)=pic(:,currentpy,:);
imshow (alpha,'DisplayRange',[lowc hic],'InitialMagnification','fit')
handles.currentpy=currentpy;
guidata(hObject, handles);
end
end
xlim(aaxdr)
ylim(aaydr)
% --- Executes on button press in prev.
function prev_Callback(hObject, eventdata, handles)
% hObject    handle to prev (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hand=get(handles.uipanel1,'selectedobject');
str=get(hand,'string');
pic=handles.pic;
sdm=size(pic);
aaxdr=xlim;
aaydr=ylim;
if isequal(str,'x-y plane')
currentpz=handles.currentpz;
hic=str2num(get(handles.HC,'string'));
lowc=str2num(get(handles.LC,'string'));
lenf=handles.lenf;
if currentpz>1
currentpz=currentpz-1;
set(handles.snums,'string',num2str(currentpz))
imshow (pic(:,:,currentpz),'DisplayRange',[lowc hic],'InitialMagnification','fit')
handles.currentpz=currentpz;
guidata(hObject, handles);
end
elseif isequal(str,'x-z plane')
currentpx=handles.currentpx;
hic=str2num(get(handles.HC,'string'));
lowc=str2num(get(handles.LC,'string'));
lenf=handles.lenf;
if currentpx>1
currentpx=currentpx-1;
set(handles.snums,'string',num2str(currentpx))
alpha=zeros(sdm(2),sdm(3));
alpha(:,:)=pic(currentpx,:,:);
imshow (alpha,'DisplayRange',[lowc hic],'InitialMagnification','fit')
handles.currentpx=currentpx;
guidata(hObject, handles);
end    
elseif isequal(str,'y-z plane')
currentpy=handles.currentpy;
hic=str2num(get(handles.HC,'string'));
lowc=str2num(get(handles.LC,'string'));
lenf=handles.lenf;
if currentpy>1
currentpy=currentpy-1;
set(handles.snums,'string',num2str(currentpy))
alpha=zeros(sdm(1),sdm(3));
alpha(:,:)=pic(:,currentpy,:);
imshow (alpha,'DisplayRange',[lowc hic],'InitialMagnification','fit')
handles.currentpy=currentpy;
guidata(hObject, handles);
end
end
xlim(aaxdr)
ylim(aaydr)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function op_Callback(hObject, eventdata, handles)
% hObject    handle to op (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,path] = uigetfile({'*.dcm';'*.DCM'},'Select the dicom file','MultiSelect','on');
lenf=length(filename);
i=1;
while i<=lenf
    fname=char([path,char(filename(i))]);
    
    pic(:,:,i) = dicomread(fname);
    inf(i)=dicominfo(fname);
    i=i+1;
end
if get(handles.CTnum,'value')
    pic=pic+1000;
end
info = dicominfo(fname);
%handles.pixsize=info.PixelSpacing;
%handles.pixthic=info.SliceThickness;
handles.lenf=lenf;
handles.pic=pic;
hic=str2num(get(handles.HC,'string'));
lowc=str2num(get(handles.LC,'string'));
set(handles.snums,'string','1')
u=imshow (pic(:,:,1),'DisplayRange',[lowc hic],'InitialMagnification','fit');
set(handles.axes1,'XAxisLocation','top')


%b=20*2.88*2.5;
%a=(120*2.88*2.5)+b;
%set(gca,'XTickLabel',(b : b : a))
%set(gca,'YTickLabel',(b : b : a))
axis on
grid on
set(handles.uipanel1,'selectedobject',handles.xy)
handles.currentpx=1;
handles.currentpy=1;
handles.currentpz=1;
guidata(hObject, handles);



function snum_Callback(hObject, eventdata, handles)
% hObject    handle to snum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of snum as text
%        str2double(get(hObject,'String')) returns contents of snum as a double


% --- Executes during object creation, after setting all properties.
function snum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to snum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in go2.
function go2_Callback(hObject, eventdata, handles)
% hObject    handle to go2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

snumr=str2num(get(handles.snum,'string'));
hand=get(handles.uipanel1,'selectedobject');
str=get(hand,'string');
pic=handles.pic;
sdm=size(pic);
if isequal(str,'x-y plane')
currentpz=handles.currentpz;
hic=str2num(get(handles.HC,'string'));
lowc=str2num(get(handles.LC,'string'));
lenf=handles.lenf;
if snumr<sdm(3)
currentpz=snumr;
set(handles.snums,'string',num2str(currentpz))
imshow (pic(:,:,currentpz),'DisplayRange',[lowc hic],'InitialMagnification','fit')
handles.currentpz=currentpz;
guidata(hObject, handles);
end
elseif isequal(str,'x-z plane')
currentpx=handles.currentpx;
hic=str2num(get(handles.HC,'string'));
lowc=str2num(get(handles.LC,'string'));
lenf=handles.lenf;
if snumr<sdm(1)
currentpx=snumr;
set(handles.snums,'string',num2str(currentpx))
alpha=zeros(sdm(2),sdm(3));
alpha(:,:)=pic(currentpx,:,:);
imshow (alpha,'DisplayRange',[lowc hic],'InitialMagnification','fit')
handles.currentpx=currentpx;
guidata(hObject, handles);
end    
elseif isequal(str,'y-z plane')
currentpy=handles.currentpy;
hic=str2num(get(handles.HC,'string'));
lowc=str2num(get(handles.LC,'string'));
lenf=handles.lenf;
if snumr<sdm(2)
currentpy=snumr;
set(handles.snums,'string',num2str(currentpy))
alpha=zeros(sdm(1),sdm(3));
alpha(:,:)=pic(:,currentpy,:);
imshow (alpha,'DisplayRange',[lowc hic],'InitialMagnification','fit')
handles.currentpy=currentpy;
guidata(hObject, handles);
end
end


function HC_Callback(hObject, eventdata, handles)
% hObject    handle to HC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HC as text
%        str2double(get(hObject,'String')) returns contents of HC as a double


% --- Executes during object creation, after setting all properties.
function HC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LC_Callback(hObject, eventdata, handles)
% hObject    handle to LC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LC as text
%        str2double(get(hObject,'String')) returns contents of LC as a double


% --- Executes during object creation, after setting all properties.
function LC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
hand=get(handles.uipanel1,'selectedobject');
str=get(hand,'string');
pic=handles.pic;
mamamax=max(max(max(pic)));
slvl=abs(get(handles.slider1,'value'));
set(handles.HC,'string',num2str(fix(slvl*mamamax)))
sdm=size(pic);
if isequal(str,'x-y plane')
currentpz=handles.currentpz;
hic=slvl*mamamax;
lowc=str2num(get(handles.LC,'string'));
lenf=handles.lenf;
if currentpz<sdm(3)
set(handles.snums,'string',num2str(currentpz))
imshow (pic(:,:,currentpz),'DisplayRange',[lowc hic],'InitialMagnification','fit')
handles.currentpz=currentpz;
guidata(hObject, handles);
end
elseif isequal(str,'x-z plane')
currentpx=handles.currentpx;
hic=str2num(get(handles.HC,'string'));
lowc=str2num(get(handles.LC,'string'));
lenf=handles.lenf;
if currentpx<sdm(1)
set(handles.snums,'string',num2str(currentpx))
alpha=zeros(sdm(2),sdm(3));
alpha(:,:)=pic(currentpx,:,:);
imshow (alpha,'DisplayRange',[lowc hic],'InitialMagnification','fit')
handles.currentpx=currentpx;
guidata(hObject, handles);
end    
elseif isequal(str,'y-z plane')
currentpy=handles.currentpy;
hic=str2num(get(handles.HC,'string'));
lowc=str2num(get(handles.LC,'string'));
lenf=handles.lenf;
if currentpy<sdm(2)
set(handles.snums,'string',num2str(currentpy))
alpha=zeros(sdm(1),sdm(3));
alpha(:,:)=pic(:,currentpy,:);
imshow (alpha,'DisplayRange',[lowc hic],'InitialMagnification','fit')
handles.currentpy=currentpy;
guidata(hObject, handles);
end
end

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
hand=get(handles.uipanel1,'selectedobject');
str=get(hand,'string');
pic=handles.pic;
mamamax=str2num(get(handles.HC,'string'));
slvl=abs(get(handles.slider2,'value'));
set(handles.LC,'string',num2str((fix(slvl*mamamax))-1));
sdm=size(pic);
if isequal(str,'x-y plane')
currentpz=handles.currentpz;
hic=str2num(get(handles.HC,'string'));
lowc=str2num(get(handles.LC,'string'));
lenf=handles.lenf;
if currentpz<sdm(3)
set(handles.snums,'string',num2str(currentpz))
imshow (pic(:,:,currentpz),'DisplayRange',[lowc hic],'InitialMagnification','fit')
handles.currentpz=currentpz;
guidata(hObject, handles);
end
elseif isequal(str,'x-z plane')
currentpx=handles.currentpx;
hic=str2num(get(handles.HC,'string'));
lowc=str2num(get(handles.LC,'string'));
lenf=handles.lenf;
if currentpx<sdm(1)
set(handles.snums,'string',num2str(currentpx))
alpha=zeros(sdm(2),sdm(3));
alpha(:,:)=pic(currentpx,:,:);
imshow (alpha,'DisplayRange',[lowc hic],'InitialMagnification','fit')
handles.currentpx=currentpx;
guidata(hObject, handles);
end    
elseif isequal(str,'y-z plane')
currentpy=handles.currentpy;
hic=str2num(get(handles.HC,'string'));
lowc=str2num(get(handles.LC,'string'));
lenf=handles.lenf;
if currentpy<sdm(2)
set(handles.snums,'string',num2str(currentpy))
alpha=zeros(sdm(1),sdm(3));
alpha(:,:)=pic(:,currentpy,:);
imshow (alpha,'DisplayRange',[lowc hic],'InitialMagnification','fit')
handles.currentpy=currentpy;
guidata(hObject, handles);
end
end

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --------------------------------------------------------------------
function savmat_Callback(hObject, eventdata, handles)
% hObject    handle to savmat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pic=handles.pic;
ss=clock;
ee=char([num2str(ss(1,1)),'_',num2str(ss(1,2)),'_',num2str(ss(1,3)),'_',num2str(ss(1,4)),'_',num2str(ss(1,5))]);
[filename,path,FilterIndex] = uiputfile;
save(char([path,char(filename)]),'pic','-v7')


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CREATE_Callback(hObject, eventdata, handles)
% hObject    handle to CREATE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pic=handles.pic;
% preparing dimentions for mcnpwrite
dimxs=(get(handles.xdim,'string'));    
dimys=(get(handles.ydim,'string'));
dimzs=(get(handles.zdim,'string'));
if isempty(dimxs) || isempty(dimys) || isempty(dimzs)
    errordlg('dimentions has not been inserted in the boxes')
    return
end
dimx=str2num(dimxs);
dimy=str2num(dimys);
dimz=str2num(dimzs);
% preparing periods, matnum & romat matrices for mcnpwrite
%per=[0 1000 1300 2100 2300 4000];
%mtn=[5 1 2 3 4];
cases=handles.cases;
maxval=get(handles.nc,'value');
periods(1)=0;
periods(2)=str2num(get(handles.vmp,'string'));
matnums(1)=0;
romat(1)=0;
pn=1;
while pn<=maxval
    periods(pn+2)=cases(pn,1);
    matnums(pn+1)=cases(pn,2);
    romat (pn+1) =cases(pn,3);
    pn=pn+1;
end
matnums(1)=pn;
mode='p';
xmode='n';
% inputs ready for calling mcnpwrite
   %here should chek input consistancies
   %check inequalities of periods
   %check romat not to have NaN
%getting output file name
[filename,path] = uiputfile('*.txt');
fname=char([path,char(filename)]);
%finalizing input preparation
mcnpwrite(pic,fname,dimx ,dimy,dimz,periods,matnums,romat,mode,xmode);






% --- Executes on button press in desele.
function desele_Callback(hObject, eventdata, handles)
% hObject    handle to desele (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in sele.
function sele_Callback(hObject, eventdata, handles)
% hObject    handle to sele (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hand=get(handles.uipanel1,'selectedobject');
axis on
grid minor
str=get(hand,'string');
if isequal(str,'x-y plane')
xm=get(handles.axes1,'XLim');
ym=get(handles.axes1,'YLim') ;   
[xs,ys]=ginput(1);
while xs<xm(1) || ys<ym(1) || xs>xm(2) || ys>ym(2)
   [xs,ys]=ginput(1);    
end
zs=str2num(get(handles.snums,'string'));
set (handles.xsec,'string',xs)
set (handles.ysec,'string',ys)
set (handles.zsec,'string',zs)
elseif isequal(str,'x-z plane')
xm=get(handles.axes1,'XLim');
ym=get(handles.axes1,'YLim') ;   
[xs,ys]=ginput(1);
while xs<xm(1) || ys<ym(1) || xs>xm(2) || ys>ym(2)
   [xs,ys]=ginput(1);    
end
zs=str2num(get(handles.snums,'string'));
set (handles.xsec,'string',ys)
set (handles.ysec,'string',zs)
set (handles.zsec,'string',xs)
elseif isequal(str,'y-z plane')
xm=get(handles.axes1,'XLim');
ym=get(handles.axes1,'YLim') ;   
[xs,ys]=ginput(1);
while xs<xm(1) || ys<ym(1) || xs>xm(2) || ys>ym(2)
   [xs,ys]=ginput(1);    
end
zs=str2num(get(handles.snums,'string'));
set (handles.xsec,'string',zs)
set (handles.ysec,'string',ys)
set (handles.zsec,'string',xs)
end
grid minor
axis off
% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1
while 1
if get(handles.togglebutton1,'value')
    break
end
get (gcf,'CurrentPoint')
end



function xsec_Callback(hObject, eventdata, handles)
% hObject    handle to xsec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xsec as text
%        str2double(get(hObject,'String')) returns contents of xsec as a double


% --- Executes during object creation, after setting all properties.
function xsec_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xsec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ysec_Callback(hObject, eventdata, handles)
% hObject    handle to ysec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ysec as text
%        str2double(get(hObject,'String')) returns contents of ysec as a double


% --- Executes during object creation, after setting all properties.
function ysec_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ysec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function zsec_Callback(hObject, eventdata, handles)
% hObject    handle to zsec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zsec as text
%        str2double(get(hObject,'String')) returns contents of zsec as a double


% --- Executes during object creation, after setting all properties.
function zsec_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zsec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in setsrc.
function setsrc_Callback(hObject, eventdata, handles)
% hObject    handle to setsrc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
xs=str2num(get(handles.xsec,'string'));
ys=str2num(get(handles.ysec,'string'));
zs=str2num(get(handles.zsec,'string'));
sourcepmat=handles.sourcepmat;
val=get(handles.SN,'value');
sourcepmat(val,1)=xs;
sourcepmat(val,2)=ys;
sourcepmat(val,3)=zs;
handles.sourcepmat=sourcepmat;
guidata(hObject, handles);
% --- Executes on selection change in SN.
function SN_Callback(hObject, eventdata, handles)
% hObject    handle to SN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns SN contents as cell array
%        contents{get(hObject,'Value')} returns selected item from SN
con = get(hObject,'Value');
sourcepmat=handles.sourcepmat;
set (handles.xsec,'string',sourcepmat(con,1))
set (handles.ysec,'string',sourcepmat(con,2))
set (handles.zsec,'string',sourcepmat(con,3))

% --- Executes during object creation, after setting all properties.
function SN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in NS.
function NS_Callback(hObject, eventdata, handles)
% hObject    handle to NS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns NS contents as cell array
%        contents{get(hObject,'Value')} returns selected item from NS
nsval=get (handles.NS,'value');
i=1;
while i<=nsval
    snstr(1,i)={num2str(i)};
    i=i+1;
end
set(handles.SN,'string',snstr)

% --- Executes during object creation, after setting all properties.
function NS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function px1_Callback(hObject, eventdata, handles)
% hObject    handle to px1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of px1 as text
%        str2double(get(hObject,'String')) returns contents of px1 as a double


% --- Executes during object creation, after setting all properties.
function px1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to px1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function px2_Callback(hObject, eventdata, handles)
% hObject    handle to px2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of px2 as text
%        str2double(get(hObject,'String')) returns contents of px2 as a double


% --- Executes during object creation, after setting all properties.
function px2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to px2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function px3_Callback(hObject, eventdata, handles)
% hObject    handle to px3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of px3 as text
%        str2double(get(hObject,'String')) returns contents of px3 as a double


% --- Executes during object creation, after setting all properties.
function px3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to px3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rho1_Callback(hObject, eventdata, handles)
% hObject    handle to rho1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rho1 as text
%        str2double(get(hObject,'String')) returns contents of rho1 as a double


% --- Executes during object creation, after setting all properties.
function rho1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rho1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rho2_Callback(hObject, eventdata, handles)
% hObject    handle to rho2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rho2 as text
%        str2double(get(hObject,'String')) returns contents of rho2 as a double


% --- Executes during object creation, after setting all properties.
function rho2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rho2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rho3_Callback(hObject, eventdata, handles)
% hObject    handle to rho3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rho3 as text
%        str2double(get(hObject,'String')) returns contents of rho3 as a double


% --- Executes during object creation, after setting all properties.
function rho3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rho3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
prev=get(handles.slider3,'userdata');
cases=handles.cases;
n=get(handles.nc,'value')-2;
i=handles.prevelements;
previ=i;
cases(str2num(get(handles.cn1,'string')),1)=str2num(get(handles.px1,'string'));
cases(str2num(get(handles.cn1,'string')),2)=get(handles.mat1,'value');
cases(str2num(get(handles.cn1,'string')),3)=str2num(get(handles.rho1,'string'));
cases(str2num(get(handles.cn2,'string')),1)=str2num(get(handles.px2,'string'));
cases(str2num(get(handles.cn2,'string')),2)=get(handles.mat2,'value');
cases(str2num(get(handles.cn2,'string')),3)=str2num(get(handles.rho2,'string'));
cases(str2num(get(handles.cn3,'string')),1)=str2num(get(handles.px3,'string'));
cases(str2num(get(handles.cn3,'string')),2)=get(handles.mat3,'value');
cases(str2num(get(handles.cn3,'string')),3)=str2num(get(handles.rho3,'string'));
handles.cases=cases;
guidata(hObject, handles);
sv=abs(get(handles.slider3,'Value'));
if n>1
if sv>prev
    if i<n-1
    i=fix(sv*n);
    if i==previ
        i=i+1;
    end
    newval=i*(1/(n-1));
        if newval>1
        newval=1;
        i=n-1;
        end
    set(handles.slider3,'Value',-newval)
    handles.prevelements=i;
    set(handles.slider3,'userdata',newval);
    set (handles.cn1,'string',i+1)
    set (handles.cn2,'string',i+2)
    set (handles.cn3,'string',i+3)
    set (handles.px1,'string',num2str(cases(i+1,1)))
    set (handles.mat1,'value',cases(i+1,2))
    set (handles.rho1,'string',num2str(cases(i+1,3)))
    set (handles.px2,'string',num2str(cases(i+2,1)))
    set (handles.mat2,'value',cases(i+2,2))
    set (handles.rho2,'string',num2str(cases(i+2,3)))
    set (handles.px3,'string',num2str(cases(i+3,1)))
    set (handles.mat3,'value',cases(i+3,2))
    set (handles.rho3,'string',num2str(cases(i+3,3)))        
    
    end
elseif sv<prev
    if i>0
    i=fix(sv*n);
        if i==previ
        i=i-1;
        end
    newval=i*(1/(n-1));
    if newval<0
        newval=0;
        i=0;
    end
    set(handles.slider3,'Value',-newval)
    handles.prevelements=i;
    set(handles.slider3,'userdata',newval);
    set (handles.cn1,'string',i+1)
    set (handles.cn2,'string',i+2)
    set (handles.cn3,'string',i+3)
    set (handles.px1,'string',num2str(cases(i+1,1)))
    set (handles.mat1,'value',cases(i+1,2))
    set (handles.rho1,'string',num2str(cases(i+1,3)))
    set (handles.px2,'string',num2str(cases(i+2,1)))
    set (handles.mat2,'value',cases(i+2,2))
    set (handles.rho2,'string',num2str(cases(i+2,3)))
    set (handles.px3,'string',num2str(cases(i+3,1)))
    set (handles.mat3,'value',cases(i+3,2))
    set (handles.rho3,'string',num2str(cases(i+3,3)))        
    end
end
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in mat1.
function mat1_Callback(hObject, eventdata, handles)
% hObject    handle to mat1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns mat1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from mat1
mat_gray=handles.mat_gray;
matval=get(handles.mat1,'value');
set(handles.px1,'string',num2str(mat_gray(matval)))

% --- Executes during object creation, after setting all properties.
function mat1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mat1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in mat2.
function mat2_Callback(hObject, eventdata, handles)
% hObject    handle to mat2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns mat2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from mat2
mat_gray=handles.mat_gray;
matval=get(handles.mat2,'value');
set(handles.px2,'string',num2str(mat_gray(matval)))

% --- Executes during object creation, after setting all properties.
function mat2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mat2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in mat3.
function mat3_Callback(hObject, eventdata, handles)
% hObject    handle to mat3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns mat3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from mat3
mat_gray=handles.mat_gray;
matval=get(handles.mat3,'value');
set(handles.px3,'string',num2str(mat_gray(matval)))

% --- Executes during object creation, after setting all properties.
function mat3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mat3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in nc.
function nc_Callback(hObject, eventdata, handles)
% hObject    handle to nc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns nc contents as cell array
%        contents{get(hObject,'Value')} returns selected item from nc
cases=handles.cases;
cases(str2num(get(handles.cn1,'string')),1)=str2num(get(handles.px1,'string'));
cases(str2num(get(handles.cn1,'string')),2)=get(handles.mat1,'value');
cases(str2num(get(handles.cn1,'string')),3)=str2num(get(handles.rho1,'string'));
cases(str2num(get(handles.cn2,'string')),1)=str2num(get(handles.px2,'string'));
cases(str2num(get(handles.cn2,'string')),2)=get(handles.mat2,'value');
cases(str2num(get(handles.cn2,'string')),3)=str2num(get(handles.rho2,'string'));
cases(str2num(get(handles.cn3,'string')),1)=str2num(get(handles.px3,'string'));
cases(str2num(get(handles.cn3,'string')),2)=get(handles.mat3,'value');
cases(str2num(get(handles.cn3,'string')),3)=str2num(get(handles.rho3,'string'));
handles.cases=cases;
guidata(hObject, handles);

set(handles.slider3,'userdata',0);
set(handles.slider3,'value',0)
handles.prevelements=0;
    set (handles.cn1,'string',1)
    set (handles.cn2,'string',2)
    set (handles.cn3,'string',3)
    set (handles.px1,'string',num2str(cases(1,1)))
    set (handles.mat1,'value',cases(1,2))
    set (handles.rho1,'string',num2str(cases(1,3)))
    set (handles.px2,'string',num2str(cases(2,1)))
    set (handles.mat2,'value',cases(2,2))
    set (handles.rho2,'string',num2str(cases(2,3)))
    set (handles.px3,'string',num2str(cases(3,1)))
    set (handles.mat3,'value',cases(3,2))
    set (handles.rho3,'string',num2str(cases(3,3)))    
%end of 12
%end of 11
val=get(hObject,'Value');
if val>2
    set (handles.cn3,'visible','on')
    set (handles.px3,'visible','on')
    set (handles.mat3,'visible','on')
    set (handles.rho3,'visible','on')
else
    set (handles.cn3,'visible','off')
    set (handles.px3,'visible','off')
    set (handles.mat3,'visible','off')
    set (handles.rho3,'visible','off')
end
if val>1
    set (handles.cn2,'visible','on')
    set (handles.px2,'visible','on')
    set (handles.mat2,'visible','on')
    set (handles.rho2,'visible','on')

else
    set (handles.cn2,'visible','off')
    set (handles.px2,'visible','off')
    set (handles.mat2,'visible','off')
    set (handles.rho2,'visible','off')
end

if val>3
    set(handles.slider3,'visible','on');
else
    set(handles.slider3,'visible','off');
end
guidata(hObject, handles);
% --- Executes during object creation, after setting all properties.
function nc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vmp_Callback(hObject, eventdata, handles)
% hObject    handle to vmp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vmp as text
%        str2double(get(hObject,'String')) returns contents of vmp as a double


% --- Executes during object creation, after setting all properties.
function vmp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vmp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xdim_Callback(hObject, eventdata, handles)
% hObject    handle to xdim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xdim as text
%        str2double(get(hObject,'String')) returns contents of xdim as a double


% --- Executes during object creation, after setting all properties.
function xdim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xdim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ydim_Callback(hObject, eventdata, handles)
% hObject    handle to ydim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ydim as text
%        str2double(get(hObject,'String')) returns contents of ydim as a double


% --- Executes during object creation, after setting all properties.
function ydim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ydim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function zdim_Callback(hObject, eventdata, handles)
% hObject    handle to zdim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zdim as text
%        str2double(get(hObject,'String')) returns contents of zdim as a double


% --- Executes during object creation, after setting all properties.
function zdim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zdim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function kvp_Callback(hObject, eventdata, handles)
% hObject    handle to kvp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kvp as text
%        str2double(get(hObject,'String')) returns contents of kvp as a double


% --- Executes during object creation, after setting all properties.
function kvp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kvp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bmd_Callback(hObject, eventdata, handles)
% hObject    handle to bmd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bmd as text
%        str2double(get(hObject,'String')) returns contents of bmd as a double


% --- Executes during object creation, after setting all properties.
function bmd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bmd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function exact_rho_Callback(hObject, eventdata, handles)
% hObject    handle to exact_rho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pic=handles.pic;
% preparing dimentions for mcnpwrite
dimxs=(get(handles.xdim,'string'));
dimys=(get(handles.ydim,'string'));
dimzs=(get(handles.zdim,'string'));
if isempty(dimxs) || isempty(dimys) || isempty(dimzs)
    errordlg('dimentions has not been inserted in the boxes')
    return
end
dimx=str2num(dimxs);
dimy=str2num(dimys);
dimz=str2num(dimzs);
% preparing periods, matnum & romat matrices for mcnpwrite
%per=[0 1000 1300 2100 2300 4000];
%mtn=[5 1 2 3 4];
cases=handles.cases;
maxval=get(handles.nc,'value');
periods(1)=0;
periods(2)=str2num(get(handles.vmp,'string'));
matnums(1)=0;
romat(1)=0;
pn=1;
while pn<=maxval
    periods(pn+2)=cases(pn,1);
    matnums(pn+1)=cases(pn,2);
    romat (pn+1) =cases(pn,3);
    pn=pn+1;
end
matnums(1)=pn;
mode='p';
xmode='n';
% inputs ready for calling mcnpwrite
   %here should chek input consistancies
   %check inequalities of periods
   %check romat not to have NaN
%getting output file name
[filename,path] = uiputfile('*.txt');
fname=char([path,char(filename)]);
%finalizing input preparation


% --- Executes on button press in CTnum.
function CTnum_Callback(hObject, eventdata, handles)
% hObject    handle to CTnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CTnum
