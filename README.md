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

	`# Reading test_data`
	`subject_test <- read.table("./test/subject_test.txt")`
	`y_test <- read.table("./test/y_test.txt")`
	`X_test <- read.table("./test/X_test.txt")`

The txt files come with no heading and the same “V1” column name is applied while reading into R. We renamed this V1 column before joining the columns with a cbind() function. Here is the code for the Train sample:
  
 



