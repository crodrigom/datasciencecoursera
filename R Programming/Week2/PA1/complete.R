complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  files_list <- list.files(directory, full.names=TRUE)
  dat <- data.frame()
  nobs <- data.frame()
  completeCases <- data.frame()
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  
  for (i in id){
    d    <- read.csv(files_list[i])
    nobs <- sum(complete.cases(d))
    completeCases <- rbind(completeCases, data.frame(id = i,nobs))
  }
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  #dat[complete.cases(dat),]
  #nrow(dat[complete.cases(dat),])
  #sum(complete.cases(dat))
  completeCases
}