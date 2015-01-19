#
# Getting and Cleaning Data - Project
#

GetCleanProject <- function () { 

# 1. Read features file, check its dimensions and assign column names
features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)
dim(features)  #  561   2
colnames(features) <- c("featuresID","featuresName")

# 2. Read Activity Labels file, check its dimensions and assign column names
Activity <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE)
dim(Activity)  #  6   2
colnames(Activity) <- c("activityID","ActivityName")

# 3. Read Test Labels file, check its dimensions and assign column names
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
dim(y_test)  #  2947    1
colnames(y_test) <- c("activityID")

# 4. Read Subject Test file, check its dimensions and assign column names 
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
dim(subject_test)  #  2947    1
colnames(subject_test) <- c("subjectID")

# 5. Read observations in Test file, check its dimensions 
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
dim(X_test)  #  2947  561

# 6. Assing column names as in the features.txt file
colnames(X_test) <- as.character(features$featuresName) 

# 7. Add new column to indicate the source of record in this case X_test.txt file"
X_test$RecordType <- "X_test"

# 8. Add new columns to indicate the subjectID and Activity info"
X_test$subjectID <- 0
X_test$ActivityID <- 0
X_test$ActivityName <- "None"

# 9 Check number of columns 561 + 4
dim(X_test) # 2947  565

# 10 Assign subjectID from subject file
for(i in 1:2947) {X_test$subjectID[i] <-subject_test$subjectID[i]}

# 11 Assign ActicityID from label y_test.txt file
for(i in 1:2947) {X_test$ActivityID[i] <-y_test$activityID[i]}

# 12 Assign Acticity Name joining ActivityID to the activity file
for(i in 1:2947) {X_test$ActivityName[i] <-as.character(Activity[as.numeric(X_test$ActivityID[i]),2])}



# Now lets do the same with the train file

# 13. Read Train Labels file, check its dimensions and assign column names
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
colnames(y_test) <- c("activityID")
dim(y_train)  #   7352    1
colnames(y_train) <- c("activityID")

# 14. Read Subject Train file, check its dimensions and assign column names 
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
dim(subject_train)  #  7352    1
colnames(subject_train) <- c("subjectID")

# 15. Read observations in TRain file, check its dimensions 
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
dim(X_train)  #  7352  561

# 16. Assing column names as in the features.txt file
colnames(X_train) <- as.character(features$featuresName) 

# 17. Add new column to indicate the source of record in this case X_train.txt file"
X_train$RecordType <- "X_train"

# 18. Add new columns to indicate the subjectID and Activity info"
X_train$subjectID <- 0
X_train$ActivityID <- 0
X_train$ActivityName <- "None"

# 19 Check number of columns 561 + 4 = 545
dim(X_train) # 7352  565

# 20 Assign subjectID from subject file
for(i in 1:7352) {X_train$subjectID[i] <-subject_train$subjectID[i]}

# 21 Assign ActicityID from label y_train.txt file
for(i in 1:7352) {X_train$ActivityID[i] <-y_train$activityID[i]}

# 22 Assign Acticity Name joining ActivityID to the activity file
for(i in 1:7352) {X_train$ActivityName[i] <-as.character(Activity[as.numeric(X_train$ActivityID[i]),2])}

# 23 check both table dim the number of columns much match
dim(X_test) # 2947  565
dim(X_train) # 7352  565

library(dplyr)

# 24 Merge files, columns = 564 and rows = 7352 + 2947
merged_observations <-  rbind_list(X_test, X_train)

dim(merged_observations) # 10299   565

# 25 Extracts only the measurements on the mean and standard deviation for each measurement
MeanStd_observations <- select(merged_observations, subjectID, ActivityName, contains("mean()"), contains("std()")) 

dim(MeanStd_observations) # 10299    68


# 26 Create tidy data set with the average of each variable for each activity and each subject.


by_ActivitySubject <- group_by(MeanStd_observations, ActivityName, subjectID) 

dim(by_ActivitySubject)

tinydb <- summarise_each(by_ActivitySubject, funs(mean))

#dim(tinydb) # [1] 180  68
#colnames(tinydb)
#unique(tinydb$ActivityName)
#unique(tinydb$subjectID)

fn <- "./TrainAndTest_Tiny.txt"
if (file.exists(fn)) file.remove(fn)

write.table(tinydb, file = "./TrainAndTest_Tiny.txt", row.name=FALSE)

tinydb

}