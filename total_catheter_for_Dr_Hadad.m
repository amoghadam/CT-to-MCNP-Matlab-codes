% this code takes the CT data stored in variable Xzpic and converts it to
% MCNP input.
pic=fix(Xzpic);
[abcdx,abcdy,abcdz]=size(pic);
% make sure all dimentions of Xzpic are even, othervise the following
% conditions will trim it to make all dimentions even and it may screw up
% your defined source position a little bit
if mod(abcdx,2)~=0
    pic(1,:,:)=[];
end
if mod(abcdy,2)~=0
    pic(:,1,:)=[];
end
if mod(abcdz,2)~=0
    pic(:,:,1)=[];
end

% change these to make them equal to your voxel dimentions in x y and z
% directions
AAxdim=0.2;
AAydim=0.2;
AAzdim=0.2;

%% do not modify this cell
XCC=source_center(3,1);
YCC=source_center(3,2);
ZCC=source_center(3,3);
% 
[XAC,YAC,ZAC]=size(pic);
%% this cell gives you the position  to use in the sdef card defined by you
%% using the set as source button in the dicom_orienter_gui
source_positionx=(-(XCC-(XAC/2)))*AAxdim
source_positiony=(-((YCC-((YAC/2)+1))))*AAydim
source_positionz=((ZCC-(ZAC/2)))*AAzdim



%% don't Modify this cell unless you know what you are doing
    if min(min(min(pic)))>-100
        pic=pic-(1000+min(min(min(pic))));
    end
        
    lastrun.maxima=max(max(max(pic)));
    %^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    
    lastrun.minimin=-1000;
    maxima=lastrun.maxima;
    minimin=lastrun.minimin;
    
%% Here you shoud define the matterials that you are going to use in your
%% phantom (selectedmatterial) and the thresholds for these matterial
%% (mat_discriminator)
% for example the matterial for voxel numbers between minimin to -880 will
% be equal to one which is air and between -880 to -150 will be matterial
% number 11 which is lung tissue and so on.
% to find which number is for which matterial run this command (load 'miumat.mat') and look in the variable mat_names to fined which number is for
% which matterial
    %&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    %                                      -150
    lastrun.mat_discriminator= [ minimin  -880    -150  -2  1  185     maxima ];
    
    %^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    
    lastrun.selectedmatterial=[ 1  11   10  8  4  5 ];
    
    
%     lastrun.meshxsize2=2;
%     lastrun.meshysize2=2;
%     lastrun.meshzsize2=2;

