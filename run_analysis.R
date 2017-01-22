## Loading the activity labels and other features
activity_Labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_Labels[,2] <- as.character(activity_Labels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])
## Extracing mean and standard deviation data
features_Required <- grep(".*mean.*|.*std.*", features[,2])
features_Required.names <- features[features_Required,2]
features_Required.names = gsub('-mean', 'Mean', features_Required.names)
features_Required.names = gsub('-std', 'Std', features_Required.names)
features_Required.names <- gsub('[-()]', '', features_Required.names)
##Load required datasets

training <- read.table("UCI HAR Dataset/train/X_train.txt")[features_Required]
training_Activities <- read.table("UCI HAR Dataset/train/Y_train.txt")
training_Subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
training <- cbind(training_Subjects, training_Activities, training)

testing <- read.table("UCI HAR Dataset/test/X_test.txt")[features_Required]
testing_Activities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testing_Subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
testing <- cbind(testing_Subjects, testing_Activities, testing)
