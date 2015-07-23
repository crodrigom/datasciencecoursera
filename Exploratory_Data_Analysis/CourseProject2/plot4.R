# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?

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

coal.combustion = grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) &
    grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)


subNEI = NEI[NEI$SCC %in%  SCC[coal.combustion,]$SCC,]
sumNEI = sapply(split(subNEI$Emissions, subNEI$year), FUN = sum)

barplot(
    (sumNEI)/100,
    names.arg=unique(subNEI$year),
    xlab="Year",
    ylab="PM2.5 Emissions - Kilotons",
    main="Coal Combustion Emissions Across US by year"
)
dev.copy(png, file= "./plot4.png", height=480, width=480,bg="transparent") 
dev.off()