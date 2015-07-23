# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

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
vehicles = grepl("Vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
subNEI = subNEI[(subNEI$SCC %in% SCC[vehicles,]$SCC),]
sumNEI = aggregate(Emissions ~ year, subNEI,sum)

library(ggplot2)

ggplot(sumNEI,aes(year,Emissions)) +
    geom_bar(stat="identity",aes(fill = year)) +
    theme_bw() +  guides(fill=FALSE) +
    labs(x="year", y=expression("Total PM"[2.5]*" Emission")) + 
    labs(title=expression("Total Motor Vehicle Emissions in Baltimore city by year"))
dev.copy(png, file= "./plot5.png", height=480, width=480,bg="transparent") 
dev.off()