Practice Assignment

======

To begin, download this file and unzip it into your R working directory.
http://s3.amazonaws.com/practice_assignment/diet_data.zip

### You can do this in R with the following code:

    dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
    download.file(dataset_url, "diet_data.zip")
    unzip("diet_data.zip", exdir = "diet_data")
    
List Files

    list.files("diet_data")
    
Let's take a look at one to see what's inside:

    andy <- read.csv("diet_data/Andy.csv")
    head(andy)
    
Let's figure out how many rows there are by looking at the length of the 'Day' column:

    length(andy$Day)
    
Alternatively, you could look at the dimensions of the data.frame. 
This tells us that we 30 rows of data in 4 columns:

    dim(andy)
    
    
Other commands we might want to run to get a feel for a new data file, str(), summary(), and names().

    str(andy)
    summary(andy)
    names(andy)
    
Result

    > names(andy)
    [1] "Patient.Name" "Age"          "Weight"      
    [4] "Day"         
    
    > str(andy)
    'data.frame':	30 obs. of  4 variables:
    $ Patient.Name: Factor w/ 1 level "Andy": 1 1 1 1 1 1 1 1 1 1 ...
    $ Age         : int  30 30 30 30 30 30 30 30 30 30 ...
    $ Weight      : int  140 140 140 139 138 138 138 138 138 138 ...
    $ Day         : int  1 2 3 4 5 6 7 8 9 10 ...
    
    > summary(andy)
    Patient.Name      Age         Weight     
    Andy:30      Min.   :30   Min.   :135.0  
              1st Qu.:30   1st Qu.:137.0  
              Median :30   Median :137.5  
              Mean   :30   Mean   :137.3  
              3rd Qu.:30   3rd Qu.:138.0  
              Max.   :30   Max.   :140.0  
      Day       
    Min.   : 1.00  
    1st Qu.: 8.25  
    Median :15.50  
    Mean   :15.50  
    3rd Qu.:22.75  
    Max.   :30.00  
    
    > names(andy)
    [1] "Patient.Name" "Age"          "Weight"      
    [4] "Day"   


## Playing with the data

Weight in line 1 and 30 retrieved in different ways:

        andy[1, "Weight"]
        andy[30, "Weight"]

Subset of the 'Weight' column where the data where 'Day' is equal to 30.

        andy[which(andy$Day == 30), "Weight"]
        andy[which(andy[,"Day"] == 30), "Weight"]

Using subset:
        
        subset(andy$Weight, andy$Day==30)
        
### Find out how much weight Andy lost

        andy_start <- andy[1, "Weight"]
        andy_end <- andy[30, "Weight"]
        andy_loss <- andy_start - and_end
        andy_loss

### Load all files

        files <- list.files("diet_data")

Print it:
        
        files
        files[1]
        files[2]
        files[3:5]
        
Try to read John's file:

    head(read.csv(files[3]))
It did not work because JOhn.csv is inside diet_data folder and we are trying to open this file in the upper folder. Let's fix that.

### Load all files with full names

    files_full <- list.files("diet_data", full.names=TRUE)
    files_full

    head(read.csv(files_full[3]))

### To create one big data frame with everybody's data using rbind and a loop

First, creating a data.frame only with Andy and David's data

    andy_david <- rbind(andy, read.csv(files_full[2]))
Checking
    head(andy_david)
    tail(andy_david)

Subset of the data frame that shows us just the 25th day for Andy and David:

    day_25 <- andy_david[which(andy_david$Day == 25), ]
    day_25    
    
Now, everybody:

    dat <- data.frame()
    for (i in 1:5) {
        dat <- rbind(dat, read.csv(files_full[i]))
    }
    str(dat)
    
### Get rid of NA data to calculate Median

We couls use complete.cases() or is.na()

Retrieving with complete.cases
    
    compl <- dat[complete.cases(dat),]
    median(compl$Weight)

Using na.rm parameter in median:

    median(dat$Weight, na.rm=TRUE)
    
The median weight of day 30

    dat_30 <- dat[which(dat[, "Day"] == 30),]
    dat_30
    median(dat_30$Weight)

### Function that will return the median weight of a given day

    weightmedian <- function(directory, day)  {
        files_list <- list.files(directory, full.names=TRUE)   #creates a list of files
        dat <- data.frame()                             #creates an empty data frame
        for (i in 1:5) {                                
                #loops through the files, rbinding them together 
                dat <- rbind(dat, read.csv(files_list[i]))
        }
        dat_subset <- dat[which(dat[, "Day"] == day),]  #subsets the rows that match the 'day' argument
        median(dat_subset[, "Weight"], na.rm=TRUE)      #identifies the median weight 
                                                        #while stripping out the NAs
    }
    
Testing....

    weightmedian(directory = "diet_data", day = 20)
    weightmedian("diet_data", 4)
    weightmedian("diet_data", 17)


TODO: get better functional end optimal solution with: http://adv-r.had.co.nz/Functionals.html
    
    files_full <- list.files("diet_data", full.names=TRUE)
    summary(files_full)
    tmp <- vector(mode = "list", length = length(files_full))
    summary(tmp)
    for (i in seq_along(files_full)) {
        tmp[[i]] <- read.csv(files_full[[i]])
    }
    str(tmp)
    str(lapply(files_full, read.csv))

    output <- do.call(rbind, tmp)
    str(output)
    output
