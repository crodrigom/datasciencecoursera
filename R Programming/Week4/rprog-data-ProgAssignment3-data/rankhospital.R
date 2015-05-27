rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    file <- read.csv("outcome-of-care-measures.csv", colClasses="character")
    
    ## Check that state and outcome are valid
    my_states <- unique(file[,7])
    my_outcomes <- c("heart attack", "heart failure", "pneumonia")
    
    if (!is.element(state, my_states)) 
        stop("invalid state")
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
    
    sub_state  <- subset(file_available, State == state)
    sub <- sub_state[, head]

    if(num == "best"){
        #index <- sort_head[1]
        #index <- min(as.vector(sub))
        index <- 1
    }else if (num == "worst"){
        #index = tail(sort_head, n = 1)
        index <- nrow(sub_state[head])
    }else{
        #sub_state[,2][order(sub, sub_state[,2])[num]]
        #index <- order(sub, sub_state[,2])[num] 
        index <- num
    }
    
    hospital_index <- order(sub, sub_state[,2])[index]
    as.vector(sub_state[,2][hospital_index])
    
}

# tests
#state <-"TX"
#state <-"MD"
#outcome <- "heart attack"
#outcome <- "heart failure"
#num = 4
#rankhospital("TX", "heart failure", 4)
#rankhospital("MD", "heart attack", "worst")
#rankhospital("MN", "heart attack", 5000)
#rankhospital("NC", "heart attack", "worst")
#rankhospital("WA", "heart attack", 7)
#rankhospital("WA", "pneumonia", 1000)
#rankhospital("NY", "heart attak", 7)