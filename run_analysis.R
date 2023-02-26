# Load the required library
library(tidyverse) 

# Import data from the provided dataset
  # Import feature labels and activity labels
  features <- read.table("UCI HAR Dataset/features.txt")
  activities <- read.table("UCI HAR Dataset/activity_labels.txt")
  
  # Import training dataset
  train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
  train_x <- read.table("UCI HAR Dataset/train/X_train.txt")
  train_y <- read.table("UCI HAR Dataset/train/y_train.txt")
  
  # Import testing dataset
  test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
  test_x <- read.table("UCI HAR Dataset/test/X_test.txt")
  test_y <- read.table("UCI HAR Dataset/test/y_test.txt")

# Step 1: Merge imported data into a single table
  # Rename "train_x" and "test_x" using labels from "features" table
  train_x <- setNames(train_x, features[,2])
  test_x <- setNames(test_x, features[,2])
  
  # Merge all training and testing tables into separate "train" and "test" tables
  train <- cbind(setNames(train_subject, "subject"), setNames(train_y, "activity"), train_x)
  test <- cbind(setNames(test_subject, "subject"), setNames(test_y, "activity"), test_x)
  
  # Merge "train" and "test" tables into 1 table
  merged <- rbind(train, test)
  
# Step 2: Extract only measurements on the mean and standard deviation
  final <- select(merged, subject, activity, contains("mean()"), contains("std()"))
  
# Step 3: Use descriptive names for the activities in the dataset
  final <- final %>%
    merge(x = final, y = activities, by.x = "activity", by.y = "V1") %>%
    relocate(V2, .after = subject) %>%
    select(-activity) %>%
    rename(activity = V2)
  
# Step 4: Use descriptive labels for the variables in the dataset
  # This was performed in Step 1: Rename "train_x" and "test_x" using labels from "features" table 
  
# Step 5: Create a new tidy dataset with the average of each variable for each activity and each subject
  averages <- final %>%
    group_by(subject, activity) %>%
    summarise(across(everything(), mean), .groups="drop") %>%
    pivot_longer(-c(subject, activity), names_to="feature", values_to="mean")
  
  # Export new dataset
  write.table(averages, "New Dataset.txt")