## Read Training data
xtrain = read.table('./UCI HAR Dataset/train/X_train.txt',header = FALSE)
ytrain = read.table('./UCI HAR Dataset/train/y_train.txt',header = FALSE)
subjecttrain = read.table('./UCI HAR Dataset/train/subject_train.txt',header = FALSE)

## Read Test Data
xtest = read.table('./UCI HAR Dataset/test/X_test.txt',header = FALSE)
ytest = read.table('./UCI HAR Dataset/test/y_test.txt',header = FALSE)
subjecttest = read.table('./UCI HAR Dataset/test/subject_test.txt',header = FALSE)

## Read Additional Data
activity_labels = read.table('./UCI HAR Dataset/activity_labels.txt',header = FALSE)
features = read.table('./UCI HAR Dataset/features.txt',header = FALSE)

## Step 1: Merge the training/test sets to create one data set
x = rbind(xtrain, xtest)
y = rbind(ytrain, ytest)
colnames(y) = c("Activity")
subject = rbind(subjecttrain, subjecttest)
colnames(subject) = c("Subject")
step1 = cbind(subject,y,x)

## Step 2: Extract only the measurements on the mean and standard deviation
col = grep("mean()|std()",features$V2)
col2 = grep("meanFreq()",features$V2)
col3 = setdiff(col,col2)
col4 = col3 + 2
step2 = cbind(step1[,1:2],step1[,col4])

## Step 3: Use descriptive activity names
step3 = step2
step3$Activity = activity_labels$V2[y$Activity]

## Step 4: Appropriately label the data set with descriptive variable names
features = features[(col3),]
features$V3 = features$V2
features$V3 = gsub("-","",features$V3)
features$V3 = gsub("\\()","",features$V3)
step4 = step3
colnames(step4) = c("Subject","Activity",features$V3)

## Step 5: Create a tidy data set
library(dplyr)
step5 = step4 %>% group_by(Subject, Activity) %>% summarize_each(funs(mean))
write.table(step5,file = "Project Tidy Data" ,row.name=FALSE) 