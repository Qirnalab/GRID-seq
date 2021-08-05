load('GRO_exp.mat')
Heat=GRO(:,1:4);
DC3000=GRO(:,5:8);
Heat_cor=corr(Heat);
DC3000_cor=corr(DC3000);

xvalues = {'Mock1','Mock2','Heat1','Heat2'};
yvalues = {'Mock1','Mock2','Heat1','Heat2'};
heatmap(xvalues,yvalues,Heat_cor)


xvalues2 = {'Mock1','Mock2','DC3000_1','DC3000_2'};
yvalues2 = {'Mock1','Mock2','DC3000_1','DC3000_2'};
heatmap(xvalues2,yvalues2,DC3000_cor)