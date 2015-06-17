#You should create one R script called run_analysis.R that does the following. 
#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement. 
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names. 
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Please submit a link to a Github repo with the code for performing your analysis. The code should have a file run_analysis.R in the main directory that can be run as long as the Samsung data is in your working directory. The output should be the tidy data set you submitted for part 1. You should include a README.md in the repo describing how the script works and the code book describing the variables.

#Does it have headings so I know which columns are which.
#Are the variables in different columns (depending on the wide/long form)
#Are there no duplicate columns

#In the submission box, as well as the link, put some accompanying text on another line something like "tidy data as per the ReadMe that can be read into R with read.table(header=TRUE) {listing any settings you have changed from the default}" This is just to make it really easy for your reviewer.
#In the readMe in explaining what the script does put "and then generates a tidy data text file that meets the principles of ...etc"
#the truly cunning may want to put in a citation to this discussion and/or Hadley's paper
#The codebook still has the specific description of the tidy data file contents (and you mention that it exists and it's role in the ReadMe)



#STEP 1 + 2 + 4
#merge training data with subject + activity
train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)

#Get labels for each column
labelsTable <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)
labels <- as.character(labelsTable[["V2"]])
#Strip "()" from labels
labels <- gsub("()", "", labels, fixed=TRUE)
colnames(train) <- labels
#Select only the measurements about the mean and standard deviation for each measurement
meanAndStandard <- grepl("mean-|mean$|std", labels)
trainSubset <- train[meanAndStandard]

#read the subject data and label the column
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
colnames(subjectTrain) <- "Subject"

#read the activity data and label the column
actTrain <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
colnames(actTrain) <- "Activity"

#cbind the three data frames together: subject + activity + testData
intermediateStep <- cbind(actTrain, trainSubset)
trainData <- cbind(subjectTrain, intermediateStep)


#read test data
test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
#apply the same labels as column names
colnames(test) <- labels
#Select only the measurements about the mean and standard deviation for each measurement
testSubset <- test[meanAndStandard]

#read the subject data and label the column
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
colnames(subjectTest) <- "Subject"

#read the activity data and label the column
actTest <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
colnames(actTest) <- "Activity"

#cbind the three data frames together: subject + activity  + testData
intermediateStep2 <- cbind(actTest, testSubset)
testData <- cbind(subjectTest, intermediateStep2)

#rbind the trainData and testData, to create one big dataset
fullData <- rbind(trainData, testData)
#head(fullData[,1:3])
#tail(fullData[,1:3])




#STEP 3
#Turn the activity numbers into levels

#Read the labels file and extract the second column with the actual labels
actLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE)
actLabels <- as.character(actLabels[["V2"]])
#Change the labels of the factor 
fullData[ ,2] <- factor(fullData[ ,2], labels = actLabels)
#head(fullData[,1:3])
#tail(fullData[,1:3])


#STEP 4


#STEP 5
library(plyr)
tidyData <- ddply(fullData, c("Subject", "Activity"), numcolwise(mean))

#group_by
#summarize

#reading in the table
#data <- read.table(file_path, header = TRUE) #if they used some other way of saving the file than a default write.table, this step will be different
#View(data)