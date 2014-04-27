# This Code Book describes the variables, dataset and process followed to create the dataset HAR_tidy.data.txt from the raw UCA HAS Dataset.zip

# Variables and dataset

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
(Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The average of the mean (-mean()) and standard deviation (-std()) for each of these variables were then calculated per original dataset, activity and per subject and saved in the HCA_tidy_data.txt file.

The variables contained in the dataset are as follows:

dataset_id				: (factor) indicating whether the data came from the original test or train(ing) dataset
activity_code			: (factor) the activity performed which produced the result
subject					: (factor) the subject on which the measurements were performed
(The rest of the variables are of type numeric and describe the average of the measurements per dataset, activity and subject)
tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyAccMag-mean()
tGravityAccMag-mean()
tBodyAccJerkMag-mean()
tBodyGyroMag-mean()
tBodyGyroJerkMag-mean()
fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyAccMag-mean()
fBodyBodyAccJerkMag-mean()
fBodyBodyGyroMag-mean()
fBodyBodyGyroJerkMag-mean()
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
tBodyAccMag-std()
tGravityAccMag-std()
tBodyAccJerkMag-std()
tBodyGyroMag-std()
tBodyGyroJerkMag-std()
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z
fBodyAccMag-std()
fBodyBodyAccJerkMag-std()
fBodyBodyGyroMag-std()
fBodyBodyGyroJerkMag-std()


# Process followed to produce the tidy dataset

summary of the Human Activity Recognition Using Smartphones Data Set by dataset (test data/train data),
by activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) and 
by subject (1:30)

This script uses the Human Activity Recognition Using Smartphones Data Set 
downloaded from : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
the script assumes the data zip file has been downloaded and unzipped and the folder 
and file names have not been changed

the script assumes the working directory has been set to: ~/UCI HAR Dataset and is provided in the README.md and run_analysis.R files in this repository 

1.  import test dataset
2.  add the activity codes and subjects to the test dataset
3.  import training dataset
4.  add the activity codes and subjects to the training data
5.  import features dataset and include columns for activity codes and subjects
6.  import activities dataset
7.  assign column headers to test and training data tables
8.  add a new column to test and train data identifying the dataset
9.  merge the test and training datasets
10. identify column names for mean() and std() and create a vector of column names to select from the original data, including dataset_id, activity_codes and subjects columns
11. create a subset of the mean and std data from the merged dataset
12. name activity codes and convert them to a factor
13. convert subjects to a factor
14. calculate the average of each variable for each activity and each subject
15. create a file called HAR_tidy_data.txt containing the tidy dataset in the UCI HAR Dataset folder


