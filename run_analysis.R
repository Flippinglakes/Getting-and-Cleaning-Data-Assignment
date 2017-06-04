# Get dplyr
library(dplyr)

# Get test data
subjecttest<-read.csv("./test/subject_test.txt",header=FALSE,col.names="subject")
xtest<-read.csv("./test/X_test.txt",header=FALSE,sep="")
ytest<-read.csv("./test/y_test.txt",header=FALSE,col.names="activity")

# Merge test subject and activity data
test<-cbind(subjecttest,ytest)

# Get training data
subjecttrain<-read.csv("./train/subject_train.txt",header=FALSE,col.names="subject")
xtrain<-read.csv("./train/X_train.txt",header=FALSE,sep="")
ytrain<-read.csv("./train/y_train.txt",header=FALSE,col.names="activity")

# Merge training subject and activity data
train<-cbind(subjecttrain,ytrain)

# Merge test and training measurements
xtesttrain<-rbind(xtest,xtrain)

# Get column names for measurements
features<-read.csv("./features.txt",header=FALSE,sep="")
names(xtesttrain)<-features[,2]

# Merge activity and subject data for test and train
total<-rbind(test,train)

# Select measurements of means and standard deviations
xtesttrain2<-cbind(xtesttrain[,grepl("[Mm]ean",names(xtesttrain))],xtesttrain[,grepl("[Ss]td",names(xtesttrain))])

# Merge all data into one data frame
total<-cbind(total,xtesttrain2)

# Tidy the names of the data frame
names(total)<-gsub("-","",names(total))
names(total)<-gsub("\\(","",names(total))
names(total)<-gsub("\\)","",names(total))
names(total)<-gsub(",","",names(total))
names(total)<-gsub("mean","Mean",names(total))
names(total)<-gsub("^t","Time",names(total))
names(total)<-gsub("std","Stdev",names(total))
names(total)<-gsub("[Gg]ravity","Grav",names(total))
names(total)<-gsub("BodyBody","Body",names(total))
names(total)<-gsub("^f","Four",names(total))
names(total)<-gsub("anglet","AngTime",names(total))
names(total)<-gsub("angle","Ang",names(total))

# Give activities descriptive names
total<-tbl_df(total)
total$activity[total$activity=="1"]<-"walking"
total$activity[total$activity=="2"]<-"walkingupstairs"
total$activity[total$activity=="3"]<-"walkingdownstairs"
total$activity[total$activity=="4"]<-"sitting"
total$activity[total$activity=="5"]<-"standing"
total$activity[total$activity=="6"]<-"laying"

# Save the data frame to file
write.table(total,"UCIHar_Samsung.txt",row.name=FALSE)

# Group the data frame by subject and activity, find the means of each measurement by subject and activity, and rename the measurements to indicate they have been summarised
total2<-total%>%group_by(subject)%>%group_by(activity,add=TRUE)%>% summarize_each(funs(mean),TimeBodyAccMeanX:FourBodyGyroJerkMagStdev)%>%setNames(gsub("^","Mean",names(.)))

# Save the data frame to file
write.table(total2,"UCIHar_Samsung_summary.txt",row.name=FALSE)
                                                                    