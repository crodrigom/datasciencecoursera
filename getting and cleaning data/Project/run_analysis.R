
install.packages("data.table")
install.packages("reshape2")
library(data.table)
library(reshape2)

# 1. download and unzip data
if(!file.exists("./data/UCI HAR Dataset/train/X_train.txt")){
        temp = tempfile()
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, temp) #, method = "curl") # use method curl when I am using the MAC at home
        if(!file.exists("data")){ dir.create("./data") }
        unzip(temp, exdir = "./data")
}

#1.Merges the training and the test sets to create one data set.

train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
X_all = rbind(train, test)

train <- read.table("./data/UCI HAR Dataset/train/Y_train.txt")
test <- read.table("./data/UCI HAR Dataset/test/Y_test.txt")
Y_all = rbind(train, test)

train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
subject_all <- rbind(train, test)

#2.Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("./data/UCI HAR Dataset/features.txt")
mean_std_features = grepl("mean|std", features[,2])
X_all = X_all[, mean_std_features]
names(X_all) = features[mean_std_features, 2]

#3.Uses descriptive activity names to name the activities in the data set

activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
activities = activities[,2]
Y_all = activities[Y_all[,1]]

#4.Appropriately labels the data set with descriptive variable names. 

names(subject_all) = "subject"
cleaned_data = cbind(subject_all, Y_all, X_all);
names(cleaned_data)[2] = "activity"

write.table(cleaned_data, "./data/cleaned_data.txt")


#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

melt = melt(cleaned_data, id=1:2, measure.vars = 3:length(cleaned_data))

cleaned_and_tidy = dcast(data = melt, formula = subject + activity ~ variable, mean)

write.table(cleaned_and_tidy, "./data/cleaned_and_tidy_data.txt", row.name=FALSE)

