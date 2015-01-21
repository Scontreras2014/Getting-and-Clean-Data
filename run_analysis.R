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
unique(Activity$ActivityName)

# 3. Read Test Labels file, check its dimensions and assign column names
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
dim(y_test)  #  2947    1
colnames(y_test) <- c("activityID")
unique(y_test$activityID)

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

dim(MeanStd_observations) # 10,299    68
colnames(MeanStd_observations)

# 26 Create tidy data set with the average of each variable for each activity and each subject.
library("tidyr")

# 26.1 Gather all 65 mean() and std() features into a single column called feature 
# 26.2 Parse the feature column into "Feature","Funtion" (Mean, Std) ,"axial" (X,Y,Z)

tinydb <- MeanStd_observations %>%
    gather(feature,Value,3:68,na.rm= TRUE) %>%
    separate(feature, c("Feature","Funtion","axial")) 

dim(tinydb) # 679,734      6
colnames(tinydb)

# 26.3 Parse the rest of the feature column to identify the "Domain", "Motion", "signals", "Other" for the rest of the string

tinydb$Feature <- gsub("Gravity", "Gravity-", tinydb$Feature)
tinydb$Feature <- gsub("Body", "Body-", tinydb$Feature)
tinydb$Feature <- gsub("Acc", "Acc-", tinydb$Feature)
tinydb$Feature <- gsub("Gyro", "Gyro-", tinydb$Feature)
tinydb$Feature <- gsub("Body-Body-", "Body-", tinydb$Feature)
tinydb$Feature <- gsub("f", "f-", tinydb$Feature)
tinydb$Feature <- gsub("t", "t-", tinydb$Feature)
tinydb$Feature <- gsub("Gravit-y", "Gravity", tinydb$Feature)


dim(tinydb) #  679,734      9

# 26.4 Create new columnms found on step 29 and calculate the average of the values

tinyds <- tinydb %>% 
    separate(Feature, c("Domain","Motion","signals","Other")) %>% 
    group_by(ActivityName, subjectID, Domain, Motion, signals, Other, Funtion, axial) %>%
    summarise(mean(Value))


# 26.5 Check dimensions and uniqur values for each column

dim(tinyds) #11,880   9  
colnames(tinyds)

unique(tinyds$ActivityName)
unique(tinyds$subjectID)
unique(tinyds$Domain) # "f" "t"
tinyds$Domain <- gsub("t", "time", tinyds$Domain)
tinyds$Domain <- gsub("f", "frequency", tinyds$Domain)

unique(tinyds$Motion)
unique(tinyds$signals) # "Acc"  "Gyro"
tinyds$signals <- gsub("Acc", "Acceleration", tinyds$signals)
tinyds$signals <- gsub("Gyro", "Gravitational", tinyds$signals)

unique(tinyds$Other)
unique(tinyds$Funtion)
unique(tinyds$axial)

# 26.6 Create tiny text file with final data source.

fn <- "./TrainAndTest_Tiny.txt"
if (file.exists(fn)) file.remove(fn)

write.table(tinyds, file = "./TrainAndTest_Tiny.txt", row.name=FALSE)

tinyds

}