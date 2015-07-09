setwd("/Users/rodrigo/repos/datasciencecoursera")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile="./communities.csv", method="curl")
data <- read.csv("./communities.csv")

str(data)
quantile(data$ADJUST, probs=c(.5,.75,.9))
table(data$SERIALNO, data$PUMA)
any(is.na(data$SERIALNO))
table(data$SERIALNO %in% c("186","3331"))

data[data$SERIALNO %in% c("186","3331"),]

data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
xt <- xtabs(Freq ~ Gender + Admit, data=DF)
xt

DF$replicate <- rep(1:9, len = 24)
xt <- xtabs(Freq ~., data=DF)
xt

ftable(xt)

object.size(data)


#====== creating new variables ======
if(!file.exists("./data")) {dir.create("./data")}
fileURL <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileURL, destfile = "./data/restaurants.csv", method="curl")
restData <- read.csv("./data/restaurants.csv")

x <- c(1,3,8,25,100); seq(along = x) # to be used as index of x

restData$nearMe <- restData$neighborhood %in% c("Roland Park", "Homeland")
restData$zipWrong = ifelse(restData$zipCode <0, TRUE, FALSE)
table(restData$zipWrong, restData$zipCode <0)

#almost a histogram
restData$Groups = cut(restData$zipCode, breaks = quantile(restData$zipCode))
table(restData$Groups)
table(restData$Groups, restData$zipCode)

library(Hmisc)
restData$zipGroups = cut2(restData$zipCode, g=4)

# zipcode is not numeric, better to change to factor
restData$zcf <- factor(restData$zipCode)

#======= reshaping data ========

library(reshape2)
mtcars$carname <- rownames(mtcars)
head(mtcars)
carMelt <- melt(mtcars, id=c("carname", "gear", "cyl"), measure.vars=c("mpg", "hp"))
head(carMelt)

dcast(carMelt, cyl ~ variable)
dcast(carMelt, cyl ~ variable, mean)

tapply(InsectSprays$count, InsectSprays$spray, sum)  # apply a function sum given index spray
#OR
unlist(lapply(split(InsectSprays$count, InsectSprays$spray), sum))
#OR
sapply(split(InsectSprays$count, InsectSprays$spray), sum)
#OR
library(plyr)
ddply(InsectSprays,.(spray), summarise, sum=sum(count))

#in the same size of the original data set
ddply(InsectSprays,.(spray), summarise, sum=ave(count, FUN=sum))
dim(InsectSprays)
#Take a look in the plyr and reshape tutorial in this lecture

# ======== dplyr  ======

library(dplyr)

# I believe it is valid watch this tutorial again and read the dplyr package documentation 

# ======== merging data  ======

#merge all data sets using id and soltion _id as reference
# all=TRUE garantee that if there is a value in one and not in the other it will be added
mergeData = merge(reviews, solutions, by.x="solution_id", by.y="id", all=TRUE)









