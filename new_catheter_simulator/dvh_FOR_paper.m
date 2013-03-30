%first run the cath shielding plo gen
% first run the breast dose show

sts=S6data;
bts=TS;
bts(:,1:33,:)=[];
bts(:,81:end,:)=[];
bts(1:70,:,:)=[];
bts(105:end,:,:)=[];
bts(:,:,1:18)=[];
bts(:,:,63:end)=[];
sts(:,1:33,:)=[];
sts(:,81:end,:)=[];
sts(1:70,:,:)=[];
sts(105:end,:,:)=[];
sts(:,:,1:18)=[];
sts(:,:,63:end)=[];
%
LA=xR(40:end,:,:);
LB=xpercenterror(40:end,:,:);
LC=xNdosedata2(40:end,:,:);
LD=xwNdosedata2(40:end,:,:);
Lbts=bts(40:end,:,:);
Lsts=sts(40:end,:,:);
[amxr,amyr,amzr]=size(LA)        
Lrectumphan=(LA>-900).*(LA<-150);
%*******************
% A=xR(40:100,30:end,:);
% B=xpercenterror(40:100,30:end,:);

Lrelerrtotl=reshape(LB,1,amxr*amyr*amzr);
Lxd=reshape(LC,1,amxr*amyr*amzr);
Lxwd=reshape(LD,1,amxr*amyr*amzr);
Lxbts=reshape(Lbts,1,amxr*amyr*amzr);
Lxsts=reshape(Lsts,1,amxr*amyr*amzr);
%         recdosel=reshape(recdose,1,amxr*amyr*amzr);
%         recdoseHl=reshape(recdoseH,1,amxr*amyr*amzr);
          Lrectumphanl=reshape(Lrectumphan,1,amxr*amyr*amzr);
%         recdoseerrl=reshape(recdoseerr,1,amxr*amyr*amzr);
Lvect=zeros(sum(sum(sum(Lrectumphan))),1);
Ldvect=zeros(sum(sum(sum(Lrectumphan))),1);
Ldwvect=zeros(sum(sum(sum(Lrectumphan))),1);
Ldbts=zeros(sum(sum(sum(Lrectumphan))),1);
Ldsts=zeros(sum(sum(sum(Lrectumphan))),1);

sum(sum(sum(Lrectumphan)))
        i=1;
        for j=(amxr*amyr*amzr):-1:1
            if Lrectumphanl(1,j)~=0
                Lvect(i)=Lrelerrtotl(j);
                Ldvect(i)=Lxd(j);
                Ldwvect(i)=Lxwd(j);
                Ldbts(i)=Lxbts(j);
                Ldsts(i)=Lxsts(j);
                i=i+1
%                 recdosel(j)=[];
%                 recdoseHl(j)=[];
%                 recdoseerrl(j)=[];
            end
        end
        
[Las,Lbs]=DVH_plotter(Ldvect,60);
[Laws,Lbws]=DVH_plotter(Ldwvect,60);
[Labts,Lbbts]=DVH_plotter(Ldbts,60);
[Lasts,Lbsts]=DVH_plotter(Ldsts,60);



%Heart***********
%Heart***********
HA=xR(60:95,12:45,:);
HB=xpercenterror(60:95,12:45,:);
HC=xNdosedata2(60:95,12:45,:);
HD=xwNdosedata2(60:95,12:45,:);
Hbts=bts(60:95,12:45,:);
Hsts=sts(60:95,12:45,:);
 [amxr,amyr,amzr]=size(HA);
 Hrectumphan=(HA>0).*(HA<100);

%*******************
% A=xR(40:100,30:end,:);
% B=xpercenterror(40:100,30:end,:);

