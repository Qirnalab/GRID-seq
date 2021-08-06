library(edgeR)

setwd('D:\\GRID\\Revise\\Stress\\GRID_diff\\')

data = read.table("DC3000_Common", header=F, row.names=1, sep='\t')
rnaseqMatrix = data
rnaseqMatrix = round(rnaseqMatrix)
conditions = c("Control","Control",'DC3000','DC3000')
 
exp_study = DGEList(counts=rnaseqMatrix, group=conditions)
exp_study = calcNormFactors(exp_study)

et = exactTest(exp_study, pair=c(conditions[1], conditions[3]), dispersion=0.01)
tTags = topTags(et,n=NULL)
write.table(tTags, file=paste(conditions[1], conditions[3],sep='_vs_'), sep='\t', quote=F, row.names=T)


data = read.table("Heat_Common", header=F, row.names=1, sep='\t')
rnaseqMatrix = data
rnaseqMatrix = round(rnaseqMatrix)
conditions = c("Control","Control",'Heat','Heat')
 
exp_study = DGEList(counts=rnaseqMatrix, group=conditions)
exp_study = calcNormFactors(exp_study)

et = exactTest(exp_study, pair=c(conditions[1], conditions[3]), dispersion=0.01)
tTags = topTags(et,n=NULL)
write.table(tTags, file=paste(conditions[1], conditions[3],sep='_vs_'), sep='\t', quote=F, row.names=T)

