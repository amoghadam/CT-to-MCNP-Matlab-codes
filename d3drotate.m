function out=d3drotate(mat,typ)
[sx,sy,sz]=size(mat);

%for upside down mirror
if typ==1
    out=zeros(sx,sy,sz);
    for i=1:sz
        out(:,:,i)=mat(:,:,(sz+1-i));
    end
%for 90 degreecounter clockwise rotation around z axis
elseif typ==2
    out=zeros(sy,sx,sz);
    for i=1:sz
        out(:,:,i)=rot90(mat(:,:,i));
    end
%for 90 degreecounter clockwise rotation around y axis
elseif typ==3
    out=zeros(sx,sy,sz);
    d=zeros(sx,sz);
    for i=1:sy
        d(:,:)=mat(:,i,:);
        out(:,i,:)=rot90(d);
    end
% for mirror transformation in the diagonal dimension
elseif typ==4
    for j=1:sy
    for i=1:sx
        out(sx-j+1,sy-i+1,:)=mat(i,j,:);
    end
    end
elseif typ==-1
    for i=1:sz
        out(:,:,i)=mat(:,:,(sz+1-i));
    end
%for 90 degreecounter clockwise rotation around z axis
elseif typ==-2
    for i=1:sz
        out(:,:,i)=rot90(mat(:,:,i),-1);
    end
%for 90 degreecounter clockwise rotation around y axis
elseif typ==-3
    d=zeros(sx,sz);
    for i=1:sy
        d(:,:)=mat(:,i,:);
        out(:,i,:)=rot90(d,-1);
    end

end