Code Book

These datasets were modified from the ‘Human Activity Recognition Using Smartphones’ dataset found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. This dataset contains a test and a train folder, both containing text files which were used to create this data set, and both containing an ‘Inertial Signals’ folder, which was not used.

The original dataset contains data recorded using the Samsung Galaxy S smartphone. Thirty subjects wore the smartphone whilst performing different activities, and 3-axial gyroscope and accelerometer data were recorded. The original dataset is split into two groups: a training group and a test group. These are both further split into files indicating the subject, the activity being performed, and the measurments of the movement. 

The data on subject, activity and measurement were merged into dataframes for both the test and training groups. The files merged into the test data frame, from the test folder, were: subject_test.txt, X_test.txt, and y_test.txt. The files merged into the train data frame, from the train folder, were: subject_train.txt, X_train.txt and y_train.txt.

The features.txt file, found in the UCI HAR folder, was used to label the measurements.

The test and training data frames were then merged.

The measurement names were replaced with more descriptive names. Whilst tidy data preferably has descriptive unabbreviated lower-case names, in this case this would have led to very long names that were not easily understood. Camelcase was chosen and longer words were abbreviated. Codes used are found later in this text.

The activity labels were numerical and were replaced with descriptive names found in the activity_labels.txt file, see description later in this text. 

The dataframe was saved as a .csv file.

The dataframe was then grouped by subject and activity using the dplyr package. Means of each measurement were found for each subject-activity group. 

This was presented as a data frame and saved as a .csv file. 


Measurement labels

The following is modified from the features_info.txt found in the ‘Human Activity Recognition Using Smartphones’ found at:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm. 

Finally a Fast Fourier Transform was applied to some of these signals.

These signals were used to estimate variables of the feature vector for each dimension.

The names chosen were combinations of the following:

Time – Time domain signal

Acc – Total acceleration

Body – Acceleration from the body

Grav – Acceleration due to gravity

Jerk – Jerk signal derived from body linear acceleration and angular velocity

Mag – Magnitude of three dimensional signal

Freq – Frequency domain signal

Gyro – Gyroscope signal

Ang – Angle between vectors

Mean - Mean

Stdev – Standard deviation

Four – Fourier transformed data

X, Y, Z – Dimension X, Y or Z

Activity Labels

The meaning of these labels is self-evident. They were simple names, so were kept lower-case, without punctuation marks or abbreviation, as is best for tidy data.

sitting

standing

laying

walking

walkingupstairs

walkingdownstairs
