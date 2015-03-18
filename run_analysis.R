# run_analysis does the following
# 1. Check for packages required
# 2. save current folder to come back to it later
# 3. download data into sub folder named ./project and extract zip file
# 4. Merges the training and the test sets to create one data set.
# 5. Extracts only the measurements on the mean and standard deviation for each measurement.
# 6. Uses descriptive activity names to name the activities in the data set
# 7. Appropriately labels the data set with descriptive variable names. 
# 8. From the dataset in previous step, creates a second, independent tidy data 
#    set with the average of each variable for each activity and each subject.
# 9. Save independent tidy dataset into the folder where run_analysis() script
#    was executed and save it as UCI_HAR_tidy_dataset.txt
#
run_analysis <- function() {
        # install and check packages required
        check_packages()
        
        # Save original folder for later
        original_folder <- getwd()
        
        # create sub folder and download data
        download_data()
        
        # Merge training and test dataset into data (list)
        data <- merge_training_test_dataset()
        
        # Retrieve mean and standard deviation for all readings 
        readings <- get_mean_std(data$readings)
        
        # Rename readings, activities and column name for subjects
        activities <- set_activities_name(data$activities)
        colnames(data$subject) <- c("subjects")
                
        # Combind readings, activities and subjects into one data frame  
        combined <- cbind(data$subject, activities, readings)  
        
        # Create tidy dataset
        tidy <- create_tidy_dataset(combined)
        
        # Write tidy dataset as text file in original folder
        save_tidy_dataset(tidy, "UCI_HAR_tidy_dataset.txt", original_folder)
}

# Check for packages. If not install go ahead and install them
check_packages <- function() {
        # Install required packages if not done already
        if (!require("plyr")) {
                install.packages("plyr")
        }
        
        if (!require("data.table")) {
                install.packages("data.table")
        }
        
        require("plyr")
        require("data.table")
        
        message("Packages checked")
}

# Download file from the server and unpack it
download_data <- function() {
        # Set your sub folder, source file and url for the question
        sub_dir <- "./project"
        data_dir <- paste(sub_dir, "UCI HAR Dataset", sep = "/")
        
        # If filder already exists most likely data are already local
        if(!file.exists(data_dir)) {
                dir.create(sub_dir)
                # Time to download data from the server
                activity_zip <- "activity.zip"
                url_data <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
                file_actitivy <- paste(sub_dir, activity_zip, sep = "/")
                message("Downloading data")
                download.file(url_data, destfile=file_actitivy, method = "curl")
                unzip(file_actitivy, exdir = sub_dir) 
        }
        setwd(data_dir)
        message(getwd())
}


# Query train and test data set and merge them. 
# Return a list containing subject, activities and mean & std readings
merge_training_test_dataset <- function() {
        ## Read train data
        train_subjects <- read.table("./train/subject_train.txt",header=FALSE)
        message("Getting train subjects")
        train_x <- read.table("./train/X_train.txt",header=FALSE)
        message("Getting train x")
        train_y <- read.table("./train/y_train.txt",header=FALSE)
        message("Getting train y")
        
        # Read test data
        test_subjects <-read.table("./test/subject_test.txt",header=FALSE)
        message("Getting test subjects")
        test_x <- read.table("./test/X_test.txt",header=FALSE)
        message("Getting test x")
        test_y <- read.table("./test/y_test.txt",header=FALSE)
        message("Getting test y")
        
        # Read feature and label
        features <- read.table("./features.txt",header=FALSE)
        message("Getting features")
        activityLabels <- read.table("./activity_labels.txt",header=FALSE)                
        message("Getting activity labels")
        
        # Next is to merge training and test set
        subjects <- rbind(train_subjects, test_subjects)
        readings <- rbind(train_x, test_x)
        activities <- rbind(train_y, test_y)
        
        # build a list with subject, activities and readings and return it
        list(readings=readings, activities=activities, subjects=subjects)
}

# Extract mean and standard deviation from the full data set
get_mean_std <- function(data) {
        # From input data, extract measurements of the mean
        # and standard deviation for each observation.
        
        # Read features from file
        features <- read.table("features.txt")
        # Find mean and std columns
        mean_col <- sapply(features[,2], function(x) grepl("mean()", x, fixed=T))
        std_col <- sapply(features[,2], function(x) grepl("std()", x, fixed=T))
        # Extract both of them from the data
        mean_std <- data[, (mean_col | std_col)]
        colnames(mean_std) <- features[(mean_col | std_col), 2]
        # return mean and standard
        mean_std
}

# Rename activities with descriptive title
set_activities_name = function(data) {
        # Use descriptive names for the 6 types of activities in the dataset
        colnames(data) <- "activities"
        data[data == 1] <- "WALKING"
        data[data == 2] <- "WALKING_UPSTAIRS"
        data[data == 3] <- "WALKING_DOWNSTAIRS"
        data[data == 4] <- "SITTING"
        data[data == 5] <- "STANDING"
        data[data == 6] <- "LAYING"
        data
}

# Create independent tidy dataset that average each variable for each activity
# and each subject
create_tidy_dataset <- function(data) {
        # Split data frame, apply function, and return results in a data frame
        # the 2 first columns are subjects and activities.
        # We need to compute means for column 3 to the end for each observation
        nbOfCol <- dim(data)[2]
        ddply(data, .(subjects, activities), function(x) colMeans(x[,3:nbOfCol]))
}

# save tidy dataset into a text file on the working folder where the script
# is running from
save_tidy_dataset <- function(tidy_data, tidy_file, folder) {
        # Set the location where we like to save the tidy dataset
        setwd(folder)
        
        write.table(tidy_data, tidy_file, row.names=FALSE)
        
        #Show the user where the file is located
        msg <- paste(getwd(), tidy_file, sep = "/")
        msg <- paste0("Tidy dataset created here: ", msg)
        message(msg)        
}
