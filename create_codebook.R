labelsTable <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)
labels <- as.character(labelsTable[["V2"]])
#Strip "()" from labels
labels <- gsub("()", "", labels, fixed=TRUE)
#Select only the measurements about the mean and standard deviation for each measurement
meanAndStandard <- grepl("mean-|mean$|std", labels)



description <- gsub("o", " the letter o ", description)
description <- gsub("m", " the letter m ", description)
codestart <- paste(mynames, description)
write.table(codestart, "startofcodebook.md")

