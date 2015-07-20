# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make 
# a plot answer this question.

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
#sumNEI = aggregate(Emissions ~ year, subNEI,sum)

library(ggplot2)

ggplot(data = subNEI, aes(factor(year), Emissions, fill =type)) +
geom_bar(stat="identity") +
guides(fill=FALSE) +
facet_grid(.~type) + 
ylab(expression("Total PM"[2.5]*" Emission - Tons")) +
xlab("Year")
labs(title=expression("PM"[2.5]*" Emissions, Baltimore City (1999-2008) by Type"))

dev.copy(png, file= "./plot3.png", height=480, width=480,bg="transparent") 
dev.off()