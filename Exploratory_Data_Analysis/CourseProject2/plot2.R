# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

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

subNEI = NEI[NEI$fips == "24510",]

#sumNEI = sapply(split(subNEI$Emissions, NEI$year), FUN = sum) # I got a warning, decided to change the method
sumNEI = aggregate(Emissions ~ year, subNEI,sum)

barplot(
    sumNEI$Emissions,
    names.arg=unique(sumNEI$year),
    xlab="Year",
    ylab="PM2.5 Emissions - Tons",
    main="Total PM2.5 Emissions in Baltimore city by year"
)
dev.copy(png, file= "./plot2.png", height=480, width=480,bg="transparent") 
dev.off()