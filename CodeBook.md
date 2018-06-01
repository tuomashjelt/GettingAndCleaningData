# CodeBook

## Input data
The initial data is downloaded as a zip that contains the following files (that were used):
* `X_train.txt` variable features intended for training
* `y_train.txt` activities related to X_train.txt
* `subject_train.txt` information on the subjects
* `X_test.txt` variable features intended for testing
* `y_test.txt` activities related to X_test.txt
* `subject_test.txt` information on the subjects 
* `activity_labels.txt` metadata on the activities
* `features.txt` names of the features in the data sets

## Data flow
1. *Part 1*
* Feature names and activity labels are read into `featureNames` and `activityLabels`
* Train and test files are read into own variables
* Corresponding test and train variables of subject, activities and features are merged with `rbind`
* Proper column names are assigned for `features`, `subject` and `activity`
* Columnbind `features`, `subject` and `activity` to form the `completeData` data set
2. *Part 2*
* Find the mean and std column numbers, plus Activity and Subject
* Make a data set with the selected columns `extractedData <- completeData[, reqColumns]`
3. *Part 3*
* Unlist the activityLabels variable `activityLabels.2 <- apply(activityLabels, 1, function(x) unlist(strsplit(x, split=" ")))`
* Assign the activity names corresponding the right number `extractedData$Activity <- factor(as.factor(extractedData$Activity), labels=activityLabels.2[2,])`
4. *Part 4*
* Use gsub to manipulate the column names to more readable format
5. *Part 5*
* Convert Subject column to factor
* Calculate the mean for distinct subject and activity pairs `aggregate(. ~Subject + Activity, extractedData, mean)`
* Create the tidy data set file `write.table(tidyData, file = "Tidy.txt", row.names = FALSE)`

## Subject and Activity
These variables identify the unique subject and activity pairs
* Subject: Surrogate ID for subject
* Activity: Name of the activity

Activities are described as strings:
* Walking
* Walking Upstairs
* Walking Downstairs
* Sitting
* Standing
* Laying

## Measured variables
Measured variables can be found after the subject/activity pairs (time and frequency domains for different targets):
* TimeBodyAccelerometerMean()-X
* TimeBodyAccelerometerMean()-Y
* TimeBodyAccelerometerMean()-Z
* TimeBodyAccelerometerSTD()-X
* TimeBodyAccelerometerSTD()-Y
* TimeBodyAccelerometerSTD()-Z
* TimeGravityAccelerometerMean()-X
* TimeGravityAccelerometerMean()-Y
* TimeGravityAccelerometerMean()-Z
* TimeGravityAccelerometerSTD()-X
* TimeGravityAccelerometerSTD()-Y
* TimeGravityAccelerometerSTD()-Z
* TimeBodyAccelerometerJerkMean()-X
* TimeBodyAccelerometerJerkMean()-Y
* TimeBodyAccelerometerJerkMean()-Z
* TimeBodyAccelerometerJerkSTD()-X
* TimeBodyAccelerometerJerkSTD()-Y
* TimeBodyAccelerometerJerkSTD()-Z
* TimeBodyGyroscopeMean()-X
* TimeBodyGyroscopeMean()-Y
* TimeBodyGyroscopeMean()-Z
* TimeBodyGyroscopeSTD()-X
* TimeBodyGyroscopeSTD()-Y
* TimeBodyGyroscopeSTD()-Z
* TimeBodyGyroscopeJerkMean()-X
* TimeBodyGyroscopeJerkMean()-Y
* TimeBodyGyroscopeJerkMean()-Z
* TimeBodyGyroscopeJerkSTD()-X
* TimeBodyGyroscopeJerkSTD()-Y
* TimeBodyGyroscopeJerkSTD()-Z
* TimeBodyAccelerometerMagnitudeMean()
* TimeBodyAccelerometerMagnitudeSTD()
* TimeGravityAccelerometerMagnitudeMean()
* TimeGravityAccelerometerMagnitudeSTD()
* TimeBodyAccelerometerJerkMagnitudeMean()
* TimeBodyAccelerometerJerkMagnitudeSTD()
* TimeBodyGyroscopeMagnitudeMean()
* TimeBodyGyroscopeMagnitudeSTD()
* TimeBodyGyroscopeJerkMagnitudeMean()
* TimeBodyGyroscopeJerkMagnitudeSTD()
* FrequencyBodyAccelerometerMean()-X
* FrequencyBodyAccelerometerMean()-Y
* FrequencyBodyAccelerometerMean()-Z
* FrequencyBodyAccelerometerSTD()-X
* FrequencyBodyAccelerometerSTD()-Y
* FrequencyBodyAccelerometerSTD()-Z
* FrequencyBodyAccelerometerMeanFreq()-X
* FrequencyBodyAccelerometerMeanFreq()-Y
* FrequencyBodyAccelerometerMeanFreq()-Z
* FrequencyBodyAccelerometerJerkMean()-X
* FrequencyBodyAccelerometerJerkMean()-Y
* FrequencyBodyAccelerometerJerkMean()-Z
* FrequencyBodyAccelerometerJerkSTD()-X
* FrequencyBodyAccelerometerJerkSTD()-Y
* FrequencyBodyAccelerometerJerkSTD()-Z
* FrequencyBodyAccelerometerJerkMeanFreq()-X
* FrequencyBodyAccelerometerJerkMeanFreq()-Y
* FrequencyBodyAccelerometerJerkMeanFreq()-Z
* FrequencyBodyGyroscopeMean()-X
* FrequencyBodyGyroscopeMean()-Y
* FrequencyBodyGyroscopeMean()-Z
* FrequencyBodyGyroscopeSTD()-X
* FrequencyBodyGyroscopeSTD()-Y
* FrequencyBodyGyroscopeSTD()-Z
* FrequencyBodyGyroscopeMeanFreq()-X
* FrequencyBodyGyroscopeMeanFreq()-Y
* FrequencyBodyGyroscopeMeanFreq()-Z
* FrequencyBodyAccelerometerMagnitudeMean()
* FrequencyBodyAccelerometerMagnitudeSTD()
* FrequencyBodyAccelerometerMagnitudeMeanFreq()
* FrequencyBodyAccelerometerJerkMagnitudeMean()
* FrequencyBodyAccelerometerJerkMagnitudeSTD()
* FrequencyBodyAccelerometerJerkMagnitudeMeanFreq()
* FrequencyBodyGyroscopeMagnitudeMean()
* FrequencyBodyGyroscopeMagnitudeSTD()
* FrequencyBodyGyroscopeMagnitudeMeanFreq()
* FrequencyBodyGyroscopeJerkMagnitudeMean()
* FrequencyBodyGyroscopeJerkMagnitudeSTD()
* FrequencyBodyGyroscopeJerkMagnitudeMeanFreq()
* Angle(TimeBodyAccelerometerMean,Gravity)
* Angle(TimeBodyAccelerometerJerkMean),GravityMean)
* Angle(TimeBodyGyroscopeMean,GravityMean)
* Angle(TimeBodyGyroscopeJerkMean,GravityMean)
* Angle(X,GravityMean)
* Angle(Y,GravityMean)
* Angle(Z,GravityMean)
