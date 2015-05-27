rankall <- function(outcome, num = "best") {
    ## Read outcome data
    file <- read.csv("outcome-of-care-measures.csv", colClasses="character")
    
    ## Check that state and outcome are valid
    my_states <- unique(file[,7])
    my_states <- my_states[order(my_states)]
    my_outcomes <- c("heart attack", "heart failure", "pneumonia")
    
    #if (!is.element(state, my_states)) 
     #   stop("invalid state")
    if (!is.element(outcome, my_outcomes)) 
        stop("invalid outcome")
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    
    head <- NULL
    if (outcome == "heart attack") {
        head <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    } else if (outcome == "heart failure") {
        head <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    } else {
        head <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    }
    
    file_available<- file[!file[, head] == "Not Available",]  
    file_available[, head] <- as.numeric(file_available[, head]) 
    
    rank <-c()
    state <- c()
    
    #s <- split(file_available, file_available[, 7] )
    #i <- my_states[1]
    for(i in my_states){
        
        #sub_state  <- subset(file_available, State == state)
        sub_state  <- subset(file_available, State == i)
        sub <- sub_state[, head]
        
        
        
        if(is.numeric(num) && length(sub) < num){
            
            rank <- c(rank, NA)
            
        }else{ 
            
            if(num == "best"){
                index <- 1
            }else if (num == "worst"){
                index <- nrow(sub_state[head])
            }else{
                index <- num
            }
            
            hospital_index <- order(sub, sub_state[,2])[index]
            rank <- c(rank, as.vector(sub_state[,2][hospital_index]))
        }
        
        
        state <- c(state, i)
    
    }
    res <- data.frame(rank, state)
    colnames(res) <- c("hospital", "state")
    res
}

# tests
#outcome <- "heart attack"
#outcome <- "heart failure"
#num = 4

#source("rankall.R")
#head(rankall("heart attack", 20), 10)
#tail(rankall("pneumonia", "worst"), 3)
#tail(rankall("heart failure"), 10)