library(ggplot2)
input=sys.argv[1]
output=sys.argv[2]

data=read.table(input,header=F,row.names=1,sep="\t")
temp=data[,1]
data[,1]=data[,2]
data[,2]=temp
data=log2(data+1)
color=data[,1]
lm.velo<-lm(data[,2]~data[,1]+0)
pred.frame <- data.frame(GRID=data[,1])
pp<-predict(lm.velo,int="p",newdata=pred.frame)
mydf<-data.frame(pred.frame,pp)
mydf$lwr[mydf$lwr<0]=0

for (i in 1:length(data[,1]))
{color[i]="#0080FF"}

for (i in 1:length(data[,1]))
{
	if (data[i,2] < pp[i,2])
	{color[i]="#FF0080"}
	if (data[i,2] > pp[i,3])
	{color[i]="#FF8000"}
}

pdf(output)
qplot(data[,1],data[,2],colour=I(color),size=I(1.5),xlim=c(0,15),ylim=c(0,15),xlab=' ',ylab=' ')+geom_ribbon(aes(x=GRID,y=NULL,ymin=lwr,ymax=upr),data=mydf,color='blue',fill="blue",alpha=I(1/10))+theme_bw()+theme(axis.text=element_text(size=0))
dev.off()