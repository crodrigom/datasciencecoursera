if(!file.exists("./data")){ dir.create("./data")}
fileURL<- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileURL, destfile = "./data/cameras.csv", method = "curl")
cameraData <- read.csv("./data/cameras.csv")
names(cameraData)

tolower(names(cameraData))

splitNames = strsplit(names(cameraData), "\\.")
splitNames

splitNames[[6]][1]

firstElement = function(x){x[1]}
sapply(splitNames, firstElement)

grep("Alameda", cameraData$intersection)

table(grepl("Alameda", cameraData$intersection))

cameraData2 = cameraData[!grepl("Alameda", cameraData$intersection),]

grep("Alameda", cameraData$intersection, value = TRUE) # return actually the values where the criteria appears

grep("JeffStreet", cameraData$intersection)
length(grep("JeffStreet", cameraData$intersection))

library(stringr)
nchar("Jeffrey Leek")
substr("Jeffrey Leek",1,7)
paste("Jeffrey", "Leek")
paste0("Jeffrey", "Leek") # paste with no space between
str_trim("Rodrigo        ")

# ==== Regular Expressions =====

# ==== Dates =====


dl = date()
dl
class(dl)

d2 = Sys.Date()
dl
class(d2)

format(d2, "%a %b %d")
format(d2, "%A %B %D")

x = c("1jan1960", "2jan1960")
z = as.Date(x, "%d%b%Y")
z[1] - z[2]
as.numeric(z[1] - z[2])

weekdays(d2)
months(d2)
year(d2)
julian(d2) # amount of days since origin

library(lubridate)

ymd("20140108")
mdy("08/04/2013")
dmy("03-04-2013")
ymd_hms("2011-08-03 10:15:03")
ymd_hms("2011-08-03 10:15:03", tz = "Pacific/Auckland")

?Sys.timezone()



x = dmy(c("1jan1960", "2jan1960"))
wday(x[1])
wday(x[1], label = TRUE)

# === Data resourses ====






