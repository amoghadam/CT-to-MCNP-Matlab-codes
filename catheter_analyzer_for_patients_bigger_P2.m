%for catheter
clear all
[filename,path] = uigetfile({'*.dcm';'*.DCM'},'Select the dicom file','MultiSelect','on');
lenf=length(filename);
i=1;
while i<=lenf
fname=char([path,char(filename(i))]);
pic(:,:,i) = dicomread(fname);
i=i+1;
end

[klsx,klsy,klsz]=size(pic);
g=68
for g=1:klsz
rpic=imrotate(pic(:,:,g),-21);
rpic(498:end,:)=[];
rpic(:,542:end)=[];
rpic(1:115,:)=[];
rpic(:,1:135)=[];
spic(:,:,g)=rpic;
end
imagesc(spic(:,:,68))

[klssx,klssy,klssz]=size(spic);
tpic=zeros(klssy,klssz,klssx);
for i=1:klssx
    tpic(:,:,i)=spic(i,:,:);
end

g=42
for g=1:klssx
jpic=imrotate(tpic(:,:,g),11);
upic(:,:,g)=jpic;
end
imagesc(upic(:,:,42))

[klsux,klsuy,klsuz]=size(upic);
vpic=zeros(klsuy,klsuz,klsux);
for i=1:klsux
    vpic(:,:,i)=upic(i,:,:);
end
subplot(1,2,1)
imagesc(vpic(:,:,125))

%clearing high Z matterial iside baloon
for i=115:161
    vpic(60:100,121:162,i)=(((vpic(60:100,121:162,i)<=1000).*vpic(60:100,121:162,i))+((vpic(60:100,121:162,i)>1000).*1000));
end
for i=1:114
    vpic(60:100,121:162,i)=(((vpic(60:100,121:162,i)<2000).*vpic(60:100,121:162,i))+((vpic(60:100,121:162,i)>2000).*2000));
end
subplot(1,2,2)
imagesc(vpic(:,:,125))

[klsvx,klsvy,klsvz]=size(vpic);
wpic=zeros(klsvy,klsvz,klsvx);
for i=1:klsvx
    wpic(:,:,i)=vpic(i,:,:);
end
imagesc(wpic(:,:,125))
% wpic(:,:,50:112) is wanted
% wpic(:,90:250,:) is wanted
% wpic(1:210,:,:) is wanted
wpic(:,:,123:end)=[];
wpic(:,:,1:40)=[];
wpic(:,291:end,:)=[];
wpic(:,1:50,:)=[];
wpic(312:end,:,:)=[];
wpic(1:3,:,:)=[];
wpic=wpic-1000;
for i=1:62
    xpic(:,:,i)=fix(imresize(wpic(:,:,i),0.5));
end
xpic=((xpic>=-1000).*xpic)+((xpic<-1000).*-1000);
% xpic=xpic-1000;
% xpic=fix(xpic-((min(min(min(xpic))))+1000));
imagesc(xpic(:,:,30))


[klsxx,klsxy,klsxz]=size(xpic);
ypic=zeros(klsxx,klsxz,klsxy);
for i=1:klsxy
    ypic(:,:,i)=xpic(:,i,:);
end
imagesc(ypic(:,:,30))
[klsyx,klsyy,klsyz]=size(ypic);
for i=1:klsyz
    nypic(:,:,i)=ypic(:,:,(klsyz-i+1));
end



pic=nypic;
for i=1:klsyz
imagesc(nypic(:,:,i))
title(num2str(i))
drawnow
pause(0.1)
end
imagesc(nypic(:,:,65))
imagesc(nypic(:,:,66))
imagesc(nypic(:,:,72))
imagesc(xpic(:,:,40))
% 
rdpic=((pic<-150)*-90)+(pic);
repic=((rdpic<-920).*-999)+((rdpic>=-920).*rdpic);
pic=repic;
pic=zeros(size(pic));