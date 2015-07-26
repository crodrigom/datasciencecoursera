#Q1

if(!file.exists("./data")){ dir.create("./data")}
fileURL<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile = "./data/housingIdaho.csv", method = "curl")
housingIdaho <- read.csv("./data/housingIdaho.csv")
names(housingIdaho)

names = strsplit(names(housingIdaho), "wgtp")
names[[123]]

#Q2

fileURL<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileURL, destfile = "./data/GDP.csv", method = "curl")
data <- read.csv("./data/GDP.csv", skip = 4, nrow = 215)
names(data)[1:5] <- c("countrycode", "rankinggdp", "NA", "countryname", "gdp")
data$gdp = as.numeric(gsub(",", "", data$gdp))
avg = mean(data$gdp, na.rm = TRUE)
avg

#Q3
countryNames = data$countryname
grep("^United",countryNames)
summary(grepl("^United",countryNames)) # qtty of TRUEs

#Q4


fileURL<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileURL, destfile = "./data/GDP.csv", method = "curl")
dataGDP <- read.csv("./data/GDP.csv", skip = 4, nrow = 215)
names(dataGDP)[1:5] <- c("CountryCode", "rankinggdp", "NA", "countryname", "gdp")

fileURL<- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
download.file(fileURL, destfile = "./data/educational.csv", method = "curl")
dataEdu <- read.csv("./data/educational.csv")

data = merge(dataGDP, dataEdu, all =TRUE, by = c("CountryCode"))
data$Special.Notes = tolower(data$Special.Notes)
fiscalYearEndsJune = grepl("fiscal year end: june", data$Special.Notes)
sum(fiscalYearEndsJune)


#Q5

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 

collected2012 = amzn[year(sampleTimes) == 2012]
nrow(collected2012)
nrow(amzn[wday(collected2012, label = TRUE) == "Mon"])

