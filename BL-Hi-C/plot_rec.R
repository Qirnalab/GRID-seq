plot_rec <- function (dataMatrix, binSize, rDir, outfilePrefix = "domains", 
    minAverageDomainSize = 1e+06, distributionType = "G", modelType = "D", 
    useLog = TRUE, regionDefinitionTable = data.frame()) 
{
    if (nrow(regionDefinitionTable) == 0) {
        chromSizes <- f.get.relevant.chrom.sizes()
        regionDefinitionTable <- data.frame(chrom = names(chromSizes), 
            start = rep(0, length(chromSizes)), end = unlist(chromSizes), 
            stringsAsFactors = FALSE)
    }
    if (ncol(regionDefinitionTable) == 3) {
        regionDefinitionTable$name <- paste(regionDefinitionTable$chrom, 
            regionDefinitionTable$start, regionDefinitionTable$end, 
            sep = "_")
    }
    rownames(regionDefinitionTable) <- regionDefinitionTable$name
    out <- list()
    for (rn in rownames(regionDefinitionTable)) {
        rc <- regionDefinitionTable[rn, "chrom"]
        rs <- regionDefinitionTable[rn, "start"]
        re <- regionDefinitionTable[rn, "end"]
        temp <- f.extract.subset(dataMatrix, binSize, rc, rc, 
            xStart = rs, yStart = rs, xEnd = re, yEnd = re)
        if (useLog) {
            temp <- log2(temp + 1)
        }
        res <- HiCseg_linkC_R(ncol(temp), ceiling((re - rs)/minAverageDomainSize), 
            distributionType, temp, modelType)
        if (sum(res[["t_hat"]] == 0) == 0) {
            cat(paste("There may be more domains in the region ", 
                rn, "\n", sep = ""))
        }
        out[[rn]] <- data.frame(tHat = res$t_hat, logLikelihood = res$J, 
            chrom = rep(rc, length(res$t_hat)), boundary = rs + 
                (res$t_ha - 1) * binSize)
        out[[rn]] <- out[[rn]][out[[rn]]$tHat != 0, ]
        write.table(out[[rn]], file.path(rDir, paste(outfilePrefix, 
            "_", rn, ".txt", sep = "")), sep = "\t", quote = FALSE, 
            row.names = FALSE)
        cm <- cor(f.internal.normalize.distance(temp))
        diag(cm) <- mean(cm[(row(cm) == col(cm) + 1)])
        ##########t_hat : bins to draw the black squar 修改的地方！#######
        Boundary=read.table(paste("C:\\GRID-seq\\Scripts\\Hi-C\\All\\Each_Chr\\DC3000.bedGraph.",strsplit(rn,'_')[[1]][1],sep=""))
        Boundary=sort(floor(Boundary)[,1])

        t_hat=c(0,Boundary,dim(cm)[1])
        #t_hat <- c(1, res$t_hat[res$t_hat != 0])
        ##################################################
        linesMat <- matrix(0, nrow(cm), ncol(cm))
        for (i in 1:(length(t_hat) - 1)) {
            cs <- t_hat[i]:t_hat[i + 1]
            linesMat[t_hat[i], cs] <- 1
            linesMat[cs, t_hat[i]] <- 1
            linesMat[t_hat[i + 1], cs] <- 1
            linesMat[cs, t_hat[i + 1]] <- 1
        }
        axLabelPos <- seq(1, ncol(temp), length.out = 10)
        axLabels <- (rs + (axLabelPos - 1) * binSize)
        if ((re - rs) > 1e+07) {
            axLabels <- axLabels/1e+06
        }
        axLabels <- round(axLabels, 2)
        colorSet <- colorRampPalette(c("#ffeda0", "#feb24c", 
            "#f03b20"))(64)
        if (GLOBAL_VARIABLE_USE_SVG_AND_RSVG_CONVERT) {
            svg(file.path(rDir, paste(outfilePrefix, "_", rn, 
                ".svg", sep = "")), height = 19, width = 19)
        }
        else {
            pdf(file.path(rDir, paste(outfilePrefix, "_", rn, 
                ".pdf", sep = "")))
        }
        par(oma = c(5, 5, 0, 0), mar = c(5, 5, 0, 0))
        image(1:ncol(cm), 1:ncol(cm), cm, col = colorSet, useRaster = TRUE, 
            yaxt = "n", xaxt = "n", xlab = "", ylab = "")
        axis(1, at = axLabelPos, labels = axLabels, outer = FALSE, 
            line = 2, lwd = 2, cex.axis = 1.5, las = 2)
        axis(2, at = axLabelPos, labels = axLabels, outer = FALSE, 
            line = 2, lwd = 2, cex.axis = 1.5, las = 1)
        image(1:ncol(cm), 1:ncol(cm), linesMat, col = c(rgb(1, 
            1, 1, 0), rgb(0, 0, 0, 1)), add = TRUE)
        dev.off()
    }
    return(out)
}
