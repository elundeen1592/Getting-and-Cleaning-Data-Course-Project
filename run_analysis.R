#######################################
##Step 1: Reading in the Data
#######################################

#Read in test data
setwd("C:/Users/yxj4/Desktop/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test")
testParticipant <- read.table("subject_test.txt")
testMeasures <- read.table("X_test.txt")
testLabels <- read.table("y_test.txt")

#Read in training data
setwd("C:/Users/yxj4/Desktop/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train")
trainingParticipant <- read.table("subject_train.txt")
trainingMeasures <- read.table("X_train.txt")
trainingLabels <- read.table("y_train.txt")

#Read in information on activity labels
setwd("C:/Users/yxj4/Desktop/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")
activitylabels <- read.table("activity_labels.txt")
colnames(activitylabels) <- c("activityId", "activityLabel")

#Read in information on features
features <- read.table("features.txt")

#######################################
##Step 2: Merge Datasets
#######################################

#Create a test dataset by binding columns (cbind) for the three datasets
testdata <- cbind(testParticipant, testMeasures, testLabels)
str(testdata)

#Create a training dataset by binding columns (cbind) for the three datasets
trainingdata <- cbind(trainingParticipant, trainingMeasures, trainingLabels)
str(trainingdata)

#Append the test dataset and training dataset using rbind
fulldata <- rbind(testdata,trainingdata)
str(fulldata)

#Name the columns of the merged dataset
colnames(fulldata) <- c("participant", features[, 2], "activity")
str(fulldata)

#################################################################################################
##Step 3: Extract only the variables for the mean and standard deviation for each measurement
#################################################################################################

# Use grepl to select columns that should be kept, focusing on the means and standard deviations
finalvariables <- grepl("participant|mean|std|activity", colnames(fulldata))

# In the tidy dataset keep only these selected columns
fulldata <- fulldata[, finalvariables]
str(fulldata)

################################################################################
##Step 4: Use descriptive activity names to name the activities in the data set
################################################################################

# replace activity values with named factor levels
fulldata$activity <- factor(fulldata$activity, levels = activitylabels[, 1], labels = activitylabels[, 2])
table(fulldata$activity)

################################################################################
##Step 5: Appropriately labels the data set with descriptive variable names
################################################################################

#Remove special characters from the column names
columns <- colnames(fulldata)
columns <- gsub("-", "", columns)
columns <- gsub("\\(\\)+", "", columns)

#Give the variables expanded and more interpretable names
columns <- gsub("Freq", "Frequency", columns)
columns <- gsub("^fBody", "Frequency", columns)
columns <- gsub("^t", "Time", columns)
columns <- gsub("Acc", "Accelerometer", columns)
columns <- gsub("Gyro", "Gyroscope", columns)
columns <- gsub("Mag", "Magnitude", columns)
columns <- gsub("mean", "Mean", columns)
columns <- gsub("std", "StandardDeviation", columns)
columns <- gsub("BodyBody", "Body", columns)

#Assign the revised column/variable names
colnames(fulldata) <- columns
str(fulldata)

########################################################################################################
##Step 6: Creates a tidy dataset with the average of each variable for each activity and each subject
########################################################################################################

library(dplyr)
library(data.table)

#Create an average of each variable for each activity and each subject
finaldataMeans <- fulldata %>% 
  group_by(participant, activity) %>%
  summarise_all(list(mean=mean))

#Convert tibble to data table
dt_finaldataMeans <- data.table(finaldataMeans)

########################################################################################################
##Step 7: Save a permanent dataset
########################################################################################################

write.table(dt_finaldataMeans, "tidy_data.txt", row.names = FALSE, 
            quote = FALSE)
