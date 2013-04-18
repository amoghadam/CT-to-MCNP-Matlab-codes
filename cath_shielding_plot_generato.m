% self shielding generator
if 0
zs=100
xs=180
ys=180
load out_put_meshtaz_S1.mat
for i=1:zs
S1data(:,:,i)=fDose(((ys*(i-1))+1):(ys*i),:);
S2data(:,:,i)=flipud(S1data(:,:,i));
S3data(:,:,i)=rot90(S1data(:,:,i));
S4data(:,:,i)=fliplr(S3data(:,:,i));
end

load out_put_meshtaz_S5.mat
for i=1:zs
S5data(:,:,i)=fDose(((ys*(i-1))+1):(ys*i),:);
end
TS=(S1data+S2data+S3data+S4data+S5data)/5;
load out_put_meshtaz_S6.mat
for i=1:zs
S6data(:,:,i)=fDose(((ys*(i-1))+1):(ys*i),:);

end





else
    
    
zs=100
xs=180
ys=180
load out_put_neshta1.mat
for i=1:zs
S1data(:,:,i)=fDose(((ys*(i-1))+1):(ys*i),:);
S2data(:,:,i)=fliplr(S1data(:,:,i));
end

% load out_put_meshtal_2.mat
for i=1:zs
S3data(:,:,i)=rot90(S1data(:,:,i));
S4data(:,:,i)=flipud(S3data(:,:,i));
end

load out_put_neshta5.mat
for i=1:zs
S5data(:,:,i)=fDose(((ys*(i-1))+1):(ys*i),:);
end
TS=(S1data+S2data+S3data+S4data+S5data)/5;

load out_put_neshta6.mat
for i=1:zs
S6data(:,:,i)=fDose(((ys*(i-1))+1):(ys*i),:);

end
j=50
subplot(1,2,1)
imagesc(abs((TS(:,:,j)-S6data(:,:,j))./S6data(:,:,j)))
colorbar
subplot(1,2,2)
imagesc(((TS(:,:,j)-S6data(:,:,j))./S6data(:,:,j)))
colorbar
end
figure
% 4 cm baloon
presc_5=(4.514e-9+5.094e-9)/2
presc_4=6.63e-9;
err5=100*((TS(:,:,:)-S6data(:,:,:))./presc_5);
err4=100*((TS(:,:,:)-S6data(:,:,:))./presc_4);
% imagesc(TS(:,:,50))
imagesc(err4(:,:,50),[0 4])
% imagesc(err(:,:,50))
hold on
% contour(TS(:,:,50),[0 1.593e-8],'r')
% [c,h1]=contour(TS(:,:,50),[0 ((1.06e-8+8.991e-9)/2)],'r')
[c,h1]=contour(4*(TS(:,:,50)/((1.593e-8))),[0 4],'r')
text_handle = clabel(c,h1,'manual');
set(text_handle,'BackgroundColor',[1 1 .6],'Edgecolor',[.7 .7 .7])
[c,h2]=contour(6*(TS(:,:,50)/6.63e-9),[0 6],'y')
text_handle2 = clabel(c,h2,'manual');
set(text_handle2,'BackgroundColor',[1 1 .6],'Edgecolor',[.7 .7 .7])
xlim([60,120])
ylim([60,120])
avira=str2num(get(gca,'YTickLabel'));
xlabel('(cm)')
ylabel('(cm)')
bvira=fix((avira*.2));
set(gca,'YTickLabel',bvira)
xavira=str2num(get(gca,'XTickLabel'));
xbvira=fix((xavira*.2));
set(gca,'XTickLabel',xbvira)

% 5cm
presc_5=(4.514e-9+5.094e-9)/2
presc_4=6.63e-9;
imagesc(err5(:,:,50),[0 5])
% imagesc(err(:,:,50))
hold on
% contour(TS(:,:,50),[0 1.593e-8],'r')
% [c,h1]=contour(TS(:,:,50),[0 ((1.06e-8+8.991e-9)/2)],'r')
[c,h1]=contour(5*(TS(:,:,50)/((1.06e-8+8.991e-9)/2)),[0 5],'r')
text_handle = clabel(c,h1,'manual');
set(text_handle,'BackgroundColor',[1 1 .6],'Edgecolor',[.7 .7 .7])
[c,h2]=contour(7*(TS(:,:,50)/((5.094e-9 +4.51e-9)/2)),[0 7],'y')
text_handle2 = clabel(c,h2,'manual');
set(text_handle2,'BackgroundColor',[1 1 .6],'Edgecolor',[.7 .7 .7])
xlim([60,120])
ylim([60,120])
avira=str2num(get(gca,'YTickLabel'));
xlabel('(cm)')
ylabel('(cm)')
bvira=fix((avira*.2));
set(gca,'YTickLabel',bvira)
xavira=str2num(get(gca,'XTickLabel'));
xbvira=fix((xavira*.2));
set(gca,'XTickLabel',xbvira)








% err=((TS(:,:,:)-S6data(:,:,:))./S6data(:,:,:));
sum(sum(sum((err<0).*err)))/sum(sum(sum((err<0))))
sum(sum(sum((err<0).*(err>-0.01))))/(100*180*180)
rerr=reshape(err,1,(180*180*100));
hist((100*rerr),60)
avira=str2num(get(gca,'YTickLabel'))
bvira=fix((avira*1e7)/(1800*1800))
% bvira(1)=0;
set(gca,'YTickLabel',bvira)
h = findobj(gca,'Type','patch');
        set(h,'FaceColor',[0.3 0 1],'EdgeColor','w')
%         title('histogram of the relative error of voxels (Rectum)')
        ylabel('Percentage of voxels')
        xlabel('Relative error (percent)')
        xlim([-6,6])
