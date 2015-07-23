# Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?


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

vehicles = grepl("Vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
subNEI = NEI[(NEI$SCC %in% SCC[vehicles,]$SCC),]

subNEI.Baltimire = subNEI[subNEI$fips == "24510",]
subNEI.LosAngeles = subNEI[subNEI$fips == "06037",]
subNEI.Baltimire$city <- "Baltimore City"
subNEI.LosAngeles$city <- "Los Angeles County"

subNEI <- rbind(subNEI.Baltimire,subNEI.LosAngeles)

library(ggplot2)

ggplot(subNEI, aes(x=factor(year), y=Emissions, fill=city)) +
    geom_bar(stat="identity",aes(fill = year)) +
    theme_bw() +  guides(fill=FALSE) +
    facet_grid(. ~ city) + # here the important part for this plot
    labs(x="year", y=expression("Total PM"[2.5]*" Emission")) +     
    labs(title=expression("Total Motor Vehicle Emissions in Baltimore and L.A. by year"))

dev.copy(png, file= "./plot6.png", height=480, width=480,bg="transparent") 
dev.off()

