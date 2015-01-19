README-file
======
 

## Getting and Cleaning Data - Project

## Project Description
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

1. Download run_analysis.R from the Github repository to your R work directory
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
9. Check number of columns 561 + 4
10. Assign subjectID from subject file
11. Assign ActicityID from label y_test.txt file
12. Assign Acticity Name joining ActivityID to the activity file

### Then let's load the Train files
13. Read Train Labels file, check its dimensions and assign column names
14. Read Subject Train file, check its dimensions and assign column names 
15. Read observations in TRain file, check its dimensions 

16. Assing column names as in the features.txt file
17. Add new column to indicate the source of record in this case X_train.txt file"
18. Add new columns to indicate the subjectID and Activity info"
19 Check number of columns 561 + 4 = 545
20. Assign subjectID from subject file
21. Assign ActicityID from label y_train.txt file
22. Assign Acticity Name joining ActivityID to the activity file

### Merge Test and Train data
23. check both table dim the number of columns much match
24. Merge files: X_test and X_train
25. Extracts only the measurements on the mean and standard deviation for each measurement
26. Create tidy data set with the average of each variable for each activity and each subject.

## Tidy File Variables

### Dimensions/Qualitative Variables

* [1] "ActivityName": Name of any of the six activities
    1. WALKING
    2. WALKING_UPSTAIRS
    3. WALKING_DOWNSTAIRS
    4. SITTING
    5. STANDING
    6. LAYING
    
* [2] "subjectID": ID for each one of 30 volunteers. It's number from 1 to 30

### Metrics/Quantitative Variabless
* There is a total of 66 variables with the Mean() or Std() functions

 [3] "tBodyAcc-mean()-X"          
 [4] "tBodyAcc-mean()-Y"           
 [5] "tBodyAcc-mean()-Z"           
 [6] "tGravityAcc-mean()-X"       
 [7] "tGravityAcc-mean()-Y"        
 [8] "tGravityAcc-mean()-Z"        
 [9] "tBodyAccJerk-mean()-X"      
[10] "tBodyAccJerk-mean()-Y"       
[11] "tBodyAccJerk-mean()-Z"       
[12] "tBodyGyro-mean()-X"         
[13] "tBodyGyro-mean()-Y"          
[14] "tBodyGyro-mean()-Z"          
[15] "tBodyGyroJerk-mean()-X"     
[16] "tBodyGyroJerk-mean()-Y"      
[17] "tBodyGyroJerk-mean()-Z"      
[18] "tBodyAccMag-mean()"         
[19] "tGravityAccMag-mean()"       
[20] "tBodyAccJerkMag-mean()"      
[21] "tBodyGyroMag-mean()"        
[22] "tBodyGyroJerkMag-mean()"     
[23] "fBodyAcc-mean()-X"           
[24] "fBodyAcc-mean()-Y"          
[25] "fBodyAcc-mean()-Z"           
[26] "fBodyAccJerk-mean()-X"       
[27] "fBodyAccJerk-mean()-Y"      
[28] "fBodyAccJerk-mean()-Z"       
[29] "fBodyGyro-mean()-X"          
[30] "fBodyGyro-mean()-Y"         
[31] "fBodyGyro-mean()-Z"          
[32] "fBodyAccMag-mean()"         
[33] "fBodyBodyAccJerkMag-mean()" 
[34] "fBodyBodyGyroMag-mean()"     
[35] "fBodyBodyGyroJerkMag-mean()" 
[36] "tBodyAcc-std()-X"           
[37] "tBodyAcc-std()-Y"           
[38] "tBodyAcc-std()-Z"            
[39] "tGravityAcc-std()-X"        
[40] "tGravityAcc-std()-Y"         
[41] "tGravityAcc-std()-Z"         
[42] "tBodyAccJerk-std()-X"       
[43] "tBodyAccJerk-std()-Y"        
[44] "tBodyAccJerk-std()-Z"        
[45] "tBodyGyro-std()-X"          
[46] "tBodyGyro-std()-Y"           
[46] "tBodyGyro-std()-Z"           
[47] "tBodyGyroJerk-std()-X"      
[49] "tBodyGyroJerk-std()-Y"       
[50] "tBodyGyroJerk-std()-Z"       
[51] "tBodyAccMag-std()"          
[52] "tGravityAccMag-std()"        
[53] "tBodyAccJerkMag-std()"       
[54] "tBodyGyroMag-std()"         
[55] "tBodyGyroJerkMag-std()"      
[56] "fBodyAcc-std()-X"            
[57] "fBodyAcc-std()-Y"           
[58] "fBodyAcc-std()-Z"            
[59] "fBodyAccJerk-std()-X"        
[60] "fBodyAccJerk-std()-Y"       
[61] "fBodyAccJerk-std()-Z"        
[62] "fBodyGyro-std()-X"           
[63] "fBodyGyro-std()-Y"          
[64] "fBodyGyro-std()-Z"           
[65] "fBodyAccMag-std()"           
[66] "fBodyBodyAccJerkMag-std()"  
[67] "fBodyBodyGyroMag-std()"      
[68] "fBodyBodyGyroJerkMag-std()" 

