# Tidy data from the Human Activity Recognition Using Smartphones Data set

Transforming the data into a tidy format from the initial data files requires steps that have been divided into five sections. The steps performed by the run_analysis.R file are following:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set.
4. Appropriately label the data set with descriptive variable names.
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

In this repository can be found the following files:
* `run_analysis.R` : R-code run on the data set
* `Tidy.txt` : tidy data extracted from the original data using run_analysis.R
* `CodeBook.md` : CodeBook that explains the variables in Tidy.txt
* `README.md` : summary of the code in run_analysis.R
