Getting and Cleaning Data Course Project
CodeBook - Iris van de Kieft
=========

This describes the variables, the data, and any transformations or work that I performed to clean up the data
The codebook describes the meaning of each column in the tidy data set.
In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels)."
#Since it say labels the data set it is talking about the variable names (which at the moment are V1, V2, etc if you have be following the steps in there numbered order. Descriptive variable names means names based on the action the variable is recording, for example the Jerk of the body on the z axis of the phone. In general, the more descriptive is going to be the better. once again make it easy for your markers by noting why they are descriptive names (what they mean goes in the code book).


#mynames <- c("bob", "mary", "tom")
#description <- my names
#description <- gsub("o", " the letter o ", description)
#description <- gsub("m", " the letter m ", description)
#codestart <- paste(mynames, description)
#write.table(codestart, "startofcodebook.md")


 
## Project Description
Short description of the project
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
 
##Study design and data processing
 
###Collection of the raw data
Description of how the data was collected.

 
##Creating the tidy datafile
 
###Guide to create the tidy data file
Description on how to create the tidy data file (1. download the data, ...)/
1. Download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Unzip, this should give you a folder ""
3. Add the data and the script run_analysis.R to the same folder
4. Make this your working directory in Rstudio.
5. Run script
6. Now, you will have a tidy data set called tidy_data, and this has also been stored as a file tidy_data.txt
 
###Cleaning of the data
To understand how the script work please check out [this readme document](https://github.com/irisk/Coursera-GettingCleaningData/blob/master/README.md)
 
##Description of the variables in the tiny_data.txt file
General description of the file including:
 - Dimensions of the dataset
 - Summary of the data
 - Variables present in the dataset
 
(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)
 
###Variable 1 (repeat this section for all variables in the dataset)
Short description of what the variable describes.
 
Some information on the variable including:
 - Class of the variable
 - Unique values/levels of the variable
 - Unit of measurement (if no unit of measurement list this as well)
 - In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels). 
 
(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)
 
##Sources
Sources you used if any, otherise leave out.

