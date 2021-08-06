output pdf file
install.packages("HiCdatR_0.99.0.tar.gz")

library(HiCdatR)
library("HiCseg")


pathToTutorial <- "C:\\GRID-seq\\Scripts\\Hi-C\\All\\Bedpe_new"
pathToScripts <- "C:\\Users\\Haofei\\Desktop\\HiCdat"

f.source.organism.specific.code(file.path(pathToScripts, "HiCdat-A-thaliana-TAIR10.R"))

binSize <- 20000

sampleList <- list(Wt = c("Wt.bedpe"))

binMatList <- f.load.samples(pathToTutorial, sampleList, binSize, 50)

f.HiC.correlation.matrix(binMatList, pathToTutorial, outfile = "At")

f.plot.XY.matrix(binMatList[["Wt"]], binSize, 1e7, pathToTutorial, "Wt_raw_interaction")

f.plot.XY.matrix(binMatList[["Wt"]], binSize, 1e7, pathToTutorial, "Wt_cor_interaction",doCor = TRUE)

myRes <- plot_rec(binMatList[["Wt"]], binSize, pathToTutorial, outfilePrefix = "Wt_domains", minAverageDomainSize = 1e6, distributionType = "G", modelType = "Dplus", useLog = TRUE, regionDefinitionTable = data.frame())