%   here define the mesh size of the lattice (in other words the size of
%   your CT Voxel) in milimeteres for x y and z dimensions
    lastrun.dimx=0.2;
    lastrun.dimy=0.2;
    lastrun.dimz=0.2;
    % here define the mesh size of the mesh tally in milimeteres for x y
    % and z dimensions (it is better to keep these the same as the lattice
    % sizes above
    lastrun.meshdimx=0.2;
    lastrun.meshdimy=0.2;
    lastrun.meshdimz=0.2;

%% don't  touch this cell unless you know what you are doing
flesh=1080;
wrightwait=20;
cc=((floor(clock)));
    filenameoo='';
    pathoo='';
    %&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    lastrun.partnum2sim=2000;
    %^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    
    lastrun.numberofsymiulations=1;
    lastrun.airloestden=-1000;
    
    %&&&&&&&&&&&&&&&&&&&&&&&&&&&&

    
    %&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    [amxs,amys,amzs]=size(pic);
    lastrun.xsize=amxs;
    lastrun.ysize=amys;
    lastrun.zsize=amzs;
    lastrun.meshxsize=amxs;
    lastrun.meshysize=amys;
    lastrun.meshzsize=amzs;
    %&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    

    lastrun.filenameoo=filenameoo;
    lastrun.pathoo=pathoo;
    lastrun.piciinp1=175;
    lastrun.piciinp2=175;
    lastrun.piciinp3=45;
    lastrun.piciinp4=325;
    lastrun.piciinp5=325;
    lastrun.piciinp6=110;
    lastrun.piciinp7=1;
    
    %&&&&&&&&&&&&&&&&&&&&&&&&



    %^^^^^^^^^^^^^^^^^^^^^^^^
    
    lastrun.alphabet=1;
    lastrun.savefilename=['patient1','.mat'];
xsize=lastrun.xsize;
ysize=lastrun.ysize;
zsize=lastrun.zsize;    
meshxsize=lastrun.meshxsize;
meshysize=lastrun.meshysize;
meshzsize=lastrun.meshzsize;
dosedata=zeros((meshxsize*meshysize*meshzsize),1);
erordata=zeros((meshxsize*meshysize*meshzsize),1);



partnum2sim=lastrun.partnum2sim;
numberofsymiulations=lastrun.numberofsymiulations;
airloestden=lastrun.airloestden;
maxima=lastrun.maxima;
minimin=lastrun.minimin;
mat_discriminator=lastrun.mat_discriminator;
selectedmatterial=lastrun.selectedmatterial;
xsize=lastrun.xsize;
ysize=lastrun.ysize;
zsize=lastrun.zsize;
meshxsize=lastrun.meshxsize;
meshysize=lastrun.meshysize;
meshzsize=lastrun.meshzsize;
filenameoo=lastrun.filenameoo;
pathoo=lastrun.pathoo;
piciinp1=lastrun.piciinp1;
piciinp2=lastrun.piciinp2;
piciinp3=lastrun.piciinp3;
piciinp4=lastrun.piciinp4;
piciinp5=lastrun.piciinp5;
piciinp6=lastrun.piciinp6;
piciinp7=lastrun.piciinp7;
dimx=lastrun.dimx;
dimy=lastrun.dimy;
dimz=lastrun.dimz;
meshdimx=lastrun.meshdimx;
meshdimy=lastrun.meshdimy;
meshdimz=lastrun.meshdimz;
alphabet=lastrun.alphabet;
savefilename=lastrun.savefilename;


differa=maxima-minimin;
load 'miumat.mat'
load 'mat_compos_mat.mat'
kvp=CT_det(1)*1e-3;
kvp=150*(1e-3);

bmd=CT_det(2);
%                   maxvoid   maxair maxtissue  maxbone bonecort
%mat_discriminator= [minimin    -150    90     maxima];
len_disc=length(mat_discriminator);
%exact_rho
%                 air_Dry softtisue 
%selectedmatterial=[ 1       2      5];
lsm=length(selectedmatterial);
miu_ov_rhos=zeros(1,lsm);
miu_ov_rhos_at20=zeros(1,lsm);
i2=1;
while i2<=lsm
    miu_ov_rhos(i2)=sum((kvp==total_miu(:,1,selectedmatterial(i2))).*total_miu(:,2,selectedmatterial(i2)));
    miu_ov_rhos_at20(i2)=sum((0.02==total_miu(:,1,selectedmatterial(i2))).*total_miu(:,2,selectedmatterial(i2)));
    i2=i2+1;
end
water_miu=sum((kvp==total_miu(:,1,8)).*total_miu(:,2,8));
%
rho_scalermat1=0.001;
miu_scalermat1=miu_ov_rhos(1)*rho_scalermat1;
rho_scalermat2=bmd;
miu_scalermat2=miu_ov_rhos(lsm)*rho_scalermat2;
% A=double([(mat_discriminator(1)+1), 1;mat_discriminator(len_disc), 1]);
% 
% B=1000*[((miu_scalermat1-water_miu)/water_miu);((miu_scalermat2-water_miu)/water_miu)];
% X=A\B;
% Alpha=X(1);
% Beita=X(2);
%
i1=1;
materialmat=(minimin:maxima);
dsicedmat=zeros(1,(maxima-minimin+1));
while i1<len_disc
    dsicedmat=dsicedmat+((selectedmatterial(i1))*((materialmat>mat_discriminator(i1)).*(materialmat<=mat_discriminator(i1+1))));
    i1=i1+1;
end
i1=1;
mius_over_ros_mat=zeros(1,(maxima-minimin+1));
mius_over_ros_mat_at20=zeros(1,(maxima-minimin+1));

while i1<len_disc
    mius_over_ros_mat=mius_over_ros_mat+((dsicedmat==selectedmatterial(i1))*miu_ov_rhos(i1));
    mius_over_ros_mat_at20=mius_over_ros_mat_at20+((dsicedmat==selectedmatterial(i1))*miu_ov_rhos_at20(i1));
    i1=i1+1;
end
%this must be changed
rhosmat=((((double(materialmat)))*(water_miu/1000))+water_miu)./mius_over_ros_mat;
%
%materialmat(1:mat_discriminator(1))=[];
%rhosmat(1:mat_discriminator(1))=[];
%dsicedmat(1:mat_discriminator(1))=[];
%mius_over_ros_mat(1:mat_discriminator(1))=[];
%mius_over_ros_mat_at20(1:mat_discriminator(1))=[];
materialmat=materialmat-(mat_discriminator(1));
rhosmat(1)=0;
materialmat(1)=0;
% mcnp even
tic
cylrad=0.032;
cylradthic=0.04;
cylhight=0.4834;
capthick=0.0083;
Irho=4.930;
sylvrho=4.540;
%xsize=40;
%ysize=40;
%zsize=40;
%meshxsize=xsize;
%meshysize=ysize;
%meshzsize=zsize;
%diffmat=0;
delete('meshtal')
%move ami.txt to a safe place
delete('ami.txt')
delete('mctal')
delete('runtpe')
format long
filename='ats.txt';
%dimx=0.1;
%dimy=0.1;
%dimz=0.1;
%meshdimx=0.1;
%meshdimy=0.1;
%meshdimz=0.1;
if ~mod(xsize,2)
latxmin=-dimx;
latymin=-dimy;
latzmin=-dimz;
latxmax=0;
latymax=0;
latzmax=0;
else
latxmin=-dimx/2;
latymin=-dimy/2;
latzmin=-dimz/2;
latxmax=dimx/2;
latymax=dimy/2;
latzmax=dimz/2;
end
minxgrid=-(xsize*dimx)/2;
minygrid=-(ysize*dimy)/2;
minzgrid=-(zsize*dimz)/2;
maxxgrid=(xsize*dimx)/2;
maxygrid=(ysize*dimy)/2;
maxzgrid=(zsize*dimz)/2;
meshminxgrid=-(meshxsize*meshdimx)/2;
meshminygrid=-(meshysize*meshdimy)/2;
meshminzgrid=-(meshzsize*meshdimz)/2;
meshmaxxgrid=(meshxsize*meshdimx)/2;
meshmaxygrid=(meshysize*meshdimy)/2;
meshmaxzgrid=(meshzsize*meshdimz)/2;
%matnumnums=(
matnums=materialmat;
maxmatnum=max(matnums);
romat=rhosmat;
mode='p';
mode2='e';
xmode='n';
emode='0';
phmode='1';
nmode='0';
warning ('off')



for inum=alphabet:numberofsymiulations;
    savefilename
    inum
    
pic=double(pic);
2
a=(pic-(mat_discriminator(1))).*((pic-(mat_discriminator(1))>0));
3
length(matnums)

rhoinp=zeros(xsize,ysize,zsize);
for k=1:length(matnums)
    k
rhoinp=rhoinp+(romat(k)*(a==matnums(k)));
end
4

%
pics=a+((matnums(length(matnums))+4)*(a==0));
5
%use a matrix for placing in the source cell matterial number
%us rhoinp for placing  in the source cell rho number

[sx,sy,sz]=size(pics);
pics2u=flesh*ones(2,2,2);
if ~mod(sx,2)
   gzindm=1;
   gzindp=2;
   vyindm=1;
   vyindp=2;
   zeindm=1;
   zeindp=2;
else
   gzindm=1;
   gzindp=2;
   vyindm=1;
   vyindp=2;
   zeindm=1;
   zeindp=2;
end
if ~mod(sx,2)
   sx1p=fix(sx/2)-1;
   sx1m=-(fix(sx/2));
   atxm=-(sx/2)*dimx;
   atxp=(sx/2)*dimx;
else
   sx1p=fix(sx/2);
   sx1m=-(fix(sx/2)); 
   atxm=(sx1m*dimx)-((1/2)*dimx);
   atxp=(sx1p*dimx)+((1/2)*dimx);
end
if ~mod(sy,2)
   sy1p=fix(sy/2)-1;
   sy1m=-(fix(sy/2));
   atym=-(sy/2)*dimy;
   atyp=(sy/2)*dimy;
else
   sy1p=fix(sy/2);
   sy1m=-(fix(sy/2)); 
   atym=(sy1m*dimy)-((1/2)*dimy);
   atyp=(sy1p*dimy)+((1/2)*dimy);
end
if ~mod(sz,2)
   sz1p=fix(sz/2)-1;
   sz1m=-(fix(sz/2));
   atzm=-(sz/2)*dimz;
   atzp=(sz/2)*dimz;
else
   sz1p=fix(sz/2);
   sz1m=-(fix(sz/2)); 
   atzm=(sz1m*dimz)-((1/2)*dimz);
   atzp=(sz1p*dimz)+((1/2)*dimz);
end

%% writing the MCNP Input do not modify

fid = fopen(filename,'wt');
R=sqrt((dimx^2)+(dimy^2)+(dimz^2));
fprintf(fid,'sdim simulation\n');
fprintf(fid,'c  cell defenitions\n');
%000000000000000000000000000000000000
% fprintf(fid,['30201     22  -22.42 (-1 -8 9 ):(-2 8 ):(-3 -9 ) u=1 \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% fprintf(fid,['32011     22  -22.42 (-11 -81 91 ):(-12 81 ):(-13 -91 ) u=1 \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% fprintf(fid,['32021     22  -22.42 (-21 -82 92 ):(-22 82 ):(-23 -92 ) u=1 \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% fprintf(fid,['32031     22  -22.42 (-31 -84 94 ):(-32 84 ):(-33 -94 ) u=1 \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% fprintf(fid,['32041     22  -22.42 (-41 -83 93 ):(-42 83 ):(-43 -93 ) u=1 \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% 
% fprintf(fid,['30202     24   -8.02 -4  -851 951 #30201  u=1  \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% fprintf(fid,['32012     24   -8.02 -14 -861 961 #32011 u=1 \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% fprintf(fid,['32022     24   -8.02 -24 -871 971 #32021 u=1 \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% fprintf(fid,['32032     24   -8.02 -34 -881 981 #32031 u=1 \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% fprintf(fid,['32042     24   -8.02 -44 -891 991 #32041 u=1  \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% 
% fprintf(fid,['30203     24   -6.45 -99 -951 -7  u=1  \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% fprintf(fid,['32013     24   -6.45 -99 -961 -17 u=1  \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% fprintf(fid,['32023     24   -6.45 -99 -971 -27 u=1  \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% fprintf(fid,['32033     24   -6.45 -99 -981 -37 u=1  \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% fprintf(fid,['32043     24   -6.45 -99 -991 -47 u=1  \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% 
% fprintf(fid,['30204     28 -0.001086 -99 -5 #30201 #30202 #30203     u=1 \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% fprintf(fid,['32014     28 -0.001086 -99 -15 #32011 #32012 #32013 u=1 \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% fprintf(fid,['32024     28 -0.001086 -99 -25 #32021 #32022 #32023 u=1 \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% fprintf(fid,['32034     28 -0.001086 -99 -35 #32031 #32032 #32033 u=1 \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% fprintf(fid,['32044     28 -0.001086 -99 -45 #32041 #32042 #32043 u=1 \n']);                            
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% fprintf(fid,['30205     25   -1.42 5 -6 -99   u=1 \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% fprintf(fid,['32015     25   -1.42 15 -16 -99 u=1  \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% fprintf(fid,['32025     25   -1.42 25 -26 -99 u=1  \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% fprintf(fid,['32035     25   -1.42 35 -36 -99 u=1 \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% fprintf(fid,['32045     25   -1.42 45 -46 -99 u=1  \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% fprintf(fid,['30207     25   -1.42 99 -100 u=1   \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% fprintf(fid,['30206     23   -1.06 6 16 26 36 46 -99 u=1 \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% fprintf(fid,['32016     23   -1.06 -102 -99 6 16 26 36 46 u=1 \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
% fprintf(fid,['30208     0         101 u=1 \n']);
% fprintf(fid,['          imp:n=','0',' imp:p=','0',' imp:e=','0','\n']);
% fprintf(fid,['30107     25   -1.42 100 u=1   \n']);
% fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);

format short

% alkix=mod(-(atxm-catheter_positionx),dimx);
% Ncatheter_positionx=catheter_positionx-alkix;
% alkiy=mod(-(atym-catheter_positiony),dimy);
% Ncatheter_positiony=catheter_positiony-alkiy;
% alkiz=mod(-(atzm-catheter_positionz),dimz);
% Ncatheter_positionz=catheter_positionz-alkiz;


% 
% 
% lumanxm=fix((lumanxsize/dimx)+0.0001);
% lumanym=fix((lumanysize/dimy)+0.0001);
% lumanzm=fix((lumanzsize/dimz)+0.0001);
% amindexs=fix(((-Ncatheter_positionx-atxm)/dimx)-(fix((lumanxm/2)+0.00001)-1)+0.00001);
% amindeys=fix(((-Ncatheter_positiony-atym)/dimy)-(fix((lumanym/2)+0.00001)-1)+0.00001);
% amindezs=fix(((-Ncatheter_positionz-atzm)/dimz)-(fix((lumanzm/2)+0.00001)-1)+0.00001);
% amindex=fix(((-Ncatheter_positionx-atxm)/dimx)+0.00001);
% amindey=fix(((-Ncatheter_positiony-atym)/dimy)+0.00001);
% amindez=fix(((-Ncatheter_positionz-atzm)/dimz)+0.00001);
% anonumus1=[3,4,13,15,16,18,19,21,22,24,33,34];
% anonumus=anonumus1;
% for iluman=2:lumanzm
%     anonumus=[anonumus,(anonumus1+((iluman-1)*lumanxm*lumanym))];
% end
% lenumus=length(anonumus);
% Sindmat=zeros(3,lenumus);
% for ilumat=1:lenumus
%     [Xin,Yin,Zin]=giveindex(anonumus(ilumat),lumanxm,lumanym,lumanzm);
%     Sindmat(1,ilumat)=Xin+amindexs-((amxs/2)+1);
%     Sindmat(2,ilumat)=Yin+amindeys-((amys/2)+1);
%     Sindmat(3,ilumat)=Zin+amindezs-((amzs/2)+1);
%     if mod(ilumat,12)==1||mod(ilumat,12)==2
%         Sindmat(4,ilumat)=32021;
%     elseif mod(ilumat,12)==3||mod(ilumat,12)==7
%         Sindmat(4,ilumat)=32041;
%     elseif mod(ilumat,12)==4||mod(ilumat,12)==5||mod(ilumat,12)==8||mod(ilumat,12)==9
%         Sindmat(4,ilumat)=30201;
%     elseif mod(ilumat,12)==6||mod(ilumat,12)==10
%         Sindmat(4,ilumat)=32011;
%     elseif mod(ilumat,12)==11||mod(ilumat,12)==0
%         Sindmat(4,ilumat)=32021;
%     end
% end
% anonumus=anonumus+4;
%     
% 
% lumanuniversmap=zeros(lumanxm,lumanym,lumanzm);
% fprintf(fid,(['3003 0  996 994 -997 -995 998 -999 u=2 fill=1 imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']));
unison=1;
% for bark=1:lumanzm
%     for barj=1:lumanym
%         for bari=1:lumanxm
%             if (-(lumanxsize/2)+((bari-1)*dimx))<0.0001 && (-(lumanxsize/2)+((bari-1)*dimx))>-0.0001
%                 felakat_amirx=fix((-(lumanxsize/2)+((bari-1)*dimx)+0.0002));
%             else
%                 felakat_amirx=(-(lumanxsize/2)+((bari-1)*dimx));
%             end
%             if (-(lumanysize/2)+((barj-1)*dimy))<0.0001 && (-(lumanysize/2)+((barj-1)*dimy))>-0.0001
%                 felakat_amiry=fix((-(lumanysize/2)+((barj-1)*dimy)+0.0002));
%             else
%                 felakat_amiry=(-(lumanysize/2)+((barj-1)*dimy));
%             end
%             if (-(lumanzsize/2)+((bark-1)*dimz))<0.0001 && (-(lumanzsize/2)+((bark-1)*dimz))>-0.0001
%                 felakat_amirz=fix((-(lumanzsize/2)+((bark-1)*dimz)+0.0002));
%             else
%                 felakat_amirz=(-(lumanzsize/2)+(((bark-1)*dimz)));
%             end
%             fprintf(fid,[num2str(unison+3),' like 3003 but trcl (',num2str(felakat_amirx),' ',num2str(felakat_amiry),' ',num2str(felakat_amirz),') u=',num2str(unison+3),'\n'])
%             lumanuniversmap(bari,barj,bark)=unison+3;
%             unison=unison+1;
%         end
%     end
% end
pics=pics+4000;
subplot(1,2,1)
imagesc(pics(:,:,8))

% pics(amindexs:amindexs+lumanxm-1,amindeys:amindeys+lumanym-1,amindezs:amindezs+lumanzm-1)=lumanuniversmap(:,:,:);
subplot(1,2,2)
imagesc(pics(:,:,8))

format long
% pics(gzindp,vyindm,zeindm)=99998;
% pics(gzindm,vyindm,zeindm)=99997;
% pics(gzindm,vyindp,zeindm)=99996;
% pics(gzindp,vyindp,zeindp)=99995;
% pics(gzindp,vyindm,zeindp)=99994;
% pics(gzindm,vyindm,zeindp)=99993;
% pics(gzindm,vyindp,zeindp)=99992;


% 0  0
% 1  0




%^#^#^#^#^#^#^#^#^#^^#^^#^#^^#^#^#^#^#^#^#^#^#^#^^^##^#^#^^

%^#^#^#^#^#^#^#^#^#^^#^^#^#^^#^#^#^#^#^#^#^#^#^#^^^##^#^#^^






ap=length(matnums)+1;
% fprintf(fid,[num2str(matnums(length(matnums))+4004),' 0 ','-221',' ','u=',num2str(matnums(length(matnums))+4004),' ','imp:',xmode,'=0',' ','imp:',mode,'=1 imp:e=',emode,'\n']);
aj=2;
while aj<ap
    fprintf(fid,[num2str(matnums(aj)+4000),' ',num2str(dsicedmat(aj)),' ',num2str(-romat(aj)),' ','-221',' ','u=',num2str(matnums(aj)+4000),' ','imp:',xmode,'=0',' ','imp:',mode,'=1 imp:e=',emode]);
    fprintf(fid,'\n');
    aj=aj+1;
end
fprintf(fid,[num2str(matnums(aj-1)+1),' ','0',' ','2210 -2211 2212 -2213 2214 -2215 ','lat=1 ','u=',num2str(matnums(aj-1)+1),' ','imp:',xmode,'=0',' ','imp:',mode,'=1 imp:e=',emode]);
fprintf(fid,'\n');    
fprintf(fid,['     fill=',num2str(sx1m),':',num2str(sx1p),' ',num2str(sy1m),':',num2str(sy1p),' ',num2str(sz1m),':',num2str(sz1p)]);
fprintf(fid,'\n');    
h = waitbar(0,'Please wait...');
ts=(sx*sy*sz);
i=1;


while i<=ts
    str='    ';
    while length(str)<(70-length(num2str((ts)-i)))
        str=[str,' ',num2str(pics(i))];
        i=i+1;
        waitbar((i/ts),h)
        if i>ts
            break
        end            
        j=0;
        while pics(i)==pics(i-1)
            j=j+1;
            i=i+1;
            if i>(ts)
                break
            end
        end
        if j==1
            str=[str,' ',num2str(pics(i-1))];
        elseif j>1
            str=[str,' ',num2str(j),'R'];
        end
        if i>ts
            break
        end
    end
    fprintf(fid,str);
    fprintf(fid,'\n');
end
fprintf(fid,[num2str(matnums(aj-1)+2),' 0  2216 -2217 2218 -2219 2220 -2221 fill=',num2str(matnums(aj-1)+1),' ','imp:',xmode,'=0',' ','imp:',mode,'=1 imp:e=',emode,'\n']);
fprintf(fid,[num2str(matnums(aj-1)+3),' 0  -2216 : 2217 : -2218 : 2219 : -2220 : 2221 ','imp:',xmode,'=0',' ','imp:',mode,'=0 imp:e=0','\n']);
fprintf(fid,'\n');
fprintf(fid,'c surface defenitions\n');
fprintf(fid,'c small latice surfaces\n');
if ~mod(sz,2)
   fprintf(fid,['221 s ',num2str(latxmin/2),' ',num2str(latymin/2),' ',num2str(latzmin/2),' ',num2str(R),'\n']);
else
   fprintf(fid,['221 so ',num2str(R),'\n']);
end
fprintf(fid,['2210 px ',num2str(latxmin),'\n']);
fprintf(fid,['2211 px ',num2str(latxmax),'\n']);
fprintf(fid,['2212 py ',num2str(latymin),'\n']);
fprintf(fid,['2213 py ',num2str(latymax),'\n']);
fprintf(fid,['2214 pz ',num2str(latzmin),'\n']);
fprintf(fid,['2215 pz ',num2str(latzmax),'\n']);
fprintf(fid,'c bigger latice surfaces\n');
fprintf(fid,['2216 px ',num2str(atxm),'\n']);
fprintf(fid,['2217 px ',num2str(atxp),'\n']);
fprintf(fid,['2218 py ',num2str(atym),'\n']);
fprintf(fid,['2219 py ',num2str(atyp),'\n']);
fprintf(fid,['2220 pz ',num2str(atzm),'\n']);
fprintf(fid,['2221 pz ',num2str(atzp),'\n']);
% sorce surfaces


fprintf(fid,['101        so 5  \n']);
fprintf(fid,['103        so 4.5  \n']);
fprintf(fid,['104        so 4  \n']);
fprintf(fid,['105        so 3.5  \n']);
fprintf(fid,['106        so 3  \n']);

% fprintf(fid,['999    pz  ',num2str((lumanzsize/2)+0.8),' \n']);
% fprintf(fid,['998    pz ',num2str(-(lumanzsize/2)-0.8),' \n']);
% fprintf(fid,['997    py  ',num2str((lumanysize/2)+0.6),' \n']);
% fprintf(fid,['996    py ',num2str(-(lumanysize/2)-0.6),' \n']);
% fprintf(fid,['995    px  ',num2str((lumanxsize/2)+0.6),' \n']);
% fprintf(fid,['994    px ',num2str(-(lumanxsize/2)-0.6),' \n']);
%fprintf(fid,['899    pz  0.4 \n']);
%fprintf(fid,['898    pz -0.4 \n']);
%fprintf(fid,['897    py  0.3 \n']);
%fprintf(fid,['896    py -0.3 \n']);
%fprintf(fid,['895    px  0.3 \n']);
%fprintf(fid,['894    px -0.3 \n']);
%fprintf(fid,['799    pz  1.2 \n']);
%fprintf(fid,['798    pz -1.2 \n']);
%fprintf(fid,['797    py  0.9 \n']);
%fprintf(fid,['796    py -0.9 \n']);
%fprintf(fid,['795    px  0.9 \n']);
%fprintf(fid,['794    px -0.9 \n']);







%^#^#^#^#^#^#^#^#^#^#^^#^#^#^#^#^#^#^#^#^#^^#^#^#^#^#^#^#^#^#^#^#^#^#^#^
%^#^#^#^#^#^#^#^#^#^#^^#^#^#^#^#^#^#^#^#^#^^#^#^#^#^#^#^#^#^#^#^#^#^#^#^
fprintf(fid,'\n');
if isequal (emode,'1')
    fprintf(fid,'mode p e\n');
elseif isequal (emode,'0')
    fprintf(fid,'mode p\n');
end



fprintf(fid,['sdef  pos=d2  axs=0 0 1 rad=0.017\n']);
fprintf(fid,['       ext=d65 erg=d35 par 2\n']);
fprintf(fid,['si2 S 0 \n']);
fprintf(fid,['sp2   1 \n']);
fprintf(fid,['c  Changes with dwellings \n']);
% this must be made dependent on the position of the source
% amirf=num2str(Ncatheter_positionx+0)
% amirf2=num2str(Ncatheter_positiony+0)
format short

% this is the mesh tally for MCNP5
fprintf(fid,['fmesh4:p geom=xyz origin=',num2str(meshminxgrid),' ',num2str(meshminygrid),' ',num2str(meshminzgrid),'\n']);
fprintf(fid,['         imesh=0 ', num2str(meshmaxxgrid),' iints=',num2str(meshxsize/2),' ', num2str(meshxsize/2),'\n']);
fprintf(fid,['         jmesh=0 ', num2str(meshmaxygrid),' jints=',num2str(meshysize/2),' ', num2str(meshysize/2),'\n']);
fprintf(fid,['         kmesh=0 ', num2str(meshmaxzgrid),' kints=',num2str(meshzsize/2),' ', num2str(meshzsize/2),'\n']);
fprintf(fid,'         out=ij\n');

fprintf(fid,['DE4  1.0000E-02  1.5000E-02  2.0000E-02  3.0000E-02   \n']);
fprintf(fid,['     4.0000E-02  5.0000E-02   \n']);
fprintf(fid,['     6.0000E-02  8.0000E-02  1.0000E-01  1.5000E-01   \n']);
fprintf(fid,['     2.0000E-01  3.0000E-01  4.0000E-01  5.0000E-01   \n']);
fprintf(fid,['     6.0000E-01  8.0000E-01  1.0000      1.5000   \n']);
fprintf(fid,['     2.0000      3.0000      4.0000      5.0000   \n']);
fprintf(fid,['     6.0000      8.0000      10.0000 \n']);
fprintf(fid,['DF4  2.780E-06   1.110E-06  5.880E-07   2.560E-07  \n']);
fprintf(fid,['       1.5600E-07  1.200E-07  \n']);
fprintf(fid,['       1.1100E-07  1.200E-07  1.470E-07   2.380E-07  \n']);
fprintf(fid,['       3.4500E-07  5.560E-07  7.690E-07   9.09E-07  \n']);
fprintf(fid,['       1.140E-06   1.470E-06  1.790E-6    2.440E-06  \n']);
fprintf(fid,['       3.030E-06   4.000E-06  4.760E-6    5.560E-06  \n']);
fprintf(fid,['       6.250E-06   7.690E-06  9.090E-06  \n']);

% this is the mesh tally for MCNPX uncomment if you want to use it
%fprintf(fid,'tmesh\n');
%fprintf(fid,'rmesh1:p   dose\n');
%fprintf(fid,['cora1    ',num2str(meshminxgrid),' ',num2str(meshxsize-1),'i ', num2str(meshmaxxgrid),'\n']);
%fprintf(fid,['corb1    ',num2str(meshminygrid),' ',num2str(meshysize-1),'i ', num2str(meshmaxygrid),'\n']);
%fprintf(fid,['corc1    ',num2str(meshminzgrid),' ',num2str(meshzsize-1),'i ', num2str(meshmaxzgrid),'\n']);
%fprintf(fid,'endmd\n');
%matterial
i1=1;
while i1<=lsm
    fprintf(fid,['   m',num2str(selectedmatterial(i1)),' ',num2str(mat_compos_mat(1,1,(selectedmatterial(i1)))),' ',num2str(-mat_compos_mat(1,2,(selectedmatterial(i1)))),'\n']);
    i2=2;
    while mat_compos_mat(i2,1,(selectedmatterial(i1)))~=0
        fprintf(fid,['      ',num2str(mat_compos_mat(i2,1,(selectedmatterial(i1)))),' ',num2str(-mat_compos_mat(i2,2,(selectedmatterial(i1)))),'\n']);
        i2=i2+1;
    end
    i1=i1+1;
end
fprintf(fid,'m21    25000.            -0.02  $MAT\n');
fprintf(fid,'      14000.      -0.01 24000.  -0.17 28000.  -0.12 \n');
fprintf(fid,'      26000.            -0.68 \n');
fprintf(fid,'c Ir-192 pure cylindrical source  \n');
fprintf(fid,'c rho = 22.42 g/cc                \n');
fprintf(fid,'m22    77192.                1  $MAT\n');
fprintf(fid,'m24    22000.           -0.558  $ NITI material wire\n');
fprintf(fid,'      26000.           -0.442 \n');
fprintf(fid,'m25    1000.         -0.026362  $  Lumen made of KAPTON\n');
fprintf(fid,'      6012.    -0.691133 7014.    -0.07327 8016.    -0.209235 \n');
fprintf(fid,'m26    7000.             -0.72  $  Air\n');
fprintf(fid,'      8016.             -0.28 \n');
fprintf(fid,'m27    1000.                 2  $  water\n');
fprintf(fid,'      8000.                 1 \n');
fprintf(fid,'m23    1001.            -0.105  $soft tissue\n');
fprintf(fid,'      6000.    -0.414 7014.    -0.034 8016.       -0.439 \n');
fprintf(fid,'      15031.   -0.001 16032.    -0.002 17000.     -0.002 \n');
fprintf(fid,'      19000.   -0.002 26000.    -0.001 \n');
fprintf(fid,'m28    7000.             -0.79  $air (At tucson lelvation=2584 ft)\n');
fprintf(fid,'      8000.             -0.21 \n');

    fprintf(fid,'   m889 53000 -1\n');
    fprintf(fid,'   m888 22000 -1\n');
fprintf(fid,['nps   ',num2str(partnum2sim),'\n']);
toc
close(h);
fclose(fid);
tic
while toc<wrightwait
end

end
