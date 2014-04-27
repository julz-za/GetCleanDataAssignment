## summary of the Human Activity Recognition Using Smartphones Data Set by dataset (test data/train data),
## by activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) and 
## by subject (1:30)

## This script uses the Human Activity Recognition Using Smartphones Data Set 
## downloaded from : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## the script assumes the data zip file has been downloaded and unzipped and the folder 
## and file names have not been changed

## the script assumes the working directory has been set to: ~/UCI HAR Dataset

## import test data
x_test<-read.table("./test/X_test.txt") ## test set  ##head(x_test)
y_test<-read.table("./test/Y_test.txt") ## test labels  ##head(y_test)
subject_test<-read.table("./test/subject_test.txt") ## test subjects  ##head(subject_test)
# add the activity codes and subjects to the test dataframe
x_test<-cbind(y_test, subject_test, x_test)

## import training data
x_train<-read.table("./train/X_train.txt") ## train set  ## head(x_train)
y_train<-read.table("./train/Y_train.txt") ## train labels  ## head(y_train)
subject_train<-read.table("./train/subject_train.txt") ## train subjects  ## head(subject_train)
# add the activity codes and subjects to the train data
x_train<-cbind(y_train, subject_train, x_train)

## import features and include columns for activity codes and subjects
features<-read.table("./features.txt") ## features  ## head(features)
L3<-c("activity_code", "subject")
activity_features<-data.frame(x = 0, y=L3)
colnames(activity_features)<-colnames(features)
features<-rbind(activity_features, features)

## import activities
activity_labels<-read.table("./activity_labels.txt") ## activity labels  ## head(activity_labels)

## assign column headers to test and train data tables
colnames(x_test)<-features[,2]
colnames(x_train)<-features[,2]

##str(x_test)
##str(x_train)

## add a new column to test and train data identifying the dataset
## add the new identifying columns to the test and train datasets
x_test<-cbind(dataset_id="test data", x_test)
x_train<-cbind(dataset_id="train data", x_train)

## merge the test and train data
merged<-rbind(x_test, x_train)  ## head(merged)  ##str(merged)

## identify column names for mean() and std() and create a vector of column names to select 
## including dataset_id, activity_codes and subjects columns
meanColNames<-colnames(x_test[, grep("-mean()", fixed=TRUE, names(x_test))])
stdColNames<-colnames(x_test[, grep("-std()", fixed=TRUE, names(x_test))])
useColNames<-c("dataset_id", "activity_code", "subject", meanColNames, stdColNames)

## create a subset of the mean and std data from the merged dataset
merged_ss<-merged[,useColNames]  ##  head(merged_ss) ## tail(merged_ss) ## str(merged_ss)

## naming activity codes and converting them to a factor
merged_ss$activity_code<-factor(merged_ss$activity_code)
levels(merged_ss$activity_code)<-activity_labels[,2]

## convert subjects to a factor
merged_ss$subject<-factor(merged_ss$subject)

## the average of each variable for each activity and each subject
merged_ss.x <- subset(merged_ss, select= -c(dataset_id, activity_code, subject))
merged_ss.s <- subset(merged_ss, select= c(dataset_id, activity_code, subject))
final_data<-aggregate(merged_ss.x, merged_ss.s, mean)  ## head(final_data)

## create a file called HAR_tidy_data.txt containing the tidy dataset in the UCI HAR Dataset folder
write.table(final_data, file="./HAR_tidy_data.txt", append=FALSE)

