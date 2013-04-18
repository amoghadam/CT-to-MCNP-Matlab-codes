function [dr,dv]=DVH_plotter(dose,int)

ri=min(dose);
ri=0
ma=max(dose);

dr=(ri:((ma-ri)/int):ma);

ll=length(dr);
dvi=zeros(1,ll-1);
for i=1:ll-1
    dv(i)=100*(sum((dose>dr(i)))/length(dose));
end
dr(1)=[];

