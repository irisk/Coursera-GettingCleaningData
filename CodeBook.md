Getting and Cleaning Data Course Project
CodeBook - Iris van de Kieft
=========

This codebook describes the variables, the data, and any transformations or work that I performed to clean up the data.
 
## Project Description
Human Activity Recognition Using Smartphones Data Set 

You can find a description of the project [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
 
##Study design and data processing
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
 
###Collection of the raw data
Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals, and that we used for this analysis, are: 

 - mean(): Mean value
 - std(): Standard deviation
 
 See below for a complete overview of features that were included in this analysis

 
##Creating the tidy datafile
 
###Guide to create the tidy data file
1. Download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Unzip, this should give you a folder "UCI HAR Dataset"
3. Add the data and the script run_analysis.R to the same folder
4. Make this your working directory in Rstudio.
5. Run script
6. Now, you will have a tidy data set called tidyData in your workspace, and this dataset has also been stored as a file tidyData.txt
 
###Cleaning of the data
To understand how the script works please check out [this readme document](https://github.com/irisk/Coursera-GettingCleaningData/blob/master/README.md)
 
##Description of the variables in the tidyData.txt file
The data set gives for each combination of Subject and Activity, the mean of the observations for a given feature. The original data set contained 10299 observations for each feature. The tidy data set contains the mean for each group of observations, where the grouping is per Subject and Activity (180 groups).
This results in 180 rows and 68 variables (columns)
The first two columns indicate wich Subject and Activity, respectively, the row concerns.
The other 66 columns contain the mean of the observations for the 66 different features.

 
###Variable 1 - Subject
This is an integer which identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

###Variable 2 - Activity
This identifies which activity the subject performed. This can be one of 6 labels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,  SITTING, STANDING,  LAYING


###Variable 3:68 -  The means of 66 different features from the dataset
In the orginal data on the features, the variables are normalized and bounded within [ -1, 1]
The original data set contained 10299 observations for each feature. The tidy data set contains the mean for each group of observations, where the grouping is per Subject and Activity (180 groups).

Each feature label/name consists of  3 or 4 parts: p1.p2.p3.p4  (p4 is optional)
 - p1: time signal or fast fourier transformed signal
 - p2: signal type
 - p3: mean or std
 - p4: if applicable, the axis of the measurement X, Y or Z
 
 | Feature label      | Description           | Values  |
  | :------------ | :------------ | :-------- |
  | time.BodyAcceleration.mean.X | Time domain signal, Body acceleration, X direction, mean value | normalized and bounded within [ -1, 1] |
| time.BodyAcceleration.mean.Y | Time domain signal, Body acceleration, Y direction, mean value  | normalized and bounded within [ -1, 1] |
| time.BodyAcceleration.mean.Z | Time domain signal, Body acceleration, Z direction, mean value | normalized and bounded within [ -1, 1] |
| time.BodyAcceleration.std.X | Time domain signal, Body acceleration, X direction, standard deviation | normalized and bounded within [ -1, 1] |
| time.BodyAcceleration.std.Y | Time domain signal, Body acceleration, Y direction, standard deviation | normalized and bounded within [ -1, 1] |
| time.BodyAcceleration.std.Z | Time domain signal, Body acceleration, Z direction, standard deviation | normalized and bounded within [ -1, 1] |
| time.GravityAcceleration.mean.X | Time domain signal, Gravity acceleration, X direction, mean value | normalized and bounded within [ -1, 1] |
| time.GravityAcceleration.mean.Y | Time domain signal, Gravity acceleration, Y direction, mean value | normalized and bounded within [ -1, 1] |
| time.GravityAcceleration.mean.Z | Time domain signal, Gravity acceleration, Z direction, mean value | normalized and bounded within [ -1, 1] |
| time.GravityAcceleration.std.X | Time domain signal, Gravity acceleration, X direction, standard deviation | normalized and bounded within [ -1, 1] |
| time.GravityAcceleration.std.Y | Time domain signal, Gravity acceleration, Y direction, standard deviation | normalized and bounded within [ -1, 1] |
| time.GravityAcceleration.std.Z | Time domain signal, Gravity acceleration, Z direction, standard deviation | normalized and bounded within [ -1, 1] |
| time.BodyAccelerationJerk.mean.X | Time domain signal, Body acceleration jerk, X direction, mean value | normalized and bounded within [ -1, 1] |
| time.BodyAccelerationJerk.mean.Y | Time domain signal, Body acceleration jerk, Y direction, mean value  | normalized and bounded within [ -1, 1] |
| time.BodyAccelerationJerk.mean.Z | Time domain signal, Body acceleration jerk, Z direction, mean value | normalized and bounded within [ -1, 1] |
| time.BodyAccelerationJerk.std.X | Time domain signal, Body acceleration jerk, X direction, standard deviation | normalized and bounded within [ -1, 1] |
| time.BodyAccelerationJerk.std.Y | Time domain signal, Body acceleration jerk, Y direction, standard deviation | normalized and bounded within [ -1, 1] |
| time.BodyAccelerationJerk.std.Z | Time domain signal, Body acceleration jerk, Z direction, standard deviation | normalized and bounded within [ -1, 1] |
| time.BodyGyro.mean.X | Time domain signal, Body gyro (angular velocity), X direction, mean value | normalized and bounded within [ -1, 1] |
| time.BodyGyro.mean.Y | Time domain signal, Body gyro (angular velocity), Y direction, mean value  | normalized and bounded within [ -1, 1] |
| time.BodyGyro.mean.Z | Time domain signal, Body gyro (angular velocity), Z direction, mean value | normalized and bounded within [ -1, 1] |
| time.BodyGyro.std.X | Time domain signal, Body gyro (angular velocity), X direction, standard deviation | normalized and bounded within [ -1, 1] |
| time.BodyGyro.std.Y | Time domain signal, Body gyro (angular velocity), Y direction, standard deviation | normalized and bounded within [ -1, 1] |
| time.BodyGyro.std.Z | Time domain signal, Body gyro (angular velocity), Z direction, standard deviation | normalized and bounded within [ -1, 1] |
| time.BodyGyroJerk.mean.X | Time domain signal, Body gyro (angular velocity) jerk, X direction, mean value | normalized and bounded within [ -1, 1] |
| time.BodyGyroJerk.mean.Y | Time domain signal, Body gyro (angular velocity) jerk, Y direction, mean value  | normalized and bounded within [ -1, 1] |
| time.BodyGyroJerk.mean.Z | Time domain signal, Body gyro (angular velocity) jerk, Z direction, mean value | normalized and bounded within [ -1, 1] |
| time.BodyGyroJerk.std.X | Time domain signal, Body gyro (angular velocity) jerk, X direction, standard deviation | normalized and bounded within [ -1, 1] |
| time.BodyGyroJerk.std.Y | Time domain signal, Body gyro (angular velocity) jerk, Y direction, standard deviation | normalized and bounded within [ -1, 1] |
| time.BodyGyroJerk.std.Z | Time domain signal, Body gyro (angular velocity) jerk, Z direction, standard deviation | normalized and bounded within [ -1, 1] |
| time.BodyAccelerationMagnitude.mean | Time domain signal, Body acceleration magnitude, mean value | normalized and bounded within [ -1, 1] |
| time.BodyAccelerationMagnitude.std | Time domain signal, Body acceleration magnitude, standard deviation | normalized and bounded within [ -1, 1] |
| time.GravityAccelerationMagnitude.mean | Time domain signal, Gravity acceleration magnitude, mean value | normalized and bounded within [ -1, 1] |
| time.GravityAccelerationMagnitude.std | Time domain signal, Gravity acceleration magnitude, standard deviation | normalized and bounded within [ -1, 1] |
| time.BodyAccelerationJerkMagnitude.mean | Time domain signal, Body acceleration jerk magnitude, mean value | normalized and bounded within [ -1, 1] |
| time.BodyAccelerationJerkMagnitude.std | Time domain signal, Body acceleration jerk magnitude, standard deviation | normalized and bounded within [ -1, 1] |
| time.BodyGyroMagnitude.mean | Time domain signal, Body gyro (angular velocity) magnitude, mean value | normalized and bounded within [ -1, 1] |
| time.BodyGyroMagnitude.std | Time domain signal, Body gyro (angular velocity) magnitude, standard deviation | normalized and bounded within [ -1, 1] |
| time.BodyGyroJerkMagnitude.mean | Time domain signal, Body gyro (angular velocity) jerk magnitude, mean value | normalized and bounded within [ -1, 1] |
| time.BodyGyroJerkMagnitude.std | Time domain signal, Body gyro (angular velocity) jerk magnitude, standard deviation | normalized and bounded within [ -1, 1] |
| fastFourier.BodyAcceleration.mean.X | Fast fourier transformed signal, Body acceleration, X direction, mean value | normalized and bounded within [ -1, 1] |
| fastFourier.BodyAcceleration.mean.Y | Fast fourier transformed signal, Body acceleration, Y direction, mean value  | normalized and bounded within [ -1, 1] |
| fastFourier.BodyAcceleration.mean.Z | Fast fourier transformed signal, Body acceleration, Z direction, mean value | normalized and bounded within [ -1, 1] |
| fastFourier.BodyAcceleration.std.X | Fast fourier transformed signal, Body acceleration, X direction, standard deviation | normalized and bounded within [ -1, 1] |
| fastFourier.BodyAcceleration.std.Y | Fast fourier transformed signal, Body acceleration, Y direction, standard deviation | normalized and bounded within [ -1, 1] |
| fastFourier.BodyAcceleration.std.Z | Fast fourier transformed signal, Body acceleration, Z direction, standard deviation | normalized and bounded within [ -1, 1] |
| fastFourier.BodyAccelerationJerk.mean.X | Fast fourier transformed signal, Body acceleration jerk, X direction, mean value | normalized and bounded within [ -1, 1] |
| fastFourier.BodyAccelerationJerk.mean.Y | Fast fourier transformed signal, Body acceleration jerk, Y direction, mean value  | normalized and bounded within [ -1, 1] |
| fastFourier.BodyAccelerationJerk.mean.Z | Fast fourier transformed signal, Body acceleration jerk, Z direction, mean value | normalized and bounded within [ -1, 1] |
| fastFourier.BodyAccelerationJerk.std.X | Fast fourier transformed signal, Body acceleration jerk, X direction, standard deviation | normalized and bounded within [ -1, 1] |
| fastFourier.BodyAccelerationJerk.std.Y | Fast fourier transformed signal, Body acceleration jerk, Y direction, standard deviation | normalized and bounded within [ -1, 1] |
| fastFourier.BodyAccelerationJerk.std.Z | Fast fourier transformed signal, Body acceleration jerk, Z direction, standard deviation | normalized and bounded within [ -1, 1] |
| fastFourier.BodyGyro.mean.X | Fast fourier transformed signal, Body gyro (angular velocity), X direction, mean value | normalized and bounded within [ -1, 1] |
| fastFourier.BodyGyro.mean.Y | Fast fourier transformed signal, Body gyro (angular velocity), Y direction, mean value  | normalized and bounded within [ -1, 1] |
| fastFourier.BodyGyro.mean.Z | Fast fourier transformed signal, Body gyro (angular velocity), Z direction, mean value | normalized and bounded within [ -1, 1] |
| fastFourier.BodyGyro.std.X | Fast fourier transformed signal, Body gyro (angular velocity), X direction, standard deviation | normalized and bounded within [ -1, 1] |
| fastFourier.BodyGyro.std.Y | Fast fourier transformed signal, Body gyro (angular velocity), Y direction, standard deviation | normalized and bounded within [ -1, 1] |
| fastFourier.BodyGyro.std.Z | Fast fourier transformed signal, Body gyro (angular velocity), Z direction, standard deviation | normalized and bounded within [ -1, 1] |
| fastFourier.BodyAccelerationMagnitude.mean | Fast fourier transformed signal, Body acceleration magnitude, mean value | normalized and bounded within [ -1, 1] |
| fastFourier.BodyAccelerationMagnitude.std | Fast fourier transformed signal, Body acceleration magnitude, standard deviation | normalized and bounded within [ -1, 1] |
| fastFourier.BodyAccelerationJerkMagnitude.mean | Fast fourier transformed signal, Body acceleration jerk magnitude, mean value | normalized and bounded within [ -1, 1] |
| fastFourier.BodyAccelerationJerkMagnitude.std | Fast fourier transformed signal, Body acceleration jerk magnitude, standard deviation | normalized and bounded within [ -1, 1] |
| fastFourier.BodyGyroMagnitude.mean | Fast fourier transformed signal, Body gyro (angular velocity) magnitude, mean value | normalized and bounded within [ -1, 1] |
| fastFourier.BodyGyroMagnitude.std | Fast fourier transformed signal, Body gyro (angular velocity) magnitude, standard deviation | normalized and bounded within [ -1, 1] |
| fastFourier.BodyGyroJerkMagnitude.mean | Fast fourier transformed signal, Body gyro (angular velocity) jerk magnitude, mean value | normalized and bounded within [ -1, 1] |
| fastFourier.BodyGyroJerkMagnitude.std | Fast fourier transformed signal, Body gyro (angular velocity) jerk magnitude, standard deviation | normalized and bounded within [ -1, 1] |
 




