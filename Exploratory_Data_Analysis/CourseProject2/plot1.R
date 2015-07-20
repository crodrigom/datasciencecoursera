# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from 
# all sources for each of the years 1999, 2002, 2005, and 2008.

#download and unzip data
if(!file.exists("./data/Source_Classification_Code.rds")){
    temp = tempfile()
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
    download.file(fileUrl, temp, method = "curl")
    if(!file.exists("data")){ dir.create("./data") }
    unzip(temp, exdir = "./data")
}

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

sumNEI = sapply(split(NEI$Emissions, NEI$year), FUN = sum)

barplot(
    (sumNEI)/1000,
    names.arg=unique(NEI$year),
    xlab="Year",
    ylab="PM2.5 Emissions - Kilotons",
    main="Total PM2.5 Emissions by year"
)
dev.copy(png, file= "./plot1.png", height=480, width=480,bg="transparent") 
dev.off()