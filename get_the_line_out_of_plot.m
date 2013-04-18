function [dr1,dr2]=get_the_line_out_of_plot(d1,d2,k,centx,centy,typ)
if typ==1
    dr1=d1(centx:end,centy,k);
    dr2=d2(centx:end,centy,k);
   plot(dr1./dr2,'b')
%    figure
%    plot(dr2,'r')
    
end