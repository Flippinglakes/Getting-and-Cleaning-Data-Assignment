# Getting-and-Cleaning-Data-Assignment

This script is designed to work with the ‘Human Activity Recognition Using Smartphones’ dataset found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The original dataset contains data recorded using the Samsung Galaxy S smartphone. Thirty subjects wore the smartphone whilst performing different activities, and gyroscope and accelerometer was recorded. The original dataset is split into two groups: a training group and a test group. These are both further split into files indicating the subject, the activity being performed, and the measurments of the movement. 

Before running the script please download the dataset and set the UCI Har folder as your working directory. This script requires that the dplyr package is installed prior to use.

This script does the following:

1. Labels the measurement data

2. Merges the subject, activity and measurement files for both the training and test groups

3. Merges the training and test group data into one data frame

4. Extracts the mean and standard deviation measurements

5. Renames the measurements to make the titles clearer

6. Renames the activities

7. Saves the data frame as a .csv file

8. Groups the data set by subject and activity variables

9. Finds the mean of each measurement by subject and activity and saves this as a table

10. Renames the measurements in the table to indicate that they are means

11. Saves this table as a .csv file 
