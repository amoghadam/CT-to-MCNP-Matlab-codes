function gammas=Gamma_index(refrencedose,calculateddose,dcriterion,Dcriterion,size_of_window,region,dim)




% region=[2,12;4,14;5:15]
rfd1=refrencedose;
cld1=calculateddose;
% subplot(1,2,1)
% imagesc(cld1(:,:,50))

deld=dcriterion;
delD=Dcriterion;
% dim=[2,2,2];
dimx=dim(1);
dimy=dim(2);
dimz=dim(3);
% size_of_window=13;
% sow=6
sow=fix(size_of_window/2);
addmargin=1
if addmargin
    region(1:2,1:2)=region(1:2,1:2)+(sow+1);
    [xs,ys,zs]=size(rfd1);
    zerotop=ones(sow+1,ys,zs);
    rfd1=cat(1,zerotop,rfd1);
    [xs,ys,zs]=size(rfd1);
    zerotop=ones(sow+1,ys,zs);
    rfd1=cat(1,rfd1,zerotop);
    [xs,ys,zs]=size(rfd1);
    zerotop=ones(xs,sow+1,zs);
    rfd1=cat(2,zerotop,rfd1);
    [xs,ys,zs]=size(rfd1);
    zerotop=ones(xs,sow+1,zs);
    rfd1=cat(2,rfd1,zerotop);
    
    [xs,ys,zs]=size(cld1);
    zerotop=200*ones(sow+1,ys,zs);
    cld1=cat(1,zerotop,cld1);
    [xs,ys,zs]=size(cld1);
    zerotop=200*ones(sow+1,ys,zs);
    cld1=cat(1,cld1,zerotop);
    [xs,ys,zs]=size(cld1);
    zerotop=200*ones(xs,sow+1,zs);
    cld1=cat(2,zerotop,cld1);
    [xs,ys,zs]=size(cld1);
    zerotop=200*ones(xs,sow+1,zs);
    cld1=cat(2,cld1,zerotop);
    
end
cld=cld1;
rfd=rfd1;
% 
% subplot(1,2,2)
% imagesc(cld(:,:,50))
% drawnow


pdist=zeros((sow*2)+1,(sow*2)+1,(sow*2)+1);
[pdxs,pdys,pdzs]=size(pdist);
for i=1:pdxs
    for j=1:pdys
        for k=1:pdzs
            pdist(i,j,k)=sqrt(((dimx*(i-sow-1))^2)+((dimy*(j-sow-1))^2)+((dimz*(k-sow-1))^2));
        end
    end
end

[xs,ys,zs]=size(rfd);
gammas=zeros(xs,ys,zs);
for i=region(1,1):region(1,2)
    for j=region(2,1):region(2,2)
        for k=region(3,1):region(3,2)
            if min([i,j,k])>sow && i+sow<xs && j+sow<ys && k+sow<zs
%                 prfd=rfd(i-sow:i+sow,j-sow:j+sow,k-sow:k+sow);
                
                pcld=cld(i-sow:i+sow,j-sow:j+sow,k-sow:k+sow);
                prfd=rfd(i,j,k);%*onse(size(pcld));
                
%                 pcld=cld(i,j,k);
%                 prfd=rfd(i-sow:i+sow,j-sow:j+sow,k-sow:k+sow);%*onse(size(pcld));

                dfdose=pcld-prfd;
%                 I=sqrt(((pdist.^2)/(deld^2))+((dfdose.^2)/(delD^2)));
                I=sqrt(((pdist.^2)/(deld^2))+((dfdose.^2)./((((delD*prfd)/100)).^2)));
                gammas(i,j,k)=min(min(min(I)));
            end
            
        end
    end
end
            
size(gammas)
if addmargin
    [xs,ys,zs]=size(gammas);
    gammas(1:sow+1,:,:)=[];
    [xs,ys,zs]=size(gammas);
    gammas(xs-sow:end,:,:)=[];
    
    [xs,ys,zs]=size(gammas);
    gammas(:,1:sow+1,:)=[];
    [xs,ys,zs]=size(gammas);
    gammas(:,ys-sow:end,:)=[];
end
size(gammas)