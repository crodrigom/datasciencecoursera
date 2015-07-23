# colorRamp
pal = colorRamp(c("red", "blue"))
pal(0) # red
pal(1) # blue
pal(0.5) # half way from red to blue

pal(seq(0,1, len=10))

# colorRamppalette
pal =  colorRampPalette(c("red", "yellow"))
pal(2)
pal(10)

# RColorBrewer
library(RColorBrewer)
cols <- brewer.pal(3, "BuGn")
cols
pal <- colorRampPalette(cols)
image(volcano, col = pal(20))


x = rnorm(10000)
y = rnorm(10000)
smoothScatter(x,y)

x = rnorm(1000)
y = rnorm(1000)
plot(x,y, pch =19)
plot(x,y, col =rgb(0,0,0,0.2), pch =19)
