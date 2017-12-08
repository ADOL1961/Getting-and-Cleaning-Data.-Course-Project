# Getting-and-Cleaning-Data.-Course-Project
## Purpose
The main purpose of his ReadMe document is to explain with some detail the steps taken to solve the tasks proposed in the “Getting and Cleaning Data” Course Project.

The goal of the Project is “is to prepare tidy data that can be used for later analysis”. Starting with a full data based, we are required to create a tidy data set with some summary measures, writing the final output in a txt file.

The present document will describe the R script used to perform the required tasks. It will also include a brief description of the experiment that generated the original data set with references to the main explanatory documents.

Apart from the txt file, the R.Script and this Readme, the project will include a CodeBook describing the variables. 

## The Original Data Base
In the course assignment a link to the data is provided: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

When unzipping the file, the following structure appears:

- UCI HAR Dataset:
  - README.txt
  - features_info.txt
  - features.txt
  - activity_labels.txt
  - train(folder)
    - subject_train.txt
    - X_train.txt
    - y_train.txt
    - Inertial Signals (folder)
  - text(folder)
    - subject_text.txt
    - X_test.txt
    - y_test.txt
    - Inertial Signals (folder)

Two parallel data folders arise: “train” and “test”. The reason for that is explained in the following link (also provided in the course assignment) which describes the experiment:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

As stated in the document:
> "The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data."

So, the two folders, “train” and “test” contain basically the same information, one for the training sample (70% of the date), the other for the test sample (30%). But what is all this information about?

As described in the link above, the experiment is about
> “Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while 
> carrying a waist-mounted smartphone with embedded inertial sensors”. 
For each of the 30 subjects, 6 main activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)  are recorded using Samsung Smartphone embedded accelerometer and gyroscope. The total data set has 10,299 records (let’s say rows). For each record, a total of 561 features is provided, with time and frequency domain features."

Our main task is to try to put together all the information and summarize some of the features in a Tidy dataset.

The rest of this ReadMe document will explain the associated R. Script in which the 5 steps required in the assignment have been performed.

## Step1. Merges the training and the test sets to create one data set

Previous work to understand the database is required. With the help of the “README.txt” provided in the data base, we discovered that:

1. The “subject_train/test.txt” files contain the identification code (a correlative number) of the subject of each record. There are 21 different id codes for the train set and 9 for the test, corresponding to 70% and 30% of the 30 subjects.

2. The “y_train/test.txt” record the activities associated to each observation. Both files have just one column with 6 different values, one per activity. The “activity_label.txt” file contains the labels for the activities.

3. The bulk of the information, i.e. the 561 features for each record are contained respectively in the “X_train/test.txt” files.

So, after setting the working directory. The first task is to read the files described above, and put together the subject, activity and features columns, in two databases: one for the test sample and the other for the training one. We called Train and Test the respective data.frames. 

The txt files come with no heading and the same “V1” column name is applied while reading into R. We renamed this V1 column before joining the columns with a cbind() function. Here is the code for the Train sample:

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


The same is done for the Train data set. After that a single data set merging Test and Train is created:

	#Q1 Merges the training and the test sets to create one data set.
	OneDataSet <- rbind(Train, Test)

Test and Train datasets are then removed from the Workspace:
	
	rm(Train, Test)
	
## Step2. Extracts only the measurements on the mean and standard deviation for each measurement.

The file “features.txt” contains the name of the features, i.e. of the columns of the “X_train/test.txt” files. After reading the “features_info.txt” file, we decided that the variables we are focusing on are those which names ending in “mean()” or “std()”.

There are other variables names including “Mean” in their names, such as 

- 294 fBodyAcc-meanFreq()-X
- 295 fBodyAcc-meanFreq()-Y
- 296 fBodyAcc-meanFreq()-Z

 or
 
- 555 angle(tBodyAccMean,gravity)
- 556 angle(tBodyAccJerkMean),gravityMean)

