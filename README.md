Getting and Cleaning Data Course Project
=========

How the script run_analysis.R works

This script assumes you have a folder called "UCI HAR Dataset" in your working directory, with all the required data files, as provided here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#Step 1 and 2
In this step, the script reads in the training data and the test data
For each of these data sets, the following is done:
 - Read the main data file into a dataframe 
 - Read the file that has the labels for this data file, remove unneccesary characters "()"
 - Assign the labels to the columns of the dataframe
 - Create a new dataframe that contains only the columns of data that are asked for by the assignment: "Extract only the measurements on the mean and standard deviation for each measurement." I have interpreted this to be any measurement containing "mean" or "std". (I did not select the measurements on meanFreq, as this does not seem to fit the requirement of the assigment)
 - Append the activity labels as a column in front of this dataframe
 - Append the subject labels as a colum in front of this dataframe

Now, we have two complete dataframes, trainData and testData, which are added together using rbind, to create the full data set fullData.

#Step 3
In this step the script changes the numeric activity values into descriptive names, using the file in the data that describes the values, activity_labels.txt

#Step 4
This step improves the labels for the columns of the data set, making them more descriptive and easy to read.

#Step 5
Using the ddply function, for each combination of Subject and Activity, we get the mean of each numeric column of the dataframe. This is precisely what the assignment asks for.
This results in a dateframe of 180 rows and 68 variables (columns)
The first two columns indicate wich Subject and Activity, respectively, the row concerns.
The other 66 columns contain the mean of the observations for 66 different variables (which themselves are means or standard deviations).

#Reading in the tidy data set
If you want to read the tidy data set in again, you can use the following code

  data <- read.table("tidyData.txt", header = TRUE) 
  View(data)


