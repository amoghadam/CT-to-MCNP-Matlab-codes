function [rhoinp,miuinp_at20]=find_my_god___densities(xR,E)
if min(min(min(xR)))>-50
nypic=fix(xR-1000);
pic=fix(xR-1000);
else
nypic=fix(xR);
pic=fix(xR);    
end
maxima=1900;
minimin=-1000;

[xsize,ysize,zsize]=size(pic);

mat_discriminator= [ minimin  -880    -150  -2  1  185     maxima ];
% flesh=1080;
    %^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    
selectedmatterial=[ 1  11   10  8  4  5 ];
    
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
    miu_ov_rhos_at20(i2)=sum((E==total_miu(:,1,selectedmatterial(i2))).*total_miu(:,2,selectedmatterial(i2)));
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
rhosmat(1)=0;
materialmat(1)=0;
pic=fix(double(pic));
% a=(pic-(mat_discriminator(1))).*((pic-(mat_discriminator(1))>0));
a=pic;
rhoinp=zeros(xsize,ysize,zsize);
for k=2:length(materialmat)
    k
rhoinp=rhoinp+(rhosmat(k)*(a==materialmat(k)));
end
miuinp=zeros(xsize,ysize,zsize);
miuinp_at20=zeros(xsize,ysize,zsize);
for k=1:length(materialmat)
miuinp=miuinp+(mius_over_ros_mat(k)*(a==materialmat(k)));
miuinp_at20=miuinp_at20+(mius_over_ros_mat_at20(k)*(a==materialmat(k)));
end