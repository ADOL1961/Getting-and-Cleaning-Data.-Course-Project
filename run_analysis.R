# Reading test_data 
subject_test <- read.table("./test/subject_test.txt")
y_test <- read.table("./test/y_test.txt")
X_test <- read.table("./test/X_test.txt")

#Calling dplyr library
library(dplyr)

# Renaming test identifying variables
subject_test <- rename(subject_test, subject=V1)
activity_test <- rename(y_test, activity=V1)
# Merging identifiers and features
Test <- cbind(subject_test,activity_test,X_test)

# Same for training data: 

# Reading train_data 
subject_train <- read.table("./train/subject_train.txt")
y_train <- read.table("./train/y_train.txt")
X_train <- read.table("./train/X_train.txt")
# Renaming train identifying variables
subject_train <- rename(subject_train, subject=V1)
activity_train <- rename(y_train, activity=V1)
# Merging identifiers and features
Train <- cbind(subject_train,activity_train,X_train)


#Q1 Merges the training and the test sets to create one data set.
OneDataSet <- rbind(Train, Test)
rm(Train, Test)

#Q2 Extracts only the measurements on the mean and standard deviation for each measurement.

# Reading Features labels
features<-read.table("features.txt")

#Identify which variables (V1 to v561) correspond to mean or std
                #Escape "\\" must be used to identify "()" in "mean()" and "std()".
                # Variables like MeanFreq() and other posible means are not considered.
relevantVars <- c(grep("mean\\()", features$V2), grep("std\\()", features$V2))
relevantVars <- sort(relevantVars) #this is not strictly necessary, but looks tidier
relevantVars <- relevantVars+2
RelevantDataSet <- OneDataSet[,c(1,2,relevantVars)]
rm(OneDataSet)

#  Q3: Uses descriptive activity names to name the activities in the data set

# Reading activity labels
activity_names <- read.table("activity_labels.txt")

# Assigning activity labels to the variable "activity" of the RelevanDataSet
for (i in 1:6){
        RelevantDataSet$activity[RelevantDataSet$activity==i] <- as.character(activity_names[i,2])
}
                # as.character is used so as not getting the factor level, but its value.

# Q4: Appropriately labels the data set with descriptive variable names

# genererating a vector with the names of the relevant features (those containing "mean()" or "std()")
relevantVars<-relevantVars-2
feature_names <- as.character(features[relevantVars,2])

# changing names with descriptive labels
feature_names <- gsub("^f", "Frequency domain.", feature_names)
feature_names <- gsub("^t", "Time domain.", feature_names)
feature_names <- gsub("BodyBody", "Body", feature_names)
feature_names <- gsub("Body", "Body acceleration.", feature_names)
feature_names <- gsub("Acc", "Accelerometer.", feature_names)
feature_names <- gsub("Gyro", "Gyroscope.", feature_names)
feature_names <- gsub("Jerk", "Jerk signal.", feature_names)
feature_names <- gsub("Mag", "Fourier Transformation.", feature_names)
feature_names <- gsub("Gravity", "Gravity acceleration.", feature_names)
feature_names <- gsub("mean\\()", "Average.", feature_names)
feature_names <- gsub("std\\()", "Standard deviation.", feature_names)

# Assigning descriptive labels to variables in the main DataSet
for(i in 1:66){
        names(RelevantDataSet)[i+2] <- feature_names[i]
}

# Q5    From the data set in step 4, creates a second, independent tidy data set with the average 
#       of each variable for each activity and each subject.

Tidydata <- RelevantDataSet %>% group_by(subject, activity) %>% summarize_all(mean, na.rm= TRUE)
write.table(Tidydata, "Tidydata.txt", row.names = FALSE)

#End of Scrip.
