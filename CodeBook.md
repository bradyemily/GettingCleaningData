# Code Book

### Data Files
This data consists of 3 training sets and 3 testing sets that contain the subject, the activity they were doing, and the measurements that were taken. The training and test sets are of the same data type, and together represent the data from 30 subjects. There are two additional data files; one that gives information about the different activities, and one that provides names for all of the measurements.
subject_train.txt
y_train.txt
X_train.txt
subject_test.txt
y_test.txt
X_test.txt
activity_labels.txt
features.txt

### Transformation Steps
8 data files are read into tables.

Step 1: Merge the training/test sets to create one data set. The corresponding test and training sets (i.e. x_test and x_train) should be combined with an r bind. At this point, I renamed the column for the subject data to "Subject" and for the y data to "Activity" in order to avoid duplicate column names at the next step. Then the resulting three sets (subject, y, x) are combined with an cbind. 

Step 2: Extract only the measurements on the mean and standard deviation. I made the decision that this means extracting only the measurements with mean() or std() in the name. I searched through the features data to return the row numbers that met this criteria. Adding 2 to these numbers allows them to correspond to the correct columns in the dataset from step 1, and the other measurement columns were dropped. At this point I realized that my search method had included measurements of the type meanFreq(), so I manually compared the features data to the step2 dataset (row 294 = colname V294) to drop these additional measurement columns.

Step 3: Use descriptive activity names. With the activity_labels data acting as a lookup table, the numbers 1-6 in the "Activity" column in the combined dataset were replaced with the activity names (walking, standing, etc.)

Step 4: Appropriately label the data set with descriptive variable names. I looked at the measurement names in the features dataset, and used the colnames function to assign more descriptive versions of the measurement names to the columns. (For example, measurement "tBodyAcc-mean()-X" became column "Mean Time of x Body Acc".)

Step 5: Create a tidy data set. I used the group_by and summarize_each functions in the dplyr package to take the average measurement for each subject/activity combination. This was then written into a text file.

### Data Dictionary
