The following files were used as references from the provided dataset:

1. 'README.txt'

2. 'features_info.txt': Shows information about the variables used on the feature vector.


The following files were imported for analysis from the provided dataset:

1. 'features.txt': List of all features. Imported as 'features'.

2. 'activity_labels.txt': Links the class labels with their activity name. Imported as 'activities'.

3. 'train/subject_train.txt': The subject who performed the activity for each window sample. Imported as 'train_subject'.

4. 'train/X_train.txt': Training set. Imported as 'train_x'.

5. 'train/y_train.txt': Training labels. Imported as 'train_y'.

6. 'test/subject_test.txt' : Similar to 'subject_train.txt'. Imported as 'test_subject'.

7. 'test/X_test.txt': Test set. Imported as 'test_x'.

8. 'test/y_test.txt': Test labels. Imported as 'test_y'.


Transformations used:

1. 'train' : Merged table containing 'train_subject', 'train_x' and 'train_y'. Column headers were updated to descriptive labels. 'train_x' headers were changed to labels using setNames() with the 'features' table.

2. 'test' : Similar to 'train' but merged the 'test_subject', 'test_x' and 'test_y' tables instead.

3. 'merged' : Merged table combining the 'train' and 'test' tables.

4. 'final' : Extract of 'merged'. Includes only measurements on the mean and standard deviation. Activities were updated to descriptive labels using merge() with the 'activities' table.

5. 'averages' : New tidy dataset containing the average of each variable for each activity and subject. Each row represents a measurement for a single feature or variable. 

'New Dataset.txt' : Output file for submission. Contains the 'averages' dataset. Can be viewed using the read.table() command with the argument header=TRUE.

Tidy data principles were applied according to https://cran.r-project.org/web/packages/tidyr/vignettes/tidy-data.html
