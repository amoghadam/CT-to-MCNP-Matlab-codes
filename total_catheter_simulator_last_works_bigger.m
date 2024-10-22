% chek KVP120
%catheter_simulate
% catheter_positionx=-0.2;
% catheter_positiony=-0.4;
% catheter_positionz=-0.3;
AAxdim=0.2;
AAydim=0.2;
AAzdim=0.2;
%XCC is the x index of the center of catheter  when plotting
%nypic(:,:,center) (it is shon by Y: when using data tips on fig
XCC=69;
%YCC is the y index of the center of catheter  when plotting
%nypic(:,:,center) (it is shon by X: when using data tips on fig
YCC=40;
%ZCC is the y index of the center of catheter  when plotting
%imagesc(xpic(:,:,YCC)) (it is shon by X: when using data tips on fig
ZCC=42;
% 
[XAC,YAC,ZAC]=size(nypic);
catheter_positionx=(-(XCC-(XAC/2)))*AAxdim
catheter_positiony=(-((YCC-((YAC/2)+1))))*AAydim
catheter_positionz=((ZCC-(ZAC/2)))*AAzdim
presenceof1=0;
presenceof2=0;
presenceof3=0;
presenceof4=0;
presenceof5=1;
lumanxsize=1.2;
lumanysize=1.2;
lumanzsize=4.8;
% catheter_positionx=6.6;
% catheter_positiony=0.4;
% catheter_positionz=-3.4;
if presenceof1
    source1_rel_pos=0.2;
    amnspd1=' d4'
    amnspd1p=' 1'
else
    source1_rel_pos=-lumanzsize-0.8;
    amnspd1=''
    amnspd1p=''
end
if presenceof2
    source2_rel_pos=-0.2;
    amnspd2=' d5'
    amnspd2p=' 1'
else
    source2_rel_pos=-lumanzsize-0.8;
    amnspd2=''
    amnspd2p=''
end
if presenceof3
    source3_rel_pos=0.6;
    amnspd3=' d7'
    amnspd3p=' 1'
else
    source3_rel_pos=-lumanzsize-0.8;
    amnspd3=''
    amnspd3p=''
end
if presenceof4
    source4_rel_pos=-0.4;
    amnspd4=' d6'
    amnspd4p=' 1'
else
    source4_rel_pos=-lumanzsize-0.8;
    amnspd4=''
    amnspd4p=''
end
if presenceof5
    source5_rel_pos=0;
    amnspd5=' d3'
    amnspd5p=' 1'
else
    source5_rel_pos=-lumanzsize-0.8;
    amnspd5=''
    amnspd5p=''
end

% source2_rel_pos=0.431;
% source3_rel_pos=0.345;
% source4_rel_pos=0.542;
% source5_rel_pos=0.487;
% pic(:,:,107:end)=[];
% pic(:,:,1:62)=[];
% positions_prob(:,:,107:end)=[];
% positions_prob(:,:,1:62)=[];
% positions_prob(140:end,:,:)=[];
% positions_prob(:,140:end,:)=[];
% positions_prob(1:107,:,:)=[];
% positions_prob(:,1:107,:)=[];
%to limit cath for test
% pic(50:end,:,:)=[];
% pic(:,80:end,:)=[];
% pic(1:21,:,:)=[];
% pic(:,1:41,:)=[];
%


% pic(:,:,113:end)=[];
% pic(:,:,1:56)=[];
% positions_prob(:,:,113:end)=[];
% positions_prob(:,:,1:56)=[];
% pic(150:end,:,:)=[];
% pic(:,150:end,:)=[];
% positions_prob(150:end,:,:)=[];
% positions_prob(:,150:end,:)=[];
% pic(1:107,:,:)=[];
% pic(:,1:107,:)=[];
% positions_prob(1:107,:,:)=[];
% positions_prob(:,1:107,:)=[];
% return
% prepare for training 1st

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
    lastrun.maxima=1400;
    %^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    
    lastrun.minimin=-1000;
    maxima=lastrun.maxima;
    minimin=lastrun.minimin;
    
    %&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    %                                      -150
    lastrun.mat_discriminator= [ minimin  -880    -150  -2  1  185     maxima ];
    flesh=1080;
    %^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    
    lastrun.selectedmatterial=[ 1  11   10  8  4  5 ];
    
    %&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    [amxs,amys,amzs]=size(pic);
    lastrun.xsize=amxs;
    lastrun.ysize=amys;
    lastrun.zsize=amzs;
    lastrun.meshxsize=amxs;
    lastrun.meshysize=amys;
    lastrun.meshzsize=amzs;
    %&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    lastrun.meshxsize2=2;
    lastrun.meshysize2=2;
    lastrun.meshzsize2=2;
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


    lastrun.dimx=0.2;
    lastrun.dimy=0.2;
    lastrun.dimz=0.2;
    lastrun.meshdimx=0.2;
    lastrun.meshdimy=0.2;
    lastrun.meshdimz=0.2;
    %^^^^^^^^^^^^^^^^^^^^^^^^
    
    lastrun.meshdimx2=0.6;
    lastrun.meshdimy2=0.6;
    lastrun.meshdimz2=0.6;
    lastrun.alphabet=1;
    lastrun.savefilename=['patient1','.mat'];
xsize=lastrun.xsize;
ysize=lastrun.ysize;
zsize=lastrun.zsize;    
meshxsize=lastrun.meshxsize;
meshysize=lastrun.meshysize;
meshzsize=lastrun.meshzsize;
meshxsize2=lastrun.meshxsize2;
meshysize2=lastrun.meshysize2;
meshzsize2=lastrun.meshzsize2;
%rhodata=zeros((xsize*ysize*zsize),1);
%picdata=zeros((xsize*ysize*zsize),1);
dosedata=zeros((meshxsize*meshysize*meshzsize),1);
erordata=zeros((meshxsize*meshysize*meshzsize),1);
dosedata2=zeros((meshxsize2*meshysize2*meshzsize2),1);
erordata2=zeros((meshxsize2*meshysize2*meshzsize2),1);



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
meshxsize2=lastrun.meshxsize2;
meshysize2=lastrun.meshysize2;
meshzsize2=lastrun.meshzsize2;
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
meshdimx2=lastrun.meshdimx2;
meshdimy2=lastrun.meshdimy2;
meshdimz2=lastrun.meshdimz2;
alphabet=lastrun.alphabet;
savefilename=lastrun.savefilename;
%partnum2sim=1000000000;
%numberofsymiulations=1;
%airloestden=-1000;
%maxima=2400;
%minimin=-1000;
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
meshminxgrid2=-(meshxsize2*meshdimx2)/2;
meshminygrid2=-(meshysize2*meshdimy2)/2;
meshminzgrid2=-(meshzsize2*meshdimz2)/2;
meshmaxxgrid2=(meshxsize2*meshdimx2)/2;
meshmaxygrid2=(meshysize2*meshdimy2)/2;
meshmaxzgrid2=(meshzsize2*meshdimz2)/2;
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
    
%generation of matterial mattrix modify for nonrandom self destined cases
%a=fix((maxmatnum+1)*rand(xsize,ysize,zsize));
%pic=fix((differa*rand(xsize,ysize,zsize))+minimin);

%drawnow

drawnow

%pic=(pic>=airloestden).*double(pic);
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
%reshapedrhoinp= reshape(rhoinp,(xsize*ysize*zsize),1);
%reshapedpicinp= reshape(pici1,(xsize*ysize*zsize),1);
%rhodata(:,inum)=reshapedrhoinp;
%picdata(:,inum)=reshapedpicinp;
if 0
miuinp=zeros(xsize,ysize,zsize);
miuinp_at20=zeros(xsize,ysize,zsize);
for k=1:length(matnums)
miuinp=miuinp+(mius_over_ros_mat(k)*(a==matnums(k)));
miuinp_at20=miuinp_at20+(mius_over_ros_mat_at20(k)*(a==matnums(k)));
end
reshapedmiuinp= reshape(miuinp,(xsize*ysize*zsize),1);
reshapedmiuinp_at20= reshape(miuinp_at20,(xsize*ysize*zsize),1);
miuhudata(:,inum)=reshapedmiuinp;
miuhudata_at20(:,inum)=reshapedmiuinp_at20;
end
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


fid = fopen(filename,'wt');
R=sqrt((dimx^2)+(dimy^2)+(dimz^2));
fprintf(fid,'sdim simulation\n');
fprintf(fid,'c  cell defenitions\n');
%000000000000000000000000000000000000
fprintf(fid,['30201     22  -22.42 (-1 -8 9 ):(-2 8 ):(-3 -9 ) u=1 \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
fprintf(fid,['32011     22  -22.42 (-11 -81 91 ):(-12 81 ):(-13 -91 ) u=1 \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
fprintf(fid,['32021     22  -22.42 (-21 -82 92 ):(-22 82 ):(-23 -92 ) u=1 \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
fprintf(fid,['32031     22  -22.42 (-31 -84 94 ):(-32 84 ):(-33 -94 ) u=1 \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
fprintf(fid,['32041     22  -22.42 (-41 -83 93 ):(-42 83 ):(-43 -93 ) u=1 \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);

fprintf(fid,['30202     24   -8.02 -4  -851 951 #30201  u=1  \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
fprintf(fid,['32012     24   -8.02 -14 -861 961 #32011 u=1 \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
fprintf(fid,['32022     24   -8.02 -24 -871 971 #32021 u=1 \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
fprintf(fid,['32032     24   -8.02 -34 -881 981 #32031 u=1 \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
fprintf(fid,['32042     24   -8.02 -44 -891 991 #32041 u=1  \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);

fprintf(fid,['30203     24   -6.45 -99 -951 -7  u=1  \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
fprintf(fid,['32013     24   -6.45 -99 -961 -17 u=1  \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
fprintf(fid,['32023     24   -6.45 -99 -971 -27 u=1  \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
fprintf(fid,['32033     24   -6.45 -99 -981 -37 u=1  \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
fprintf(fid,['32043     24   -6.45 -99 -991 -47 u=1  \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);

fprintf(fid,['30204     28 -0.001086 -99 -5 #30201 #30202 #30203     u=1 \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
fprintf(fid,['32014     28 -0.001086 -99 -15 #32011 #32012 #32013 u=1 \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
fprintf(fid,['32024     28 -0.001086 -99 -25 #32021 #32022 #32023 u=1 \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
fprintf(fid,['32034     28 -0.001086 -99 -35 #32031 #32032 #32033 u=1 \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
fprintf(fid,['32044     28 -0.001086 -99 -45 #32041 #32042 #32043 u=1 \n']);                            
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
fprintf(fid,['30205     25   -1.42 5 -6 -99   u=1 \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
fprintf(fid,['32015     25   -1.42 15 -16 -99 u=1  \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
fprintf(fid,['32025     25   -1.42 25 -26 -99 u=1  \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
fprintf(fid,['32035     25   -1.42 35 -36 -99 u=1 \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
fprintf(fid,['32045     25   -1.42 45 -46 -99 u=1  \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
fprintf(fid,['30207     25   -1.42 99 -100 u=1   \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
fprintf(fid,['30206     23   -1.06 6 16 26 36 46 -99 u=1 \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
fprintf(fid,['32016     23   -1.06 -102 -99 6 16 26 36 46 u=1 \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);
fprintf(fid,['30208     0         101 u=1 \n']);
fprintf(fid,['          imp:n=','0',' imp:p=','0',' imp:e=','0','\n']);
fprintf(fid,['30107     25   -1.42 100 u=1   \n']);
fprintf(fid,['          imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']);

format short

alkix=mod(-(atxm-catheter_positionx),dimx);
Ncatheter_positionx=catheter_positionx-alkix;
alkiy=mod(-(atym-catheter_positiony),dimy);
Ncatheter_positiony=catheter_positiony-alkiy;
alkiz=mod(-(atzm-catheter_positionz),dimz);
Ncatheter_positionz=catheter_positionz-alkiz;




lumanxm=fix((lumanxsize/dimx)+0.0001);
lumanym=fix((lumanysize/dimy)+0.0001);
lumanzm=fix((lumanzsize/dimz)+0.0001);
amindexs=fix(((-Ncatheter_positionx-atxm)/dimx)-(fix((lumanxm/2)+0.00001)-1)+0.00001);
amindeys=fix(((-Ncatheter_positiony-atym)/dimy)-(fix((lumanym/2)+0.00001)-1)+0.00001);
amindezs=fix(((-Ncatheter_positionz-atzm)/dimz)-(fix((lumanzm/2)+0.00001)-1)+0.00001);
amindex=fix(((-Ncatheter_positionx-atxm)/dimx)+0.00001);
amindey=fix(((-Ncatheter_positiony-atym)/dimy)+0.00001);
amindez=fix(((-Ncatheter_positionz-atzm)/dimz)+0.00001);
anonumus1=[3,4,13,15,16,18,19,21,22,24,33,34];
anonumus=anonumus1;
for iluman=2:lumanzm
    anonumus=[anonumus,(anonumus1+((iluman-1)*lumanxm*lumanym))];
end
lenumus=length(anonumus);
Sindmat=zeros(3,lenumus);
for ilumat=1:lenumus
    [Xin,Yin,Zin]=giveindex(anonumus(ilumat),lumanxm,lumanym,lumanzm);
    Sindmat(1,ilumat)=Xin+amindexs-((amxs/2)+1);
    Sindmat(2,ilumat)=Yin+amindeys-((amys/2)+1);
    Sindmat(3,ilumat)=Zin+amindezs-((amzs/2)+1);
    if mod(ilumat,12)==1||mod(ilumat,12)==2
        Sindmat(4,ilumat)=32021;
    elseif mod(ilumat,12)==3||mod(ilumat,12)==7
        Sindmat(4,ilumat)=32041;
    elseif mod(ilumat,12)==4||mod(ilumat,12)==5||mod(ilumat,12)==8||mod(ilumat,12)==9
        Sindmat(4,ilumat)=30201;
    elseif mod(ilumat,12)==6||mod(ilumat,12)==10
        Sindmat(4,ilumat)=32011;
    elseif mod(ilumat,12)==11||mod(ilumat,12)==0
        Sindmat(4,ilumat)=32021;
    end
end
anonumus=anonumus+4;
    

lumanuniversmap=zeros(lumanxm,lumanym,lumanzm);
fprintf(fid,(['3003 0  996 994 -997 -995 998 -999 u=2 fill=1 imp:n=',nmode,' imp:p=',phmode,' imp:e=',emode,'\n']));
unison=1;
for bark=1:lumanzm
    for barj=1:lumanym
        for bari=1:lumanxm
            if (-(lumanxsize/2)+((bari-1)*dimx))<0.0001 && (-(lumanxsize/2)+((bari-1)*dimx))>-0.0001
                felakat_amirx=fix((-(lumanxsize/2)+((bari-1)*dimx)+0.0002));
            else
                felakat_amirx=(-(lumanxsize/2)+((bari-1)*dimx));
            end
            if (-(lumanysize/2)+((barj-1)*dimy))<0.0001 && (-(lumanysize/2)+((barj-1)*dimy))>-0.0001
                felakat_amiry=fix((-(lumanysize/2)+((barj-1)*dimy)+0.0002));
            else
                felakat_amiry=(-(lumanysize/2)+((barj-1)*dimy));
            end
            if (-(lumanzsize/2)+((bark-1)*dimz))<0.0001 && (-(lumanzsize/2)+((bark-1)*dimz))>-0.0001
                felakat_amirz=fix((-(lumanzsize/2)+((bark-1)*dimz)+0.0002));
            else
                felakat_amirz=(-(lumanzsize/2)+(((bark-1)*dimz)));
            end
            fprintf(fid,[num2str(unison+3),' like 3003 but trcl (',num2str(felakat_amirx),' ',num2str(felakat_amiry),' ',num2str(felakat_amirz),') u=',num2str(unison+3),'\n'])
            lumanuniversmap(bari,barj,bark)=unison+3;
            unison=unison+1;
        end
    end
end
pics=pics+4000;
subplot(1,2,1)
imagesc(pics(:,:,8))

pics(amindexs:amindexs+lumanxm-1,amindeys:amindeys+lumanym-1,amindezs:amindezs+lumanzm-1)=lumanuniversmap(:,:,:);
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
if 0
fprintf(fid,['99999 889 ',num2str(-Irho),' -999 -987 u=99999 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
fprintf(fid,['99998 888 ',num2str(-sylvrho),' -998 999 -986 u=99999 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
fprintf(fid,['99997 888 ',num2str(-sylvrho),' -999 -986 987 u=99999 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
if (sum((pics(gzindp,vyindp,zeindm)==matnums).*dsicedmat))
fprintf(fid,['99996 ',num2str(sum((pics(gzindp,vyindp,zeindm)==matnums).*dsicedmat)),' ',num2str(-sum((pics(gzindp,vyindp,zeindm)==matnums).*romat)),' #99999 #99998 #99997 u=99999 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
else
fprintf(fid,['99996 ',num2str(sum((pics(gzindp,vyindp,zeindm)==matnums).*dsicedmat)),' #99999 #99998 #99997 u=99999 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
end
% 1  0
% 0  0
fprintf(fid,['99995 889 ',num2str(-Irho),' -997 -987 u=99998 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
fprintf(fid,['99994 888 ',num2str(-sylvrho),' -996 997 -986 u=99998 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
fprintf(fid,['99993 888 ',num2str(-sylvrho),' -997 -986 987 u=99998 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
if (sum((pics(gzindp,vyindm,zeindm)==matnums).*dsicedmat))
fprintf(fid,['99992 ',num2str(sum((pics(gzindp,vyindm,zeindm)==matnums).*dsicedmat)),' ',num2str(-sum((pics(gzindp,vyindm,zeindm)==matnums).*romat)),' #99995 #99994 #99993 u=99998 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
else
fprintf(fid,['99992 ',num2str(sum((pics(gzindp,vyindm,zeindm)==matnums).*dsicedmat)),' #99995 #99994 #99993 u=99998 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
end
% 0  1
% 0  0
fprintf(fid,['99991 889 ',num2str(-Irho),' -995 -987 u=99997 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
fprintf(fid,['99990 888 ',num2str(-sylvrho),' -994 995 -986 u=99997 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
fprintf(fid,['99989 888 ',num2str(-sylvrho),' -995 -986 987 u=99997 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
if (sum((pics(gzindm,vyindm,zeindm)==matnums).*dsicedmat))
%fprintf(fid,['99988 ',num2str(a(gzindm,vyindm,zeindm)),' ',num2str(0.04),' #99991 #99990 #99989 u=99997 imp:n=0 imp:p=1','\n']);
fprintf(fid,['99988 ',num2str(sum((pics(gzindm,vyindm,zeindm)==matnums).*dsicedmat)),' ',num2str(-sum((pics(gzindm,vyindm,zeindm)==matnums).*romat)),' #99991 #99990 #99989 u=99997 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
else
fprintf(fid,['99988 ',num2str(sum((pics(gzindm,vyindm,zeindm)==matnums).*dsicedmat)),' #99991 #99990 #99989 u=99997 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
end
% 0  0
% 0  1
fprintf(fid,['99987 889 ',num2str(-Irho),' -993 -987 u=99996 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
fprintf(fid,['99986 888 ',num2str(-sylvrho),' -992 993 -986 u=99996 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
fprintf(fid,['99985 888 ',num2str(-sylvrho),' -993 -986 987 u=99996 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
if (sum((pics(gzindm,vyindp,zeindm)==matnums).*dsicedmat))
%fprintf(fid,['99984 ',num2str(a(gzindm,vyindp,zeindm)),' ',num2str(0.04),' #99987 #99986 #99985 u=99996 imp:n=0 imp:p=1','\n']);
fprintf(fid,['99984 ',num2str(sum((pics(gzindm,vyindp,zeindm)==matnums).*dsicedmat)),' ',num2str(-sum((pics(gzindm,vyindp,zeindm)==matnums).*romat)),' #99987 #99986 #99985 u=99996 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
else
fprintf(fid,['99984 ',num2str(sum((pics(gzindm,vyindp,zeindm)==matnums).*dsicedmat)),' #99987 #99986 #99985 u=99996 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
end
%
fprintf(fid,['99979 889 ',num2str(-Irho),' -999 989 u=99995 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
fprintf(fid,['99978 888 ',num2str(-sylvrho),' -998 999 988 u=99995 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
fprintf(fid,['99977 888 ',num2str(-sylvrho),' -999 988 -989 u=99995 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
if (sum((pics(gzindp,vyindp,zeindp)==matnums).*dsicedmat))
%fprintf(fid,['99976 ',num2str(a(gzindp,vyindp,zeindp)),' ',num2str(0.04),' #99979 #99978 #99977 u=99995 imp:n=0 imp:p=1','\n']);
fprintf(fid,['99976 ',num2str(sum((pics(gzindp,vyindp,zeindp)==matnums).*dsicedmat)),' ',num2str(-sum((pics(gzindp,vyindp,zeindp)==matnums).*romat)),' #99979 #99978 #99977 u=99995 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
else
fprintf(fid,['99976 ',num2str(sum((pics(gzindp,vyindp,zeindp)==matnums).*dsicedmat)),' #99979 #99978 #99977 u=99995 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
end
% 1  0
% 0  0
fprintf(fid,['99975 889 ',num2str(-Irho),' -997 989 u=99994 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
fprintf(fid,['99974 888 ',num2str(-sylvrho),' -996 997 988 u=99994 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
fprintf(fid,['99973 888 ',num2str(-sylvrho),' -997 988 -989 u=99994 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
if (sum((pics(gzindp,vyindm,zeindp)==matnums).*dsicedmat))
%fprintf(fid,['99972 ',num2str(a(gzindp,vyindm,zeindp)),' ',num2str(0.04),' #99975 #99974 #99973 u=99994 imp:n=0 imp:p=1','\n']);
fprintf(fid,['99972 ',num2str(sum((pics(gzindp,vyindm,zeindp)==matnums).*dsicedmat)),' ',num2str(-sum((pics(gzindp,vyindm,zeindp)==matnums).*romat)),' #99975 #99974 #99973 u=99994 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
else
fprintf(fid,['99972 ',num2str(sum((pics(gzindp,vyindm,zeindp)==matnums).*dsicedmat)),' #99975 #99974 #99973 u=99994 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
end
% 0  1
% 0  0
fprintf(fid,['99971 889 ',num2str(-Irho),' -995 989 u=99993 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
fprintf(fid,['99970 888 ',num2str(-sylvrho),' -994 995 988 u=99993 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
fprintf(fid,['99969 888 ',num2str(-sylvrho),' -995 988 -989 u=99993 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
if (sum((pics(gzindm,vyindm,zeindp)==matnums).*dsicedmat))
%fprintf(fid,['99968 ',num2str(a(gzindm,vyindm,zeindp)),' ',num2str(0.04),' #99971 #99970 #99969 u=99993 imp:n=0 imp:p=1','\n']);
fprintf(fid,['99968 ',num2str(sum((pics(gzindm,vyindm,zeindp)==matnums).*dsicedmat)),' ',num2str(-sum((pics(gzindm,vyindm,zeindp)==matnums).*romat)),' #99971 #99970 #99969 u=99993 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
else
fprintf(fid,['99968 ',num2str(sum((pics(gzindm,vyindm,zeindp)==matnums).*dsicedmat)),' #99971 #99970 #99969 u=99993 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
end
% 0  0
% 0  1
fprintf(fid,['99967 889 ',num2str(-Irho),' -993 989 u=99992 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
fprintf(fid,['99966 888 ',num2str(-sylvrho),' -992 993 988 u=99992 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
fprintf(fid,['99965 888 ',num2str(-sylvrho),' -993 988 -989 u=99992 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
if (sum((pics(gzindm,vyindp,zeindp)==matnums).*dsicedmat))
%fprintf(fid,['99964 ',num2str(a(gzindm,vyindp,zeindp)),' ',num2str(0.04),' #99967 #99966 #99965 u=99992 imp:n=0 imp:p=1','\n']);
fprintf(fid,['99964 ',num2str(sum((pics(gzindm,vyindp,zeindp)==matnums).*dsicedmat)),' ',num2str(-sum((pics(gzindm,vyindp,zeindp)==matnums).*romat)),' #99967 #99966 #99965 u=99992 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
else
fprintf(fid,['99964 ',num2str(sum((pics(gzindm,vyindp,zeindp)==matnums).*dsicedmat)),' #99967 #99966 #99965 u=99992 imp:n=0 imp:p=1 imp:e=',emode,'\n']);
end
end
%^#^#^#^#^#^#^#^#^#^^#^^#^#^^#^#^#^#^#^#^#^#^#^#^^^##^#^#^^






ap=length(matnums)+1;
fprintf(fid,[num2str(matnums(length(matnums))+4004),' 0 ','-221',' ','u=',num2str(matnums(length(matnums))+4004),' ','imp:',xmode,'=0',' ','imp:',mode,'=1 imp:e=',emode,'\n']);
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

fprintf(fid,['1        cz 0.017  $ sources 5 \n']);
fprintf(fid,['11       c/z 0.5 0 0.017 $ sources 1 \n']);
fprintf(fid,['21       c/z 0 0.5 0.017 $ sources 2 \n']);
fprintf(fid,['31       c/z 0 -0.5 0.017  $ sources 4  \n']);
fprintf(fid,['41       c/z -0.5 0 0.017 $ sources 3  \n']);

fprintf(fid,['4        cz 0.0295  $ Capsules 5 \n']);
fprintf(fid,['14       c/z 0.5 0 0.0295   $  1 \n']);
fprintf(fid,['24       c/z 0 0.5 0.0295   $  2 \n']);
fprintf(fid,['34       c/z 0 -0.5 0.0295  $  4  \n']);
fprintf(fid,['44       c/z -0.5 0 0.0295  $  3 \n']);

fprintf(fid,['5        cz 0.066  $ Lumens inside \n']);
fprintf(fid,['15       c/z 0.5 0 0.066  \n']);
fprintf(fid,['25       c/z 0 0.5 0.066  \n']);
fprintf(fid,['35       c/z 0 -0.5 0.066  \n']);
fprintf(fid,['45       c/z -0.5 0 0.066    \n']);

fprintf(fid,['6        cz 0.0724  $ Lumens outside \n']);
fprintf(fid,['16       c/z 0.5 0 0.0724  \n']);
fprintf(fid,['26       c/z 0 0.5 0.0724  \n']);
fprintf(fid,['36       c/z 0 -0.5 0.0724  \n']);
fprintf(fid,['46       c/z -0.5 0 0.0724  \n']);

fprintf(fid,['7        cz 0.0295        $  wires  5 \n']);
fprintf(fid,['17       c/z 0.5 0 0.0295  $  wires  1 \n']);
fprintf(fid,['27       c/z 0 0.5 0.0295  $  wires  2 \n']);
fprintf(fid,['37       c/z 0 -0.5 0.0295 $  wires  4 \n']);
fprintf(fid,['47       c/z -0.5 0 0.0295 $  wires  3 \n']);


fprintf(fid,['2   sz   ',num2str(source5_rel_pos+0.233),'   0.017   $   source   caps   Right   for   5 \n']);
fprintf(fid,['12   s    0.5   0  ',num2str(source1_rel_pos+0.233),'   0.017   $   1       \n']);
fprintf(fid,['22   s    0   0.5  ',num2str(source2_rel_pos+0.233),'   0.017   $   2       \n']);
fprintf(fid,['32   s    0   -0.5 ',num2str(source4_rel_pos+0.233),'   0.017   $   4       \n']);
fprintf(fid,['42   s    -0.5   0 ',num2str(source3_rel_pos+0.233),'   0.017   $   3       \n']);

fprintf(fid,['3   sz   ',num2str(source5_rel_pos-0.233),'   0.017   $   source   caps   Left   for   5 \n']);
fprintf(fid,['13   s    0.5   0  ',num2str(source1_rel_pos-0.233),'   0.017   $   1       \n']);
fprintf(fid,['23   s    0   0.5  ',num2str(source2_rel_pos-0.233),'   0.017   $   2       \n']);
fprintf(fid,['33   s    0   -0.5 ',num2str(source4_rel_pos-0.233),'   0.017   $   4       \n']);
fprintf(fid,['43   s    -0.5   0 ',num2str(source3_rel_pos-0.233),'   0.017   $   3       \n']);

fprintf(fid,['8    pz   ',num2str(source5_rel_pos+0.233),'   $   source   5   right          \n']);
fprintf(fid,['81   pz   ',num2str(source1_rel_pos+0.233),'   $   source   1   right          \n']);
fprintf(fid,['82   pz   ',num2str(source2_rel_pos+0.233),'   $   source   2   right          \n']);
fprintf(fid,['84   pz   ',num2str(source4_rel_pos+0.233),'   $   source   4   right          \n']);
fprintf(fid,['83   pz   ',num2str(source3_rel_pos+0.233),'   $   source   3   right          \n']);
fprintf(fid,['9    pz   ',num2str(source5_rel_pos-0.233),'   $   source   5   left          \n']);
fprintf(fid,['91   pz   ',num2str(source1_rel_pos-0.233),'   $   source   1   left          \n']);
fprintf(fid,['92   pz   ',num2str(source2_rel_pos-0.233),'   $   source   2   left          \n']);
fprintf(fid,['94   pz   ',num2str(source4_rel_pos-0.233),'   $   source   4   left          \n']);
fprintf(fid,['93   pz   ',num2str(source3_rel_pos-0.233),'   $   source   3   left          \n']);

fprintf(fid,['851   pz   ',num2str(source5_rel_pos+0.283),'   $   source   5   right   right \n']);
fprintf(fid,['861   pz   ',num2str(source1_rel_pos+0.283),'   $   source   1   right   right       \n']);
fprintf(fid,['871   pz   ',num2str(source2_rel_pos+0.283),'   $   source   2   right   right       \n']);
fprintf(fid,['881   pz   ',num2str(source4_rel_pos+0.283),'   $   source   4   right   right       \n']);
fprintf(fid,['891   pz   ',num2str(source3_rel_pos+0.283),'   $   source   3   right   right       \n']);
fprintf(fid,['951   pz   ',num2str(source5_rel_pos-0.283),'   $   source   5   left   left       \n']);
fprintf(fid,['961   pz   ',num2str(source1_rel_pos-0.283),'   $   source   1   left   left       \n']);
fprintf(fid,['971   pz   ',num2str(source2_rel_pos-0.283),'   $   source   2   left   left       \n']);
fprintf(fid,['981   pz   ',num2str(source4_rel_pos-0.283),'   $   source   4   left   left          \n']);
fprintf(fid,['991   pz   ',num2str(source3_rel_pos-0.283),'   $   source   3   left   left \n']);

fprintf(fid,['99        so 2.49  $  Balloon inside radius \n']);
fprintf(fid,['100        so 2.5  $  Balloon outside radius \n']);
fprintf(fid,['102        cz 0.58  $  Ousite the Lumens \n']);
fprintf(fid,['101        so 5  \n']);
fprintf(fid,['103        so 4.5  \n']);
fprintf(fid,['104        so 4  \n']);
fprintf(fid,['105        so 3.5  \n']);
fprintf(fid,['106        so 3  \n']);

fprintf(fid,['999    pz  ',num2str((lumanzsize/2)+0.8),' \n']);
fprintf(fid,['998    pz ',num2str(-(lumanzsize/2)-0.8),' \n']);
fprintf(fid,['997    py  ',num2str((lumanysize/2)+0.6),' \n']);
fprintf(fid,['996    py ',num2str(-(lumanysize/2)-0.6),' \n']);
fprintf(fid,['995    px  ',num2str((lumanxsize/2)+0.6),' \n']);
fprintf(fid,['994    px ',num2str(-(lumanxsize/2)-0.6),' \n']);
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
if 0
fprintf(fid,['999 c/z ',num2str(0),' ',num2str(0),' ',num2str(cylrad),'\n']);
fprintf(fid,['998 c/z ',num2str(0),' ',num2str(0),' ',num2str(cylradthic),'\n']);
fprintf(fid,['997 c/z ',num2str(0),' ',num2str(-dimy),' ',num2str(cylrad),'\n']);
fprintf(fid,['996 c/z ',num2str(0),' ',num2str(-dimy),' ',num2str(cylradthic),'\n']);
fprintf(fid,['995 c/z ',num2str(-dimx),' ',num2str(-dimy),' ',num2str(cylrad),'\n']);
fprintf(fid,['994 c/z ',num2str(-dimx),' ',num2str(-dimy),' ',num2str(cylradthic),'\n']);
fprintf(fid,['993 c/z ',num2str(-dimx),' ',num2str(0),' ',num2str(cylrad),'\n']);
fprintf(fid,['992 c/z ',num2str(-dimx),' ',num2str(0),' ',num2str(cylradthic),'\n']);
fprintf(fid,['989 pz ',num2str(-cylhight/2),'\n']);
fprintf(fid,['988 pz ',num2str(-((cylhight/2)+capthick)),'\n']);
fprintf(fid,['987 pz ',num2str((cylhight/2)-dimz),'\n']);
fprintf(fid,['986 pz ',num2str(((cylhight/2)+capthick-dimz)),'\n']);
end
%^#^#^#^#^#^#^#^#^#^#^^#^#^#^#^#^#^#^#^#^#^^#^#^#^#^#^#^#^#^#^#^#^#^#^#^
fprintf(fid,'\n');
if isequal (emode,'1')
    fprintf(fid,'mode p e\n');
elseif isequal (emode,'0')
    fprintf(fid,'mode p\n');
end
%fprintf(fid,'sdef  erg=2 par=2 axs=0 0 1 rad=0 ext=0 pos= 0 0 0\n');
if 0
fprintf(fid,'sdef erg=d5 axs=0 0 1   pos=0 0 0 rad=d2  ext=d3  par=2  $I-125\n');
fprintf(fid,['si2 0 ',num2str(cylrad),'\n']);
fprintf(fid,['si3 ',num2str(-cylhight/2),' ',num2str(cylhight/2) ,'\n']);
fprintf(fid,'si5 l 0.027202   0.027472    0.03098    0.03171    0.035492\n');
fprintf(fid,'sp5   0.406000   0.757000    0.20200    0.04390    0.06680\n');
fprintf(fid,['nps   ',num2str(partnum2sim),'\n']);
end

% fprintf(fid,['sdef  cel d1 pos=d2  axs=1 0 0 rad=fpos d20\n']);
% fprintf(fid,['       ext=fpos d30 erg=d35 par 2\n']);

fprintf(fid,['sdef  pos=d2  axs=0 0 1 rad=0.017\n']);
fprintf(fid,['       ext=d65 erg=d35 par 2\n']);

% fprintf(fid,'si1 L \n');%30201 32011 32021 32031 32041\n']);
% i=1;
% while i<=lenumus
%     fprintf(fid,['     2802:2801(',num2str(Sindmat(1,i)),' ',num2str(Sindmat(2,i)),' ',num2str(Sindmat(3,i)),'):',num2str(anonumus(i)),':',num2str(Sindmat(4,i)),' ','2802:2801(',num2str(Sindmat(1,i+1)),' ',num2str(Sindmat(2,i+1)),' ',num2str(Sindmat(3,i+1)),'):',num2str(anonumus(i+1)),':',num2str(Sindmat(4,i+1)),'\n']);
%     i=i+2;
% end
% fprintf(fid,['sp1 1 ',num2str(lenumus-1),'R  $ .2 .2 .2 .2 .2\n']);

fprintf(fid,['si2 S ',amnspd5,amnspd1,amnspd2,amnspd4,amnspd3,' \n']);
fprintf(fid,['sp2   ',amnspd5p,amnspd1p,amnspd2p,amnspd4p,amnspd3p,' \n']);
fprintf(fid,['c  Changes with dwellings \n']);
% this must be made dependent on the position of the source
amirf=num2str(Ncatheter_positionx+0)
amirf2=num2str(Ncatheter_positiony+0)
format short

if presenceof5
fprintf(fid,['si3   L   ',num2str(Ncatheter_positionx+0  ),' ',num2str(Ncatheter_positiony+0  ),' ',num2str(Ncatheter_positionz+source5_rel_pos),'    $   center   of   the   source   5\n']);
end
if presenceof1
fprintf(fid,['si4   L   ',num2str(Ncatheter_positionx+0.5  ),' ',num2str(Ncatheter_positiony+0),' ',num2str(Ncatheter_positionz+source1_rel_pos),'    $   center   of   the   source   1\n']);
end
if presenceof2
fprintf(fid,['si5   L   ',num2str(Ncatheter_positionx+0),' ',num2str(Ncatheter_positiony+0.5  ),' ',num2str(Ncatheter_positionz+source2_rel_pos),'    $   center   of   the   source   2\n']);
end
if presenceof4
fprintf(fid,['si6   L   ',num2str(Ncatheter_positionx+0),' ',num2str(Ncatheter_positiony-0.5  ),' ',num2str(Ncatheter_positionz+source4_rel_pos),'    $   center   of   the   source   4\n']);
end
if presenceof3
fprintf(fid,['si7   L   ',num2str(Ncatheter_positionx-0.5  ),' ',num2str(Ncatheter_positiony+0),' ',num2str(Ncatheter_positionz+source3_rel_pos),'    $   center   of   the   source   3\n']);
end
% fprintf(fid,['si4   L   ',num2str(Ncatheter_positionz+source2_rel_pos),'   ',num2str(Ncatheter_positionx+0.5),'  ',num2str(Ncatheter_positiony+0),'     $   center   of   the   source   1\n']);
% fprintf(fid,['si5   L   ',num2str(Ncatheter_positionz+source3_rel_pos),'   ',num2str(Ncatheter_positionx+0),'    ',num2str(Ncatheter_positiony+0.5),'   $   center   of   the   source   2\n']);
% fprintf(fid,['si6   L   ',num2str(Ncatheter_positionz+source4_rel_pos),'   ',num2str(Ncatheter_positionx+0),'   ',num2str(Ncatheter_positiony-0.5),'   $   center   of   the   source   4\n']);
% fprintf(fid,['si7   L   ',num2str(Ncatheter_positionz+source5_rel_pos),'  ',num2str(Ncatheter_positionx-0.5),'  ',num2str(Ncatheter_positiony+0),'     $   center   of   the   source   3\n']);

% 
% fprintf(fid,['si3   L   ',num2str(Ncatheter_positionz+source1_rel_pos),'   ',num2str(Ncatheter_positionx+0),'    ',num2str(Ncatheter_positiony+0),'     $   center   of   the   source   5\n']);
% fprintf(fid,['si4   L   ',num2str(Ncatheter_positionz+source2_rel_pos),'   ',num2str(Ncatheter_positionx+0.5),'  ',num2str(Ncatheter_positiony+0),'     $   center   of   the   source   1\n']);
% fprintf(fid,['si5   L   ',num2str(Ncatheter_positionz+source3_rel_pos),'   ',num2str(Ncatheter_positionx+0),'    ',num2str(Ncatheter_positiony+0.5),'   $   center   of   the   source   2\n']);
% fprintf(fid,['si6   L   ',num2str(Ncatheter_positionz+source4_rel_pos),'   ',num2str(Ncatheter_positionx+0),'   ',num2str(Ncatheter_positiony-0.5),'   $   center   of   the   source   4\n']);
% fprintf(fid,['si7   L   ',num2str(Ncatheter_positionz+source5_rel_pos),'  ',num2str(Ncatheter_positionx-0.5),'  ',num2str(Ncatheter_positiony+0),'     $   center   of   the   source   3\n']);
%
if presenceof5
    fprintf(fid,['sp3 1 \n']);
end
if presenceof1
    fprintf(fid,['sp4 1 \n']);
end
if presenceof2
    fprintf(fid,['sp5 1 \n']);
end
if presenceof4
    fprintf(fid,['sp6 1 \n']);
end
if presenceof3
    fprintf(fid,['sp7 1 \n']);
end
fprintf(fid,['si65 -0.25 0.25 \n']);
% fprintf(fid,['sp3 1 \n']);
% fprintf(fid,['sp4 1 \n']);
% fprintf(fid,['sp5 1 \n']);
% fprintf(fid,['sp6 1 \n']);
% fprintf(fid,['sp7 1 \n']);
% fprintf(fid,['ds20 S d8 d9 d10 d11 d12\n']);
% fprintf(fid,['si8  0 0.017 \n']);
% fprintf(fid,['si9  0 0.017 \n']);
% fprintf(fid,['si10 0 0.017 \n']);
% fprintf(fid,['si11 0 0.017 \n']);
% fprintf(fid,['si12 0 0.017 \n']);
% fprintf(fid,['sp8  -21 1  \n']);
% fprintf(fid,['sp9  -21 1  \n']);
% fprintf(fid,['sp10 -21 1  \n']);
% fprintf(fid,['sp11 -21 1  \n']);
% fprintf(fid,['sp12 -21 1  \n']);
% fprintf(fid,['ds30 S 13 14 15 16 17 \n']);
% fprintf(fid,['si13  0.250 \n']);
% fprintf(fid,['si14  0.250 \n']);
% fprintf(fid,['si15  0.250 \n']);
% fprintf(fid,['si16  0.250 \n']);
% fprintf(fid,['si17  0.250 \n']);
fprintf(fid,['c These energies (MeV) and probabilities (normalized) are for the\n']);
fprintf(fid,['c photons after electron emission \n']);
fprintf(fid,['c From QDOSE or Quality Assurance of Computational Tools for Dosimetry \n']);
fprintf(fid,['si35 0 0.06149 0.06300 0.07130 0.07340 0.11009 0.13634 0.17698\n']);
fprintf(fid,['     0.20131 0.20580 0.28004 0.28327 0.29596 0.30847 0.31651  \n']);
fprintf(fid,['     0.32931 0.37449 0.41647 0.42053 0.46807 0.48458 0.48530  \n']);
fprintf(fid,['     0.48904 0.58859 0.59337 0.59940 0.60442 0.61247 0.70398  \n']);
fprintf(fid,['     0.76600 0.88454 1.06148 1.08970 1.37830                  \n']);
fprintf(fid,['sp35 0 0.00713192 0.00904863 0.00295484 0.000772031 0.0000565651 \n']);
fprintf(fid,['     0.000818388 0.0000191136 0.00210347 0.0147230 0.000103680   \n']);
fprintf(fid,['     0.00117097 0.0127795 0.0145714 0.369344 0.0000827303        \n']);
fprintf(fid,['     0.00321293 0.00296153 0.000327088 0.213200 0.0142059        \n']);
fprintf(fid,['     0.00000980639 0.00197599 0.0201254 0.000189531 0.0000172860 \n']);
fprintf(fid,['     0.0366937 0.0236646 0.0000238206 0.00000665052 0.00130113   \n']);
fprintf(fid,['     0.000235353 0.00000478285 0.00000553616                     \n']);
%fprintf(fid,'prdmp  2j -1 2\n');

fprintf(fid,['fmesh4:p geom=xyz origin=',num2str(meshminxgrid),' ',num2str(meshminygrid),' ',num2str(meshminzgrid),'\n']);
fprintf(fid,['         imesh=0 ', num2str(meshmaxxgrid),' iints=',num2str(meshxsize/2),' ', num2str(meshxsize/2),'\n']);
fprintf(fid,['         jmesh=0 ', num2str(meshmaxygrid),' jints=',num2str(meshysize/2),' ', num2str(meshysize/2),'\n']);
fprintf(fid,['         kmesh=0 ', num2str(meshmaxzgrid),' kints=',num2str(meshzsize/2),' ', num2str(meshzsize/2),'\n']);
fprintf(fid,'         out=ij\n');
% fprintf(fid,['*fmesh24:p geom=xyz origin=',num2str(meshminxgrid2),' ',num2str(meshminygrid2),' ',num2str(meshminzgrid2),'\n']);
% fprintf(fid,['         imesh=0 ', num2str(meshmaxxgrid2),' iints=',num2str(meshxsize2/2),' ', num2str(meshxsize2/2),'\n']);
% fprintf(fid,['         jmesh=0 ', num2str(meshmaxygrid2),' jints=',num2str(meshysize2/2),' ', num2str(meshysize2/2),'\n']);
% fprintf(fid,['         kmesh=0 ', num2str(meshmaxzgrid2),' kints=',num2str(meshzsize2/2),' ', num2str(meshzsize2/2),'\n']);
% fprintf(fid,'         out=ij\n');

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
tic
if 0
%[status,result] = dos(['mcnpx.exe inp=',filename,' out=ami.txt'],'-echo');
[status,result] = dos(['mpirun -np 9 MCNP5_rsicc_1.40_Windows_CVF_mpi.exe inp=',filename,' out=ami.txt'],'-echo');

toc
%datam=importmdata('mdata');
%
[ap,ap2]=importmc5_like_mcxtwomesh('meshtal');
%
%data2=importerrorfile('mdata',meshysize,meshzsize);
%
%
movefile('meshtal',['records/','meshtal',num2str(inum),'.txt'])
delete('ami.txt')
delete('runtpe')
%
%
%ap=datam.data;
%errop=data2.data;
% doseerror=errop(1:(meshysize*meshzsize),:);
%
dose=ap(1:(meshysize*meshzsize),:);
dose2=ap2(1:((meshysize2)*(meshzsize2)),:);
doseerror=ap((meshysize*meshzsize+1):end,:);
doseerror2=ap2(((meshysize2)*(meshzsize2)+1):end,:);
dose=dose*(10^(10));
dose2=dose2*(10^(10));
erordata(:,inum)= reshape(doseerror,(meshxsize*meshysize*meshzsize),1);
erordata2(:,inum)= reshape(doseerror2,((meshxsize2)*(meshysize2)*(meshzsize2)),1);
maxerr(1)=max(erordata(:,inum));
maxerr(2)=max(erordata2(:,inum))
dosedata(:,inum)= reshape(dose,(meshxsize*meshysize*meshzsize),1);
dosedata2(:,inum)= reshape(dose2,((meshxsize2)*(meshysize2)*(meshzsize2)),1);
%


%
lastrun.alphabet=inum+1;
save(savefilename,'rhodata','dosedata','dosedata2','erordata','erordata2','miuhudata_at20','miuhudata','picdata','lastrun');
save('lastrun.mat','lastrun')
end
end
