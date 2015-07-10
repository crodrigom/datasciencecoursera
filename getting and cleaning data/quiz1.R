# ===== Question 1 =====

setwd("F://repos//datasciencecoursera//getting and cleaning data")
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv "
download.file(fileUrl, destfile = "data//survey.csv")

surveyData <- read.table("data//survey.csv", sep = ",", header = TRUE)

sum(!is.na(surveyData["VAL"][surveyData["VAL"] == 24])
    
    
# ===== Question 2 =====    

# ===== Question 3 =====    
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = "data//NGA.xlsx")
dateDownloaded <- date()
library(xlsx)
colIdx <- 7:15
rowIdx <- 18:23
dat <- read.xlsx("data//NGA.xlsx", sheetINdex = 1, header = TRUE,  colIndex=colIdx, rowIndex=rowIdx)
sum(dat$Zip*dat$Ext,na.rm=T) 


# ===== Question 4 =====   
library(XML)
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileUrl, useInternalNodes = TRUE)
rootnode <- xmlRoot(doc)
rootnode
sum(xpathSApply(rootnode, "//zipcode", xmlValue) == 21231)

# ===== Question 5 =====   
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "data//ACsurvey.csv")
DT <- fread("data//ACsurvey.csv")
file.info("data//ACsurvey.csv")$size
system.time(DT[,mean(pwgtp15),by=SEX]);
system.time(mean(DT[DT$SEX==1,]$pwgtp15)) + system.time(mean(DT[DT$SEX==2,]$pwgtp15))
system.time(tapply(DT$pwgtp15,DT$SEX,mean));
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean));
system.time(DT[,mean(pwgtp15),by=SEX]);
system.time(rowMeans(DT)[DT$SEX==1] )+ system.time(rowMeans(DT)[DT$SEX==2]);






