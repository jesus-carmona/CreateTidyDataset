# CreateTidyDataset
## Final Project for Getting and Cleaning Data Course

This project is created to fulfill the final assignment for the Getting and Cleaning Data course. In this repo you will find 3 files: 

* Readme.md file -  explains what all the files in this repo will do.
* Codebook – this file explains in detail what the run_analysis.R will do, as well as to give details of all the steps perform on the script as well as all the variables that are used in such a script.
* run_analysis.R – this is an R script that takes raw datasets and convert them into tidy datasets and files. 

### Explanation of what the run_analysis.R script will do

1.	It downloads a zip file into a temporary file and unzips the packed files into a folder (UCI HAR Dataset/) on the default working directory.
2.	It unpacks all the files into the same folder.
3.	It reads 7 files out of the folder:
  a.	features.txt, this file contains the headers of all the fields in the dataset.
  b.	X_train.txt – contains all the data for the training dataset, excluding “activities” and “subjects”
  c.	Y_train.txt – contains the activities corresponding to each row on the X_train.txt file.
  d.	Subject_train.txt - contains the subjects corresponding to each row on the X_train.txt file.
  e.	X_test.txt – contains all the data for the test dataset, excluding “activities” and “subjects”
  f.	Y_test.txt – contains the activities corresponding to each row on the X_test.txt file.
  g.	Subject_test.txt - contains the subjects corresponding to each row on the X_test.txt file.
4.	It merges the data, activities, and the subjects to the corresponding training and test datasets
5.	It merges the completed training and test datasets
6.	It adds the field names to the merged dataset
7.	Selects only the fields in which the mean and standard deviation are measured
8.	Creates a new dataset with only the selected measures.
9.	Changes all activity numbers by their associates activity names (i.e. “walking” instead of “1”, Walking upstairs” instead of “2”, etc.)
10.	Changes the activity names to more meaningful names (i.e. get rid of the dots “.” Used in names, uses the word “time” instead of the letter “t”, uses the word “filter” instead of the word “f”, uses the word “accelerate” instead of the abbreviation “acc”, converts all to lowercases)
11.	Creates a second dataset with the average of each variable for each activity and subject.
12.	Groups this dataset by activity and by subject
13.	Calculates the average of each measure by activity and by subject
14.	Creates a tidy file on disk with the data ready to use.