Nevertheless we have decided to focus only on those ending in “mean()” 

For this Step2, the instructions in the R.Script do the following:

1. Read “features.txt”, a 561 row file
2. Using grep() function we looked for those variables ending in “mean()” and with another grep(), those ending in “std()”. 


What we get is a set of numbers indicating the columns that we have to select from the “OneDataSet” table. A new data.frame, called “RelevantDataSet” is set to store only those relevant features. The “OneDataSet” is then removed from the Workspace.

## Step3. Uses descriptive activity names to name the activities in the data set

The second column of the “RelevantDataSet” is named “activity” and contains numbers (from 1 to 6) representing the 6 activities mentioned before (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).


In the Scrip, we first read the file “activity_labels.txt” into a table called “activity_names” with only 6 rows and two columns, one with the code (1 to 6), the other with the name of the activity. 

 1.  | WALKING
 2.  | WALKING_UPSTAIRS
 3.  | WALKING_DOWNSTAIRS
 4.  | SITTING
 5.  | STANDING
 6.  | LAYING
 
 
 We the use a for() structure to change each number in the “activity” column of “RelevantDataSet” by their descriptive label.

	for (i in 1:6){
        	RelevantDataSet$activity[RelevantDataSet$activity==i] <- as.character(activity_names[i,2])
	}

## Step4. Appropriately labels the data set with descriptive variable names.

The features contained in our “RelevantDataSet” are identified by variable names such as “V1”, “V2” and so forth up to a total of 66, non-correlative labels. We could rename theses variables using their corresponding labels from the “features.txt” file. The meaning of each of the labels can be derived from the explanations given in “features_info.txt”. 

However, a more descriptive name would be appropriate to use, instead of directly using the names of the “features.txt” file. We will, nevertheless, use this file first to select the names of what we called “relevant variables”, i.e. those ending with “mean()” or “std()”. On a second step we will change the names with more descriptive labels.


For the first step (select the names of the relevant variables) we used the following chunk of code:

	relevantVars <- relevantVars-2
	feature_names <- as.character(features[relevantVars,2]) 

The second step is a little trickier. Considering the explanations given in “features_info.txt” and trying to do thing in an automated way, we decided to apply the following pattern:

	for(i in 1:66){
        	names(RelevantDataSet)[i+2] <- feature_names[i]
	}

- An “f” at the begging of the variable name means a “Frequency domain” measure. We changed “f” by its meaning.
- A “t” stands for “Time domain” measure. We changed the label
- Instead of “Body”, we proposed a more descriptive text: “Body acceleration”. (Note: Some variables were named with two “Bodys”, as in “516 fBodyBodyAccJerkMag-mean()”. “BodyBody” was changed to a single “Body”)
- “Gravity” stands for “Gravity acceleration”. Texts have been changed accordingly
- “Jerk” has been changed by something more descriptive: “Jerk signal”
- “Acc” refers to “Accelerometer” and so it was changed
- “Gyro” has been renamed into “Gyroscope”
- “Mag” is used when a “Fourier transformation” was applied 
- “mean()” has been changed by “Average”
- “std()” was substituted with a more descriptive “Standard deviation”


The above rules were applied to the “features_names” vector, using the gsub() function to change the 66 names accordingly. As in step3, we apply a for() structure to rename the features in the “RelevantDataset” table.

## Step5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The “RelevantDataSet” data.frame is grouped using “group_by()” function, by the two first rows, i.e. by “subject” and “activity”. There are 30 subjects and 6 different activities, so a total of 180 groups are defined.

For each group the average of the observations is calculated and saved in a new data set called” Tidydata”. This data set can be considered a “tidy” data set because as stated in the 3rd video of week1: 1) each row contains a single variable; 2) each observation (a mean in this case) is in a different row; 3) There is a header row with variable names and 4) names are human readable.

The final instruction of the R.script is to write the “Tidydata” data.frame into a “Tidydata .txt” file.


 



