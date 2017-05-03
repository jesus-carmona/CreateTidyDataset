# Codebook
## This codebook explains the process of cleaning and merging the datasets provided by the wearable computing exercise.

### The script file run_analysis.R

run_analysis.R is a R script that will download and process the datasets into tidy datasets. 
The source files are going to be unzipped and read from the working directory of the application. 
This script performs the following actions and transformations:

1.	Downloads and unzips the zip file from the website.
2.	Read the files containing
a.	The titles for the dataset
b.	The data, activities, and subjects for the training dataset
c.	The data, activities, and subjects for the test dataset 
3.	Adds the titles to both the training and the test datasets
4.	Merges both datasets (with names) the training and the test 
5.	Selects only the columns that contain the mean and the standard deviation of the merged file
6.	Changes the current field names to more descriptive meaningful names
7.	Replaces the activity numbers with activity description on the dataset
8.	Groups the dataset by activities and subjects
9.	Creates a new dataset containing the average for each activity and subject measure
10.	Writes the tidy dataset to a text file named myTidyData.txt on the default working directory.

### Variables used in the run_analysis.R script.
* myTempFile – this variable will hold the downloaded zip file
*	urlZip – this variable holds the URL of the zip file to be downloaded
*	titles – this variable will hold a data frame with a sequential number and name of the variables for the data sets.
*	myNames – this variable is a string vector that will hold all the field names of the train and test datasets.
*	trainDS – this data frame holds the data, with the added names of the variables, of the training dataset.
*	trainActivity – this dataset holds the activity code for the training dataset.
*	trainSubject – this dataset holds the subject codes for the individuals involved in the experiment
*	testDS - this data frame holds the data, with the added names of the variables, of the training dataset.
*	testActivity – this dataset holds the activity code for the test dataset.
*	testSubject – this dataset holds the subject codes for the individuals involved in the experiment
*	mergedDataAll - this data frame holds the merged data including activity and subject fields, with the added names of the variables.
*	validNames -  this is a vector that holds and changes to only valid names for the mergedData data frame.
*	onlyMeanStdDS – this is a data frame with only columns containing measurements of means and standard deviations of the merged dataset.
*	groupDS – contains the merged datasets grouped by activity and by subject.
*	tidyDataSet – Contains the average of all the variables for each activity and subject in the dataset.
*	myTidyData.txt – this is an external file created by run_analysis.R that contains the tidy dataset asked for in question 5. This file was created using the write.table() function and can be read by using read.table("myTidyData.txt") and use the View() function to inspect the data.
