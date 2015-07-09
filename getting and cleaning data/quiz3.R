# q1
setwd("/Users/rodrigo/repos/datasciencecoursera")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile="./communities.csv", method="curl")
data <- read.csv("./communities.csv")


agricultureLogical = (data$ACR == 3 & data$AGS == 6)
which(agricultureLogical)[1:3]

#q2

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(url, "./data/jeff.jpg", mode = "wb", method = "curl")
img <- readJPEG("./data/jeff.jpg", native = TRUE)

quantile(img, probs=c(.3,.8), native = TRUE)

#q3
dataGDP <- read.csv(url("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"), skip = 4, nrow = 232)
dataEDU <- read.csv(url("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv "))

data <- merge(dataGDP, dataEDU, all = TRUE, by.x="X", by.y="CountryCode")
sum(!is.na(unique(data$X.1))) # ID that did not match has NA

dt <- data[order(data$X.1, decreasing = TRUE),]
dt[13,1:4]

#q4
data_splited <- split(dt, dt$Income.Group)
c(mean(data_splited[["High income: OECD"]]$X.1), mean(data_splited[["High income: nonOECD"]]$X.1, na.rm = TRUE))
#OR
aggregate(X.1~Income.Group,dt, mean)

#q5
library(Hmisc)
groups = cut2(data$X.1, g=5)
table(groups, data$Income.Group)