Hrelerrtotl=reshape(HB,1,amxr*amyr*amzr);
Hxd=reshape(HC,1,amxr*amyr*amzr);
Hxwd=reshape(HD,1,amxr*amyr*amzr);
Hxbts=reshape(Hbts,1,amxr*amyr*amzr);
Hxsts=reshape(Hsts,1,amxr*amyr*amzr);
%         recdosel=reshape(recdose,1,amxr*amyr*amzr);
%         recdoseHl=reshape(recdoseH,1,amxr*amyr*amzr);
          Hrectumphanl=reshape(Hrectumphan,1,amxr*amyr*amzr);
%         recdoseerrl=reshape(recdoseerr,1,amxr*amyr*amzr);
Hvect=zeros(sum(sum(sum(Hrectumphan))),1);
Hdvect=zeros(sum(sum(sum(Hrectumphan))),1);
Hdwvect=zeros(sum(sum(sum(Hrectumphan))),1);
Hdbts=zeros(sum(sum(sum(Hrectumphan))),1);
Hdsts=zeros(sum(sum(sum(Hrectumphan))),1);
sum(sum(sum(Hrectumphan)))
        i=1;
        for j=(amxr*amyr*amzr):-1:1
            if Hrectumphanl(1,j)~=0
                Hvect(i)=Hrelerrtotl(j);
                Hdvect(i)=Hxd(j);
                Hdwvect(i)=Hxwd(j);
                Hdbts(i)=Hxbts(j);
                Hdsts(i)=Hxsts(j);
                i=i+1
%                 recdosel(j)=[];
%                 recdoseHl(j)=[];
%                 recdoseerrl(j)=[];
            end
        end
        
[Has,Hbs]=DVH_plotter(Hdvect,60);
[Haws,Hbws]=DVH_plotter(Hdwvect,60);
[Habts,Hbbts]=DVH_plotter(Hdbts,60);
[Hasts,Hbsts]=DVH_plotter(Hdsts,60);

%Breast
BA=xR(1:60,:,:);
BB=xpercenterror(1:60,:,:);
BC=xNdosedata2(1:60,:,:);
BD=xwNdosedata2(1:60,:,:);
Bbts=bts(1:60,:,:);
Bsts=sts(1:60,:,:);
[amxr,amyr,amzr]=size(BA);
Brectumphan=(BA>-150).*(BA<-4);

%*******************
% A=xR(40:100,30:end,:);
% B=xpercenterror(40:100,30:end,:);

Brelerrtotl=reshape(BB,1,amxr*amyr*amzr);
Bxd=reshape(BC,1,amxr*amyr*amzr);
Bxwd=reshape(BD,1,amxr*amyr*amzr);
Bxbts=reshape(Bbts,1,amxr*amyr*amzr);
Bxsts=reshape(Bsts,1,amxr*amyr*amzr);
%         recdosel=reshape(recdose,1,amxr*amyr*amzr);
%         recdoseHl=reshape(recdoseH,1,amxr*amyr*amzr);
          Brectumphanl=reshape(Brectumphan,1,amxr*amyr*amzr);
%         recdoseerrl=reshape(recdoseerr,1,amxr*amyr*amzr);
Bvect=zeros(sum(sum(sum(Brectumphan))),1);
Bdvect=zeros(sum(sum(sum(Brectumphan))),1);
Bdwvect=zeros(sum(sum(sum(Brectumphan))),1);
Bdbts=zeros(sum(sum(sum(Hrectumphan))),1);
Bdsts=zeros(sum(sum(sum(Hrectumphan))),1);

sum(sum(sum(Brectumphan)))
        i=1;
        for j=(amxr*amyr*amzr):-1:1
            if Brectumphanl(1,j)~=0
                Bvect(i)=Brelerrtotl(j);
                Bdvect(i)=Bxd(j);
                Bdwvect(i)=Bxwd(j);
                Bdbts(i)=Bxbts(j);
                Bdsts(i)=Bxsts(j);
                i=i+1
%                 recdosel(j)=[];
%                 recdoseHl(j)=[];
%                 recdoseerrl(j)=[];
            end
        end
        
