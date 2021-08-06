library(ggplot2)

setwd('D:\\GRID\\Revise\\Stress\\GRID_diff\\Diff_GRID_GRO')

pdf('DC3000.pdf')
data=read.table('DC3000',row.names=1,header=F)
data=data[order(data[,3],decreasing=T),]
qplot(log2(data[,1]+1),log2(data[,2]+1),color=I(as.factor(data[,4])),size=I(4),xlab='',ylab='',ylim=c(0,15),xlim=c(0,15))+theme_bw()+theme(axis.text=element_text(size=1))+ theme(panel.grid.major =element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(),axis.line = element_line(colour = "black"))
#qplot(log2(data[,1]+1),log2(data[,2]+1),color=I(as.factor(data[,4])),size=I(4),xlab='',ylab='',ylim=c(0,15),xlim=c(0,15))+theme_bw()

dev.off()

pdf('Heat.pdf')
data=read.table('Heat',row.names=1)
data=data[order(data[,3],decreasing=T),]
qplot(log2(data[,1]+1),log2(data[,2]+1),color=I(as.factor(data[,4])),size=I(4),xlab='',ylab='',ylim=c(0,15),xlim=c(0,15))+theme_bw()+theme(axis.text=element_text(size=1))+ theme(panel.grid.major =element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(),axis.line = element_line(colour = "black"))
#qplot(log2(data[,1]+1),log2(data[,2]+1),color=I(as.factor(data[,4])),size=I(4),xlab='',ylab='',ylim=c(0,15),xlim=c(0,15))+theme_bw()

dev.off()

tiff('DC3000.tiff')
data=read.table('DC3000',row.names=1,header=F)
data=data[order(data[,3],decreasing=T),]
qplot(log2(data[,1]+1),log2(data[,2]+1),color=I(as.factor(data[,4])),size=I(4),xlab='',ylab='',ylim=c(0,15),xlim=c(0,15))+theme_bw()+theme(axis.text=element_text(size=1))+ theme(panel.grid.major =element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(),axis.line = element_line(colour = "black"))
#qplot(log2(data[,1]+1),log2(data[,2]+1),color=I(as.factor(data[,4])),size=I(4),xlab='',ylab='',ylim=c(0,15),xlim=c(0,15))+theme_bw()

dev.off()

tiff('Heat.tiff')
data=read.table('Heat',row.names=1)
data=data[order(data[,3],decreasing=T),]
qplot(log2(data[,1]+1),log2(data[,2]+1),color=I(as.factor(data[,4])),size=I(4),xlab='',ylab='',ylim=c(0,15),xlim=c(0,15))+theme_bw()+theme(axis.text=element_text(size=1))+ theme(panel.grid.major =element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(),axis.line = element_line(colour = "black"))
#qplot(log2(data[,1]+1),log2(data[,2]+1),color=I(as.factor(data[,4])),size=I(4),xlab='',ylab='',ylim=c(0,15),xlim=c(0,15))+theme_bw()

dev.off()