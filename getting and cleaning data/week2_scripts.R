#http://genome.ucsc.edu/goldenPath/help/mysql.html
#mysql --user=genome --host=genome-mysql.cse.ucsc.edu -A

ucscDB <- dbConnect(MySQL(), user="genome", host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDB, "show databases;");
dbDisconnect(ucscDB) # always disconect!!!!!


hg19 <- dbConnect(MySQL(), user="genome", db="hg19", host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)

dbListFields(hg19, "affyU133Plus2")
dbGetQuery(hg19, "select count(*) from affyU133Plus2")

affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData)


query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query);
quantile(affyMis$misMatches)

affyMissSmall <- fetch(query,n = 10); dbClearResult(query); # clear the quare from remote server

dbDisconnect(hg19) # always disconect!!!!!


#===========HDF5 package =================

source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")
library(rhdf5)

created = h5createFile("example.h5")
created

created = h5createGroup("example.h5", "foo")
created = h5createGroup("example.h5", "baa")
created = h5createGroup("example.h5", "foo/foobaa")
h5ls("example.h5")

A = matrix(1:10, nr=5,nc=2)
h5write(A, "example.h5", "foo/A")
B = array(seq(0.1,2.0,by=0.1),dim=c(5,2,2))
attr(B, "scale") <- "liter"
h5write(B, "example.h5", "foo/foobaa/B")
h5ls("example.h5")

df = data.frame(1L:5L, seq(0,1,length.out =5), c("ab", "cde", "fghi", "a", "s"), stringsAsFactors = FALSE)
h5write(df, "example.h5", "df")
h5ls("example.h5")

readA = h5read("example.h5", "foo/A")
readB = h5read("example.h5", "foo/foobaa/B")
readdf = h5read("example.h5", "df")

# writing in a specific index
h5write(c(12,13,14), "example.h5", "foo/A", index=list(1:3,1))
h5read("example.h5", "foo/A")
h5read("example.h5", "foo/A", index=list(1:3,1))


H5close()


# ======== reading data from web ===============





# ======== reading data from API ===============

library(httr)
library(rjson)
myapp = oauth_app("twitter", 
                  key="qbfDooFLCYPN303WkWjRlCQvz", 
                  secret = "PgMOXZPM1SkCJdnbqS9gDLte8o3BhXLqLpPf55AlbG82pl6tPN")
sig = sign_oauth1.0(myapp, 
                    token = "RWg3m9qO1efD1ElJrpFrPoRXshq5dPIjzThY9OKIN", 
                    token_secret = "OFzl5kmsRiiUCBHf8o4ATBwgWriSDDosyg9BbUMPwSOMM")
homeTL = GET('https://api.twitter.com/1.1/statuses/home_timeline.json', sig)

json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]








