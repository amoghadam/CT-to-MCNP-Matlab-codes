%ANN sample prep for water only
load('preparation_needs.mat')
ddata=xNdosedata2;
dwdata=xwNdosedata2;

ddata(:,77:end,:)=[];
ddata(:,1:38,:)=[];
ddata(39:end,:,:)=[];
cdata=imresize(ddata(:,:,32),0.5);

dwdata(:,77:end,:)=[];
dwdata(:,1:38,:)=[];
dwdata(39:end,:,:)=[];
cwdata=imresize(dwdata(:,:,32),0.5);

[rxs,rys]=size(cdata);
amirhoz=[0.001*ones(5,rys);ones(rxs-5,rys)];

if 0
RD=zeros(868,4000);
DD=zeros(rxs*rys,4000);
for i=1:4000
    rorand=(2*rand(rxs,rys))+0.0005;
    dodata=cdata*rorand;
%     dodata(8:31,8:31)=zeros(24,24);
    rorand(8:31,8:31)=-1*(ones(24,24));
    Rrorand=deletezeros(reshape(rorand,(rxs*rys),1));
    Rdodata=(reshape(dodata,(rxs*rys),1));
    RD(:,i)=Rrorand;
    DD(:,i)=Rdodata;
end
    

rhodata=RD;
dosedata=DD*1e8;
length_dosedata=length(DD)
length_rhodata=length(RD)
fortest=200
j=1;
i=2;

net=newfit(rhodata(:,1:(length_rhodata-fortest)),dosedata(j,1:(length_dosedata-fortest)),i);
net=train(net,rhodata(:,1:(length_rhodata-fortest)),dosedata(j,1:(length_dosedata-fortest)));

end