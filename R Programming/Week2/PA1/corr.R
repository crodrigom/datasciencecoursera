corr <- function(directory, threshold = 0) {
  source("complete.R")
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
    
  files_list <- list.files(directory, full.names=TRUE)
  correlationList <- c()
  #compl = complete(directory)
  compl = subset(complete(directory), nobs >threshold)
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  if (nrow(compl) > 0){
    for (i in 1:nrow(compl)){
      d <- read.csv(files_list[compl[i,"id"]])
      correlation <- cor(d["sulfate"], d["nitrate"], use = "complete.obs")
      correlationList<- c(correlationList, correlation)              
    }     
  }
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  correlationList
}