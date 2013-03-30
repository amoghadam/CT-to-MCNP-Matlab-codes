function [Xypic,Yzpic,Xzpic]=updateall(pic,di)
if di==1
    Xypic=pic;
    [klssx,klssy,klssz]=size(pic);
    tpic=zeros(klssy,klssz,klssx);
    for i=1:klssx
        tpic(:,:,i)=pic(i,:,:);
    end
    Yzpic=tpic;
    [klsxx,klsxy,klsxz]=size(pic);
    ypic=zeros(klsxx,klsxz,klsxy);
    for i=1:klsxy
       ypic(:,:,i)=pic(:,i,:);
    end
    Xzpic=ypic;
elseif di==2
    Yzpic=pic;
    [klssy,klssz,klssx]=size(pic);
    tpic=zeros(klssy,klssx,klssz);
    t2pic=zeros(klssx,klssy,klssz);
    for i=1:klssz
        tpic(:,:,i)=pic(:,i,:);
        t2pic(:,:,i)=rot90(flipud(tpic(:,:,i)),-1);
    end
    Xypic=t2pic;
    pic=t2pic;
    [klsxx,klsxy,klsxz]=size(pic);
    ypic=zeros(klsxx,klsxz,klsxy);
    for i=1:klsxy
       ypic(:,:,i)=pic(:,i,:);
    end
    Xzpic=ypic;
elseif di==3
    Xzpic=pic;
    [klsxx,klsxz,klsxy]=size(pic);
    ypic=zeros(klsxx,klsxy,klsxz);
    for i=1:klsxz
       ypic(:,:,i)=pic(:,i,:);
    end
    Xypic=ypic;
    pic=ypic;
    [klssx,klssy,klssz]=size(pic);
    tpic=zeros(klssy,klssz,klssx);
    for i=1:klssx
        tpic(:,:,i)=pic(i,:,:);
    end
    Yzpic=tpic;
    
    
end
    
    
