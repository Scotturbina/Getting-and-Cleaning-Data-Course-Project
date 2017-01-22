## Loading the activity labels and other features
activity_Labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_Labels[,2] <- as.character(activity_Labels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

features_Required <- grep(".*mean.*|.*std.*", features[,2])
features_Required.names <- features[features_Required,2]
features_Required.names = gsub('-mean', 'Mean', features_Required.names)
features_Required.names = gsub('-std', 'Std', features_Required.names)
features_Required.names <- gsub('[-()]', '', features_Required.names)
