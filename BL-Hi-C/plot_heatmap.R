function (matrixToPlot, binSize, axStep, rDir, outfile, chromA = "ALL", 
    startA = 0, endA = 0, chromB = "ALL", startB = 0, endB = 0, 
    useLog = TRUE, drawGrid = FALSE, doNorm = FALSE, doCor = FALSE, 
    useSplineInterPol = TRUE) 
{
    seList <- f.get.se.list(binSize)
    chromSizes <- f.internal.get.chrom.sizes()
    if (startA < axStep) {
        startA <- 0
    }
    if (startB < axStep) {
        startB <- 0
    }
    if (chromA == "ALL") {
        sa <- 1
        ea <- nrow(matrixToPlot)
        xAxAt <- as.vector(unlist(f.internal.axis.maker.on.index(binSize, 
            axStep, seList)))
        xAxLab <- as.vector(unlist(f.internal.axis.maker(binSize, 
            axStep, seList)))/1e+06
        xGrid <- do.call("rbind", seList)[, 1]
    }
    else {
        if (endA > chromSizes[[chromA]]) {
            endA <- chromSizes[[chromA]]
        }
        sa <- f.translate.chrom.pos.to.index(chromA, startA, 
            seList, binSize)
        ea <- f.translate.chrom.pos.to.index(chromA, endA, seList, 
            binSize)
        xAxAt <- seq(0, (ea - sa), by = axStep/binSize)
        xAxLab <- seq(startA, endA, by = axStep)/1e+06
        xGrid <- xAxAt
    }
    if (chromB == "ALL") {
        sb <- 1
        eb <- ncol(matrixToPlot)
        yAxAt <- as.vector(unlist(f.internal.axis.maker.on.index(binSize, 
            axStep, seList)))
        yAxLab <- as.vector(unlist(f.internal.axis.maker(binSize, 
            axStep, seList)))/1e+06
        yGrid <- do.call("rbind", seList)[, 1]
    }
    else {
        if (endB > chromSizes[[chromB]]) {
            endB <- chromSizes[[chromB]]
        }
        sb <- f.translate.chrom.pos.to.index(chromB, startB, 
            seList, binSize)
        eb <- f.translate.chrom.pos.to.index(chromB, endB, seList, 
            binSize)
        yAxAt <- seq(0, (eb - sb), by = axStep/binSize)
        yAxLab <- seq(startB, endB, by = axStep)/1e+06
        yGrid <- yAxAt
    }
    if (doCor) {
        matrixToPlot <- f.correlate.data.matrix(matrixToPlot, 
            binSize, useLog)
    }
    else {
        if (doNorm) {
            matrixToPlot <- f.normalize.data.matrix.like.LA(matrixToPlot, 
                binSize)
        }
        else {
            if (useLog) {
                matrixToPlot <- log2(matrixToPlot + 1)
            }
        }
    }
    matrixToPlot <- matrixToPlot[sa:ea, sb:eb]
    if (GLOBAL_VARIABLE_USE_SVG_AND_RSVG_CONVERT) {
        svg(file.path(rDir, paste(outfile, ".svg", sep = "")), 
            height = 19, width = 19)
    }
    else {
        tiff(file.path(rDir, paste(outfile, ".tiff", sep = "")), 
            width = 2400, height = 2400)
    }
    par(oma = c(5, 5, 0, 0), mar = c(5, 5, 0, 0))
    if (doCor) {
        if (useSplineInterPol) {
            colorSet <- colorRampPalette(c("#ffeda0", "#feb24c", 
                "#f03b20"), interpolate = "spline")(64)
        }
        else {
            colorSet <- colorRampPalette(c("#ffeda0", "#feb24c", 
                "#f03b20"))(64)
        }
        image(1:nrow(matrixToPlot), 1:ncol(matrixToPlot), matrixToPlot, 
            col = colorSet, useRaster = TRUE, yaxt = "n", xaxt = "n", 
            xlab = "", ylab = "")
    }
    else {
        if (useSplineInterPol) {
            colorSet <- colorRampPalette(c("black", "yellow", 
                "red"), interpolate = "spline")(64)
        }
        else {
            colorSet <- colorRampPalette(c("black", "yellow", 
                "red"))(64)
        }
        image(1:nrow(matrixToPlot), 1:ncol(matrixToPlot), matrixToPlot, 
            col = colorSet, useRaster = TRUE, yaxt = "n", xaxt = "n", 
            xlab = "", ylab = "")
    }
    axis(1, at = xAxAt, labels = xAxLab, outer = FALSE, line = 2, 
        lwd = 2, cex.axis = 1.5, las = 2)
    axis(2, at = yAxAt, labels = yAxLab, outer = FALSE, line = 2, 
        lwd = 2, cex.axis = 1.5, las = 1)
    if (drawGrid) {
        abline(h = yGrid, v = xGrid, lwd = 2, col = "white")
    }
    dev.off()
    if (GLOBAL_VARIABLE_USE_SVG_AND_RSVG_CONVERT) {
        system(paste("rsvg-convert -a -d 100 -p 100 ", file.path(rDir, 
            paste(outfile, ".svg", sep = "")), " > ", file.path(rDir, 
            paste(outfile, ".png", sep = "")), sep = ""))
    }
}
