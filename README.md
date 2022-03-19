# Getting-and-Cleaning-Data-Course-Project


In this experiment, 30 volunteers aged 19-48 years donned a wearable computer, specifically a smartphone (Samsung Galaxy S II) on their waists that had an embedded accelerometer and gyroscope. Measurements were taken for each person as they performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING). 

Original data for the project can be found at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The codebook in this repository contains further details on the tidy data set. The original data have been cleaned and prepared as tidy data and are contained in a text file called tidy_data.txt. The first row in the text file contains the variable names and the subsequent rows contain the data for each of the 30 participants (1 row per participant per activity [30 x 6 = 180 rows]).

Data Cleaning and Transformations to Create the Tidy Dataset
The original dataset included 561 features, including time and frequency domain variables. Signals were measured for the X axis, Y axis, and Z axis.

Steps to create a tidy dataset:

1. The original dataset was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% for the test data. The first step in data cleaning was to append the test and training datasets to create one dataset.

2. From the original 561 features, step 2 was to extract only the measurements on the mean and standard deviation for each measurement. This reduced the dataset down to 79 features.

3. Activities in the data set were labeled using descriptive activity names.

4. The next step was to appropriately label the data set with descriptive variable names. 

5. Finally, an independent tidy data set was created which contains the average of each variable for each activity and each subject.


Following is information about the experiment and original dataset from the original README file:

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

The data set contains:
- The acceleration signal from the smartphone accelerometer X axis, Y  in standard gravity units 'g'.
- The body acceleration signal obtained by subtracting the gravity from the total acceleration.
- The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

