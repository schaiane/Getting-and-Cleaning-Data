## Choosing the Working Directory ##

#setwd("D:\\Schazinha\\Cursos\\Getting and Cleaning Data\\courseR\\data\\UCI HAR Dataset")
getwd()

##Downloading and saving the file ##

# Go to: 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Download and save the file in the folder chosen as the Working Directory.
# Unzip the file.

## Reading the datasets##

trainX <- read.table("./train/X_train.txt")
dim(trainX) # 7352  561

testX <- read.table("test/X_test.txt")
dim(testX) # 2947  561

trainY <- read.table("./train/y_train.txt")
dim(trainY) # 7352    1

testY <- read.table("test/y_test.txt")
dim(testY) # 2947    1

subjtrain <- read.table("train/subject_train.txt")
dim(subjtrain) # 7352    1

subjtest <- read.table("test/subject_test.txt")
dim(subjtest) # 2947    1

## 1. Merging the training and the test sets to create one data set.

Xdt <- rbind(trainX, testX)
dim(Xdt) # 10299   561

Ydt <- rbind(trainY, testY)
dim(Ydt) # 10299     1

subjectdt <- rbind(subjtrain, subjtest)
dim(subjectdt) # 10299     1

## 2. Extracting only the measurements on the mean and standard deviation 
#  for each measurement.

feat <- read.table("features.txt")
dim(feat) # 561   2

MeanStdFeat <- grep("-mean\\(\\)|-std\\(\\)", feat[, 2])
Xdt <- Xdt[, MeanStdFeat]
dim(Xdt) # 10299    66
names(Xdt) <- feat[MeanStdFeat, 2]
names(Xdt) <- gsub("\\(|\\)", "", names(Xdt))
names(Xdt) <- tolower(names(Xdt))

## 3. Uses descriptive activity names to name the activities in the data set

activ <- read.table("activity_labels.txt")
dim(activ) # 6 2
activ[, 2] = gsub("_", "", tolower(as.character(activ[, 2])))
Ydt[,1] = activ[Ydt[,1], 2]
names(Ydt) <- "activity"

## 4. Appropriately labels the data set with descriptive activity names.

names(subjectdt) <- "subject"
cleandt <- cbind(subjectdt, Ydt, Xdt)
dim(cleandt) # 10299    68
write.table(cleandt, "merged_dt.txt")

## 5. From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.

subjuniq = unique(subjectdt)[,1]
subjnum = length(unique(subjectdt)[,1])
activnum = length(activ[,1])
colnum = dim(cleandt)[2]
result = cleandt[1:(subjnum*activnum), ]
row = 1
for (s in 1:subjnum) {
        for (a in 1:activnum) {
                result[row, 1] = subjuniq[s]
                result[row, 2] = activ[a, 2]
                temp <- cleandt[cleandt$subject==s & cleandt$activity==activ[a, 2], ]
                result[row, 3:colnum] <- colMeans(temp[, 3:colnum])
                row = row+1
        }
}
write.table(result, "tidy_dt.txt",row.names = FALSE)
