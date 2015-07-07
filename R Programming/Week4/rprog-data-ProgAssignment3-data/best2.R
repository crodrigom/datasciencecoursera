best <- function(state, outcome) {
    ## Read outcome data

    file <- read.csv("outcome-of-care-measures.csv", colClasses="character")
    
    ## Check that state and outcome are valid
    my_states <- c("AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY")
    my_outcomes <- c("heart attack", "heart failure", "pneumonia")
        
    if (!is.element(state, my_states)) 
        stop("invalid state")
    if (!is.element(outcome, my_outcomes)) 
        stop("invalid outcome")
    
    
    ## Return hospital name in that state with lowest 30-day death
    
    head <- NULL
    if (outcome == "heart attack") {
        head <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    } else if (outcome == "heart failure") {
        head <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    } else {
        head <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    }
    
    file<- file[!file[, head] == "Not Available",]  
    file[, head] <- as.numeric(file[, head]) 
    
    
    #sub_state <- file[file[, "State"]==state, ]
    sub_state  <- subset(file, State == state)
    sub <- sub_state[, head]
    min <- min(as.vector(sub), na.rm=TRUE)
    hospitais <- sub_state[which(sub == min),2]
    
    as.vector(sort(hospitais)[1])
    
}

# tests
#state <-"TX"
#outcome <- "heart attack"
#outcome <- "heart failure"
#best("TX", "heart attack")
#best("TX", "heart failure")
#best("MD", "heart attack")
#best("BB", "heart attack")
#best("NY", "hert attack")