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


#mynames <- c("bob", "mary", "tom")
#description <- my names
#description <- gsub("o", " the letter o ", description)
#description <- gsub("m", " the letter m ", description)
#codestart <- paste(mynames, description)
#write.table(codestart, "startofcodebook.md")

#merge training data with subject + activity
train <- read.table("./UCIDataset/train/X_train.txt", header=FALSE)
subjectTrain <- read.table("./UCIDataset/train/subject_train.txt", header=FALSE)
colnames(subjectTrain) <- "Subject"
actTrain <- read.table("./UCIDataset/train/y_train.txt", header=FALSE)
colnames(actTrain) <- "Activity"
actTrain[ ,1] <- factor(actTrain[ ,1], labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

middleTrain <- cbind(subjectTrain, train)
trainData <- cbind(actTrain, middleTrain)

#merge test data with subject + activity
test <- read.table("./UCIDataset/test/X_test.txt", header=FALSE)
subjectTest <- read.table("./UCIDataset/test/subject_test.txt", header=FALSE)
colnames(subjectTest) <- "Subject"

actTest <- read.table("./UCIDataset/test/y_test.txt", header=FALSE)
colnames(actTest) <- "Activity"
actTest[ ,1] <- factor(actTest[ ,1], labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))


middleTest <- cbind(subjectTest, test)
testData <- cbind(actTest, middleTest)

#reading in the table
#data <- read.table(file_path, header = TRUE) #if they used some other way of saving the file than a default write.table, this step will be different
#View(data)