#setwd("~/Coursera/datasciencecoursera/ProgrammingAssignment4")

#load the needed libraries
library(data.table)
library(dplyr)

## PART 1
#get metadata
featureNames <- read.table("UCI HAR Dataset/features.txt", header = FALSE) %>% tbl_df
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE) %>% tbl_df
head(featureNames)
head(activityLabels)

#read training data
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE) %>% tbl_df
activityTrain <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE) %>% tbl_df
featuresTrain <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE) %>% tbl_df

#read test data
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE) %>% tbl_df
activityTest <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE) %>% tbl_df
featuresTest <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE) %>% tbl_df

#merge training and test data
subject <- rbind(subjectTrain, subjectTest)
activity <- rbind(activityTrain, activityTest)
features <- rbind(featuresTrain, featuresTest)

#assign proper column names
colnames(features) <- t(featureNames[2])
colnames(subject) <- "Subject"
colnames(activity) <- "Activity"

completeData <- cbind(features, subject, activity)
View(head(completeData))

## PART 2
#find column numbers for mean and std, adding also activity and subject
reqColumns <- grep(".*Mean.*|.*Std.*|Activity|Subject", names(completeData), ignore.case = TRUE)
extractedData <- completeData[, reqColumns]

## PART 3
activityLabels.2 <- apply(activityLabels, 1, function(x) unlist(strsplit(x, split=" ")))
extractedData$Activity <- factor(as.factor(extractedData$Activity), labels=activityLabels.2[2,])

View(extractedData)

## PART 4
#appropriate labels
names(extractedData)<-gsub("Acc", "Accelerometer", names(extractedData))
names(extractedData)<-gsub("Gyro", "Gyroscope", names(extractedData))
names(extractedData)<-gsub("BodyBody", "Body", names(extractedData))
names(extractedData)<-gsub("Mag", "Magnitude", names(extractedData))
names(extractedData)<-gsub("^t", "Time", names(extractedData))
names(extractedData)<-gsub("^f", "Frequency", names(extractedData))
names(extractedData)<-gsub("tBody", "TimeBody", names(extractedData))
names(extractedData)<-gsub("-mean()", "Mean", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("-std()", "STD", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("-freq()", "Frequency", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("angle", "Angle", names(extractedData))
names(extractedData)<-gsub("gravity", "Gravity", names(extractedData))

names(extractedData)

## PART 5
#convert subject to factor
extractedData$Subject <- as.factor(extractedData$Subject)

#..and dataset to data.table
extractedData <- data.table(extractedData)
head(extractedData)

#average for each subject and activity, then order the datatables columns
tidyData <- aggregate(. ~Subject + Activity, extractedData, mean)
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]
View(tidyData)

#create file
write.table(tidyData, file = "Tidy.txt", row.names = FALSE)