[Bas,Bbs]=DVH_plotter(Bdvect,60);
[Baws,Bbws]=DVH_plotter(Bdwvect,60);
[Babts,Bbbts]=DVH_plotter(Bdbts,60);
[Basts,Bbsts]=DVH_plotter(Bdsts,60);

%Rib
RA=xR(1:75,:,:);
RB=xpercenterror(1:75,:,:);
RC=xNdosedata2(1:75,:,:);
RD=xwNdosedata2(1:75,:,:);
Rbts=bts(1:75,:,:);
Rsts=sts(1:75,:,:);
[amxr,amyr,amzr]=size(RA);
Rrectumphan=(RA>185);

%*******************
% A=xR(40:100,30:end,:);
% B=xpercenterror(40:100,30:end,:);

Rrelerrtotl=reshape(RB,1,amxr*amyr*amzr);
Rxd=reshape(RC,1,amxr*amyr*amzr);
Rxwd=reshape(RD,1,amxr*amyr*amzr);
Rxbts=reshape(Rbts,1,amxr*amyr*amzr);
Rxsts=reshape(Rsts,1,amxr*amyr*amzr);
%         recdosel=reshape(recdose,1,amxr*amyr*amzr);
%         recdoseHl=reshape(recdoseH,1,amxr*amyr*amzr);
          Rrectumphanl=reshape(Rrectumphan,1,amxr*amyr*amzr);
%         recdoseerrl=reshape(recdoseerr,1,amxr*amyr*amzr);
Rvect=zeros(sum(sum(sum(Rrectumphan))),1);
Rdvect=zeros(sum(sum(sum(Rrectumphan))),1);
Rdwvect=zeros(sum(sum(sum(Rrectumphan))),1);
Rdbts=zeros(sum(sum(sum(Rrectumphan))),1);
Rdsts=zeros(sum(sum(sum(Rrectumphan))),1);

sum(sum(sum(Rrectumphan)))
        i=1;
        for j=(amxr*amyr*amzr):-1:1
            if Rrectumphanl(1,j)~=0
                Rvect(i)=Rrelerrtotl(j);
                Rdvect(i)=Rxd(j);
                Rdwvect(i)=Rxwd(j);
                Rdbts(i)=Rxbts(j);
                Rdsts(i)=Rxsts(j);
                i=i+1
%                 recdosel(j)=[];
%                 recdoseHl(j)=[];
%                 recdoseerrl(j)=[];
            end
        end
        
[Ras,Rbs]=DVH_plotter(Rdvect,60);
[Raws,Rbws]=DVH_plotter(Rdwvect,60);
[Rabts,Rbbts]=DVH_plotter(Rdbts,60);
[Rasts,Rbsts]=DVH_plotter(Rdsts,60);
ghjk=7
plot(Las,Lbs,'-*','MarkerSize',ghjk)
hold on
plot(Laws,Lbws,':*','MarkerSize',ghjk)
plot(Has,Hbs,'-ro','MarkerSize',ghjk)
plot(Haws,Hbws,':ro','MarkerSize',ghjk)
% plot(Bas,Bbs,'color','green')
% plot(Baws,Bbws,'color','green','linestyle',':')
plot(Ras,Rbs,'-ms','MarkerSize',ghjk)
plot(Raws,Rbws,':ms','MarkerSize',ghjk)
title('DVH')
legend('Lung(MC)','Lung(TG-43)','Heart(MC)','Heart(TG)','Rib(MC)','Rib(TG)')
xlabel('Dose (rem/Particle)')
ylabel('Volume percent')


figure


plot(Labts,Lbbts)
hold on
plot(Lasts,Lbsts,':')
plot(Habts,Hbbts,'color','red')
plot(Hasts,Hbsts,'color','red','linestyle',':')
plot(Babts,Bbbts,'color','green')
plot(Basts,Bbsts,'color','green','linestyle',':')
plot(Rabts,Rbbts,'color','m')
plot(Rasts,Rbsts,'color','m','linestyle',':')