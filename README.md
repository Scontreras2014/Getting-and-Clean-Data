README-file
======
**README.md** 

## Getting and Cleaning Data - Project
Here is the description of the project

This linl provide the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Steps to run the script
Please follow the following steps to run the script

1. download run_analysis.R from the Github repository to your R work directory
2. Make sure you have the data require for this project unzipped in your work directory under the folder "UCI HAR Dataset"
3. Load/source the script run_analysis.R into R
4. execute the function GetCleanProject() in R console to generate the tidy datasource

## How the script works 

The script follow these steps:

### Read the data in the "UCI HAR Dataset" folder

### First let's load the Test files
1. Read features file, check its dimensions and assign column names
2. Read Activity Labels file, check its dimensions and assign column names
3. Read Test Labels file, check its dimensions and assign column names
4. Read Subject Test file, check its dimensions and assign column names 
5. Read observations in Test file, check its dimensions 

6. Assing column names as in the features.txt file
7. Add new column to indicate the source of record in this case X_test.txt file"
8. Add new columns to indicate the subjectID and Activity info"
9 Check number of columns 561 + 4
10 Assign subjectID from subject file
11 Assign ActicityID from label y_test.txt file
12 Assign Acticity Name joining ActivityID to the activity file

### Then let's load the Train files
13. Read Train Labels file, check its dimensions and assign column names
14. Read Subject Train file, check its dimensions and assign column names 
15. Read observations in TRain file, check its dimensions 

16. Assing column names as in the features.txt file
17. Add new column to indicate the source of record in this case X_train.txt file"
18. Add new columns to indicate the subjectID and Activity info"
19 Check number of columns 561 + 4 = 545
20 Assign subjectID from subject file
21 Assign ActicityID from label y_train.txt file
22 Assign Acticity Name joining ActivityID to the activity file

### Merge Test and Train data
23 check both table dim the number of columns much match
24 Merge files: X_test and X_train
25 Extracts only the measurements on the mean and standard deviation for each measurement
26 Create tidy data set with the average of each variable for each activity and each subject.