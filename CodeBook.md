# Code Book

### Data Files
This data consists of 3 training sets and 3 testing sets that contain the subject, the activity they were doing, and the measurements that were taken. The training and test sets are of the same data type, and together represent the data from 30 subjects. There are two additional data files; one that gives information about the different activities, and one that provides names for all of the measurements.
subject_train.txt\
y_train.txt\
X_train.txt\
subject_test.txt\
y_test.txt\
X_test.txt\
activity_labels.txt\
features.txt

### Transformation Steps
8 data files are read into tables.

Step 1: Merge the training/test sets to create one data set. The corresponding test and training sets (i.e. x_test and x_train) should be combined with an r bind. At this point, I renamed the column for the subject data to "Subject" and for the y data to "Activity" in order to avoid duplicate column names at the next step. Then the resulting three sets (subject, y, x) are combined with an cbind. 

Step 2: Extract only the measurements on the mean and standard deviation. I made the decision that this means extracting only the measurements with mean() or std() in the name. I searched through the features data to return the row numbers that met this criteria. Adding 2 to these numbers allows them to correspond to the correct columns in the dataset from step 1, and the other measurement columns were dropped.

Step 3: Use descriptive activity names. With the activity_labels data acting as a lookup table, the numbers 1-6 in the "Activity" column in the combined dataset were replaced with the activity names (walking, standing, etc.)

Step 4: Appropriately label the data set with descriptive variable names. I subsetted the features table so that it only had the measurements that I wanted, and then I removed the "-" and "()" from the names. I then used the colnames function to make these the names of the columns in the combined data (For example, measurement "tBodyAcc-mean()-X" became column "tBodyAccmeanX".)

Step 5: Create a tidy data set. I used the group_by and summarize_each functions in the dplyr package to take the average measurement for each subject/activity combination. This was then written into a text file.

### Data Dictionary
In this data, t stands for the time domain and f stands for the frequency domain. Names that include X, Y, or Z indicate the axial direction of the mesurement. Acc is short for accelration. Mag is short for magnitude, and these measures were calculate using the Euclidean norm. Gyro is the measurement taken with the gyroscope. With regards to the type of measurement, "mean" is the average and "std" is the standard deviation. The body linear acceleration and angular velocity were derived in time to obtain Jerk signals.

tBodyAccmeanX\
tBodyAccmeanY\
tBodyAccmeanZtBodyAccstdX\
tBodyAccstdY\
tBodyAccstdZ\
tGravityAccmeanX\
tGravityAccmeanY\
tGravityAccmeanZ\
tGravityAccstdX\
tGravityAccstdY\
tGravityAccstdZ\
tBodyAccJerkmeanX\
tBodyAccJerkmeanY\
tBodyAccJerkmeanZ\
tBodyAccJerkstdX\
tBodyAccJerkstdY\
tBodyAccJerkstdZ\
tBodyGyromeanX\
tBodyGyromeanY\
tBodyGyromeanZ\
tBodyGyrostdX\
tBodyGyrostdY\
tBodyGyrostdZ\
tBodyGyroJerkmeanX\
tBodyGyroJerkmeanY\
tBodyGyroJerkmeanZ\
tBodyGyroJerkstdX\
tBodyGyroJerkstdY\
tBodyGyroJerkstdZ\
tBodyAccMagmean\
tBodyAccMagstd\
tGravityAccMagmean\
tGravityAccMagstd\
tBodyAccJerkMagmean\
tBodyAccJerkMagstd\
tBodyGyroMagmean\
tBodyGyroMagstd\
tBodyGyroJerkMagmean\
tBodyGyroJerkMagstd\
fBodyAccmeanX\
fBodyAccmeanY\
fBodyAccmeanZ\
fBodyAccstdX\
fBodyAccstdY\
fBodyAccstdZ\
fBodyAccJerkmeanX\
fBodyAccJerkmeanY\
fBodyAccJerkmeanZ\
fBodyAccJerkstdX\
fBodyAccJerkstdY\
fBodyAccJerkstdZ\
fBodyGyromeanX\
fBodyGyromeanY\
fBodyGyromeanZ\
fBodyGyrostdX\
fBodyGyrostdY\
fBodyGyrostdZ\
fBodyAccMagmean\
fBodyAccMagstd\
fBodyBodyAccJerkMagmean\
fBodyBodyAccJerkMagstd\
fBodyBodyGyroMagmean\
fBodyBodyGyroMagstd\
fBodyBodyGyroJerkMagmean\
fBodyBodyGyroJerkMagstd
