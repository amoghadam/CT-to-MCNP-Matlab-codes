function [indx,indy,indz]=giveindex(i,sx,sy,sz)
if i>1
    indz=fix((i-1)/(sx*sy))+1;
    if indz>sz
        fprintf('>>> *WARNING:index out of matrix extension*')
    end
    indy=fix((i-1-((indz-1)*sx*sy))/sx)+1;
    indx=i-((indz-1)*sx*sy)-((indy-1)*sx);
else
    indz=1;
    indy=1;
    indx=1;
end