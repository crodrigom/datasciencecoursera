set.seed(1234)
par(mar = c(0,0,0,0))
x = rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y = rnorm(12, mean = rep(c(1,2,1), each =4), sd = 0.2)
plot(x,y, col = "blue", pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels =as.character(1:12))

dataFrame = data.frame(x =x, y =y)
distxy <- dist(dataFrame) # default is the euclidean distance
hClustering = hclust(distxy)
plot(hClustering)

## ======= myplclust ======
myplclust <- function(hclust, lab = hclust$labels, lab.col = rep(1, length(hclust$labels)),
                      hang = 0.1, ...) {
    ## modifiction of plclust for plotting hclust objects *in colour*! Copyright
    ## Eva KF Chan 2009 Arguments: hclust: hclust object lab: a character vector
    ## of labels of the leaves of the tree lab.col: colour for the labels;
    ## NA=default device foreground colour hang: as in hclust & plclust Side
    ## effect: A display of hierarchical cluster with coloured leaf labels.
    y <- rep(hclust$height, 2)
    x <- as.numeric(hclust$merge)
    y <- y[which(x < 0)]
    x <- x[which(x < 0)]
    x <- abs(x)
    y <- y[order(x)]
    x <- x[order(x)]
    plot(hclust, labels = FALSE, hang = hang, ...)
    text(x = x, y = y[hclust$order] - (max(hclust$height) * hang), labels = lab[hclust$order],
         col = lab.col[hclust$order], srt = 90, adj = c(1, 0.5), xpd = NA, ...)
}


## ======
dataFrame <- data.frame(x = x, y = y)
distxy <- dist(dataFrame)
hClustering <- hclust(distxy)
myplclust(hClustering, lab = rep(1:3, each = 4), lab.col = rep(1:3, each = 4))

# Many other options http://gallery.r-enthusiasts.com/RGraphGallery.php?graph=79

## ===== hatmap()  ====== 
dataFrame <- data.frame(x = x, y = y)
set.seed(143)
dataMatrix <- as.matrix(dataFrame)[sample(1:12), ]
heatmap(dataMatrix)

## ====== K-means Clustering ====== 

set.seed(1234)
par(mar = c(0,0,0,0))
x = rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y = rnorm(12, mean = rep(c(1,2,1), each =4), sd = 0.2)
plot(x,y, col = "blue", pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels =as.character(1:12))

dataFrame <- data.frame(x, y)
kmeansObj <- kmeans(dataFrame, centers = 3) 
names(kmeansObj)

kmeansObj$cluster
kmeansObj$centers
kmeansObj$totss
kmeansObj$size
kmeansObj$iter

par(mar = rep(0.2, 4))
plot(x, y, col = kmeansObj$cluster, pch = 19, cex = 2) 
points(kmeansObj$centers, col = 1:3, pch = 3, cex = 3, lwd = 3)

# heatmaps and k-means

set.seed(1234)
dataMatrix <- as.matrix(dataFrame)[sample(1:12), ] 
kmeansObj2 <- kmeans(dataMatrix, centers = 3)
par(mfrow = c(1, 2), mar = c(2, 4, 0.1, 0.1))
image(t(dataMatrix)[, nrow(dataMatrix):1], yaxt = "n") 
image(t(dataMatrix)[, order(kmeansObj$cluster)], yaxt = "n")


