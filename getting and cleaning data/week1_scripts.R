setwd("F://repos//datasciencecoursera//getting and cleaning data")
        
if(!file.exists("data")){
        dir.create("data")
}
fileUrl <- "http://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD&bom=true"
download.file(fileUrl, destfile = "data//cameras.csv")#, method = "curl") # add method = "curl"if downloding from https in MAC
dateDownloaded <- date()


cameraData <- read.table("data//cameras.csv", sep = ",", header = TRUE)



#===================

fileUrl <- "http://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "data//cameras.xlsx")#, method = "curl") # add method = "curl"if downloding from https in MAC
dateDownloaded <- date()

install.packages("rJava")
install.packages("xlsx")
library(rJava)
library(xlsx)
cameraData <-read.xlsx(sheetINdex = 1, header = TRUE)

Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_31')
Sys.setenv(JAVA_HOME='C:\\Program Files (x86)\\Java\\jre1.8.0_45')


#===================

install.packages("XML")
library(XML)
fileUrl <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileUrl, useInternalNodes = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)

names(rootNode)

rootNode[[1]]
rootNode[[1]][[1]]

xmlApply(rootNode, xmlValue)

xpathSApply(rootNode, "//name", xmlValue)

xpathSApply(rootNode, "//price", xmlValue)


#==
fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileUrl, useInternalNodes = TRUE)
teams <- xpathSApply(doc, "//li[@class='team-name']", xmlValue)

#========= JSON ========

install.packages("jsonlite")
library(jsonlite)
install.packages('curl')

jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)
names(jsonData$owner)
jsonData$owner$login

myjson <- toJSON(iris, pretty = TRUE)
cat(myjson)


#===== data.table package ====

install.packages("data.table")
library(data.table)
DF = data.frame(x = rnorm(9), y=rep(c("a", "b", "c"), each=3), z=rnorm(3))
head(DF,3)

DT = data.table(x = rnorm(9), y=rep(c("a", "b", "c"), each=3), z=rnorm(3))
head(DT,3)


DT[2,]
DT[DT$y=="a",]
DT[c(2,3)]

{
        x =1
        y =2
}
k = {print(10); 5}
print(k)


DT[,list(mean(x), sum(z))] # I can pass a list of function I would like to perform

DT[,table(y)]


DT[,w:=z^2] # add a new collunm


DT[, b:= mean(x+w), by=a] # compute the mean of all rows where a is equal to TRUE, then calculate the mean to all where a is equal to FALSE

DT[, .N, by= x] # count the number of each value of x appears

system.time(fread(file)) # calculate the time to read the file


