## Getting and Cleaning Data Project

This file describes how the original data was obtained, cleaned and transformed.

### Getting raw data
Original data is located at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. It should be downloaded and unzipped to current working directory.

### Processing data

The run_analysis.R script expects that there is unzipped data in working dir and perform following steps:
 * Read all feature names from features.txt file
 * Read X_train.txt, y_train.txt, subject_train.txt
 * Read X_test.txt, y_test.txt, subject_test.txt
 * Merge previous two data sets to "all" variable
 * Read activity labels from activity_labels.txt file and replace activity levels in data set to corresponding labels
 * Select required variables and normalize their names
 * Calculate mean for all selected variables
 * Save processed data to variable_means.txt file
