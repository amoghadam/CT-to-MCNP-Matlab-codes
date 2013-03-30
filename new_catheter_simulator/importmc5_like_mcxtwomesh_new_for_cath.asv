filen='neshta6'
zs=100;
lines_to_skip=20;
aa=importfilemc5(filen,lines_to_skip);
% aa(:,1)=[];


[xs,ys]=size(aa)
dosedata=zeros(xs*zs,ys-1);
dosedata(1:xs,:)=aa(:,2:end);
for i=1:zs-1
aa=importfilemc5(filen,(lines_to_skip+i*((2*xs)+3+6)));
% aa(:,1)=[];
dosedata(((i*xs)+1:(i+1)*xs),:)=aa(:,2:end);
i
end
% for i=1:zs
% aa=importfilemc5(filen,lines_to_skip+xs+3+(i-1)*((2*xs)+3+6));
% aa(:,1)=[];
% dosedata=[dosedata;aa];
% end
% [xms,yms]=size(dosedata);
fDose=dosedata;%(1:(xms/2),:);
% ferro=dosedata((xms/2)+1:xms,:);

save(char(['out_put_',filen,'.mat']),'fDose')%,'ferro')
beep 
pause(1)
beep




