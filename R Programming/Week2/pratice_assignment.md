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


### Playing with the data

Weight in line 1 and 30 retrieved in different ways:

        andy[1, "Weight"]
        andy[30, "Weight"]

Subset of the 'Weight' column where the data where 'Day' is equal to 30.

        andy[which(andy$Day == 30), "Weight"]
        andy[which(andy[,"Day"] == 30), "Weight"]

Using subset:
        
        subset(andy$Weight, andy$Day==30)
        
        
