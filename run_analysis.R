library(dplyr)

#1. merging training and testing set to create one dataset
#train data
x_train <- read.table("./train/X_train.txt", header = FALSE)
y_train <- read.table("./train/y_train.txt", header = FALSE)
sub_train <- read.table("./train/subject_train.txt", header = FALSE)

#test data
x_test <- read.table("./test/X_test.txt", header = FALSE)
y_test <- read.table("./test/y_test.txt", header = FALSE)
sub_test <- read.table("./test/subject_test.txt", header = FALSE)

#reading features and activity names
feature <- read.table("./features.txt", header = FALSE)
activity_labels <- read.table("./activity_labels.txt", header = FALSE)

# Getting data together
x_values <- rbind(x_train, x_test)
y_values <- rbind(y_train, y_test)
sub_values <- rbind(sub_train, sub_test)

#assigning values to the column
colnames(x_values) <- feature[,2]
colnames(y_values) <- "activity_id"
colnames(sub_values) <- "subject_id"
colnames(activity_labels) <- c("activity_id", "activity_type")

#dataset cantaining all data
finaldata <- cbind(x_values, y_values, sub_values)

#2. Next to remove all column except cantaining mean, std, activity_id and subject_id
#store all column names to columnName variable
columnName <- colnames(finaldata)

#4. Selection of columns and Approriately labeling of the data set with descriptive variable names
# using features
#select columname variable
needed_colname <- (grepl("activity_id", columnName) | grepl("subject_id", columnName) 
                   | grepl("mean..", columnName) | grepl("std..", columnName))

#we can also achieve this steps simply as follows
#columnName <- c("activity_id","subject_id", "1 tBodyAcc-mean()-X", "2 tBodyAcc-mean()-Y",
#                "3 tBodyAcc-mean()-Z", "4 tBodyAcc-std()-X", "5 tBodyAcc-std()-Y",
#              "6 tBodyAcc-std()-Z")


#select the data from finaldata
data_mean_std <- finaldata[ ,needed_colname == TRUE]

#3. Uses descriptive activity names to name the activities in the data set
setbyactivityname <- merge(data_mean_std, activity_labels, by = "activity_id", all.X = TRUE)

#5. From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
tidy <- setbyactivityname %>% group_by(activity_id, subject_id, activity_type) %>% summarise_all(funs(mean))


#saving the file with tidydata name
write.table(tidy,"tidydata.txt", row.names = FALSE)
