function out=deletezeros(mat)
sx=length(mat);
for j=sx:-1:1
    if mat(j)<0
        mat(j)=[];
    end
end
out=mat;