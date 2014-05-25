## Description
This script is used to extract, clean and calculate means for subset of variables from UCI HAR Dataset (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). It expects that folder with data is in working dir, read and merge both train and test sets and output processed data to variable_means.tsv file in TAB-separated format.

## Features
 * Activity -- Activity label, one of those:
 ** WALKING
 ** WALKING_UPSTAIRS
 ** WALKING_DOWNSTAIRS
 ** SITTING
 ** STANDING
 ** LAYING
 * Subject -- An identifier of the subject who carried out the experiment

The following is a copy of the original description of variables. For each variable the mean was calculated from all the data.

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
> 
> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
> 
> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
> 
> These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
> 
>  * tBodyAcc-XYZ
>  * tGravityAcc-XYZ
>  * tBodyAccJerk-XYZ
>  * tBodyGyro-XYZ
>  * tBodyGyroJerk-XYZ
>  * tBodyAccMag
>  * tGravityAccMag
>  * tBodyAccJerkMag
>  * tBodyGyroMag
>  * tBodyGyroJerkMag
>  * fBodyAcc-XYZ
>  * fBodyAccJerk-XYZ
>  * fBodyGyro-XYZ
>  * fBodyAccMag
>  * fBodyAccJerkMag
>  * fBodyGyroMag
>  * fBodyGyroJerkMag
> 
> The set of variables that were estimated from these signals are: 
> 
>  * mean - Mean value
>  * std - Standard deviation
