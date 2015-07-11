
# ===== Question 1 ===== 

library(httr)
library(httpuv)

oauth_endpoints("github")
myapp <- oauth_app("github",
                   key = "da50a3d508ee23acc163",
                   secret = "1e52f411b11599cf7c754f9ee2a28c77699c9a2a")

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
content(req)



# ===== Question 2 =====  

library(sqldf)
acs <- read.csv("data//getdata-data-ss06pid.csv", header=T, sep=",")
#sqldf("select pwgtp1 from acs where AGEP < 50")

# ===== Question 3 =====  

library(httr)
library(httpuv)
oauth_endpoints("github")
myapp <- oauth_app("github",
                   key = "da50a3d508ee23acc163",
                   secret = "1e52f411b11599cf7c754f9ee2a28c77699c9a2a")

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp, cache = FALSE)

# 4. Use API
#gtoken <- config(token = github_token)
#req <- GET("https://api.github.com/rate_limit", gtoken)
#stop_for_status(req)
#content(req)

# OR:
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
json1 = content(req)
json <- jsonlite::fromJSON(toJSON(json1))
json$created_at[json$name=="datasharing"]



# ===== Question 4 =====  

hurl <- "http://biostat.jhsph.edu/~jleek/contact.html" 
con <- url(hurl)
htmlCode <- readLines(con)
close(con)

lines =c(10,20,30,100)
lapply(htmlCode[lines], nchar)

# ===== Question 5 =====  

#x <- read.fwf( file="./getdata-wksst8110.for", skip=4,   widths=c(10, 9,4, 9,4, 9,4, 9,4))

x <- read.fwf(
    file=url("http://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"),
    skip=4,
    widths=c(10, 9,4, 9,4, 9,4, 9,4))

sum(x[,4])


