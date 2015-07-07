best <- function(state, outcome) {
    ## Read outcome data
    #state <-"TX"
    #outcome <- "heart attack"
    
    file <- read.csv("outcome-of-care-measures.csv", sep = ",")
    
    ## Check that state and outcome are valid
    my_states <- c("AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY")
    my_outcomes <- c("heart attack", "heart failure", "pneumonia")
        
    if (!is.element(state, my_states)) 
        stop("The state is not valid")
    if (!is.element(outcome, my_outcomes)) 
        stop("The desired outcome is not valid")
    
    
    ## Return hospital name in that state with lowest 30-day death
    
    head <- NULL
    if (outcome == "heart attack") {
        head <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    } else if (outcome == "heart failure") {
        head <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    } else  if (outcome == "pneumonia") {
        head <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    } else {
        stop("Error in the outcome type")
    }
    
    #sub_state  <- subset(file, State == state)
    sub_state <- file[file$State == state,]
    
    sub <- sub_state[, head]
    sub <- sub[!sub == "Not Available"]  
    sub <- as.numeric(as.character(sub))
    
    lowest_mortality <-min(sub)
    #lowest_mortality <- min(as.vector(sub[,head]))
    hospitais <- sub_state[sub_state[,head] == lowest_mortality,]
    #hospitais <- sub_state[sub_state[,head] == as.character(sort(sub)[1]),]
    
    hosp <- sort(hospitais[,"Hospital.Name"])
    ## rate
    #return(as.character(hosp[1]))
    
    mortality_rate <- sub_state[,head]
    mortality_rate <- mortality_rate[!mortality_rate == "Not Available"]
    mortality_rate <- as.numeric(as.character(mortality_rate))
    min_rate <- min(mortality_rate)
    best_hosps <- data[data[,head] == min_rate,]
    hosp_names <- sort(best_hosps[,"Hospital.Name"])
    return(as.character(hosp_names[1]))
    
}

