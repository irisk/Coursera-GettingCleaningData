data <- read.table("./UCI HAR Dataset/tidyData.txt", header=FALSE)


labels <- colnames(data)


description <- gsub("o", " the letter o ", description)
description <- gsub("m", " the letter m ", description)
codestart <- paste(mynames, description)
write.table(codestart, "startofcodebook.md")

