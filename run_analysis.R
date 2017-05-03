## This R script will download and process the datasets into tidy data files. 
## The files are going to be unzipped and read from the working directory of the application
## The script returns a tidy files named myTidyData.txt
## The returned file was created using the write.table() function and can be read using the read.table() function


library(dplyr)

#download the zip file
myTempFile <- tempfile()
urlZip = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(urlZip, myTempFile)

#unzip the files on the Working Directory
unzip(myTempFile, exdir = getwd())

#read field names for the training and test tables 
titles <- read.table(header=FALSE, "./UCI HAR Dataset/features.txt")
colnames(titles) <- c("num", "type")

## add the names for activities and subjects
titles <- rbind(titles, data.frame(num="562", type="activities"))
titles <- rbind(titles, data.frame(num="563", type="subjects"))
myNames <- titles$type

# Read Training dataset, activities and subjects
trainDS <- read.table(header=FALSE, "./UCI HAR Dataset/train/X_train.txt")
trainActivity <- read.table(header=FALSE, "./UCI HAR Dataset/train/y_train.txt")
trainSubject <- read.table(header=FALSE, "./UCI HAR Dataset/train/subject_train.txt")

#Read Test dataset, activities and subjects 
testDS <- read.table(header=FALSE, "./UCI HAR Dataset/test/X_test.txt")
testActivity <- read.table(header=FALSE, "./UCI HAR Dataset/test/y_test.txt" )
testSubject <- read.table(header=FALSE, "./UCI HAR Dataset/test/subject_test.txt")

# merge datasets
mergedData <- rbind(trainDS, testDS)
mergedAct <- rbind(trainActivity, testActivity)
mergedSub <- rbind(trainSubject, testSubject)
mergedDataAll <- cbind(mergedData, mergedAct, mergedSub)
colnames(mergedDataAll) <- myNames

# select only the mean and std for each measure
colMeanStd <- grep("\\bmean\\b|std|activities|subject", myNames)
valid_names <- make.names(names=names(mergedDataAll), unique=TRUE, allow_=TRUE)
colnames(mergedDataAll) <- valid_names
onlyMeanStdDS <- select (mergedDataAll, colMeanStd)

#change activity number by activity description on dataset
onlyMeanStdDS$activities <- as.character((onlyMeanStdDS$activities))
onlyMeanStdDS$activities[onlyMeanStdDS$activities=="1"] <- "Walking"
onlyMeanStdDS$activities[onlyMeanStdDS$activities=="2"] <- "Walking upstairs"
onlyMeanStdDS$activities[onlyMeanStdDS$activities=="3"] <- "Walking downstairs"
onlyMeanStdDS$activities[onlyMeanStdDS$activities=="4"] <- "Sitting"
onlyMeanStdDS$activities[onlyMeanStdDS$activities=="5"] <- "Standing"
onlyMeanStdDS$activities[onlyMeanStdDS$activities=="6"] <- "Laying"

#change names to descriptive names
colnames(onlyMeanStdDS) <- gsub("[.]","",names(onlyMeanStdDS))
colnames(onlyMeanStdDS) <- gsub("[t][B]","timeb",names(onlyMeanStdDS))
colnames(onlyMeanStdDS) <- gsub("[f][B]","filterb",names(onlyMeanStdDS))
colnames(onlyMeanStdDS) <- gsub("[t][G]","timeg",names(onlyMeanStdDS))
colnames(onlyMeanStdDS) <- gsub("[A][c][c]","Acceleration",names(onlyMeanStdDS))
colnames(onlyMeanStdDS) <- tolower(names(onlyMeanStdDS))

#change activity number by activity description on dataset
onlyMeanStdDS$activities <- as.character((onlyMeanStdDS$activities))
onlyMeanStdDS$activities[onlyMeanStdDS$activities=="1"] <- "Walking"
onlyMeanStdDS$activities[onlyMeanStdDS$activities=="2"] <- "Walking upstairs"
onlyMeanStdDS$activities[onlyMeanStdDS$activities=="3"] <- "Walking downstairs"
onlyMeanStdDS$activities[onlyMeanStdDS$activities=="4"] <- "Sitting"
onlyMeanStdDS$activities[onlyMeanStdDS$activities=="5"] <- "Standing"
onlyMeanStdDS$activities[onlyMeanStdDS$activities=="6"] <- "Laying"


#create a second dataset with the average of each variable for each activity and subject

#group the dataset by activity and subject
groupDS <- group_by(onlyMeanStdDS, activities, subjects)
tidyDataSet <-  groupDS %>% summarize_each(funs(mean)) 

#create file 
write.table(tidyDataSet, "myTidyData.txt")

