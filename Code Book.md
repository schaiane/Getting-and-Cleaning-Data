This file describes variables, data, and all the work performed on the data.

* Data source:
 <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
 
* A full description of the data is available at: 
 <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

* The run_analysis.R script prepare a tidy data that can be used for later analysis, following the steps:

 
  1. Reads and stores the datasets:
     
      * reads: X_train.txt and stores it as a 7352x561 data frame named: trainX;

      * reads: X_test.txt and stores it as a 2947x561 data frame named: testX;

      * reads: y_train.txt and stores it as a 7352x1 data frame named: trainY;

      * reads: y_test.txt and stores it as a 2947x1 data frame named: testY;

      * reads: subject_train.txt and stores it as a 7352x1 data frame named: subjtrain;

      * reads: subject_test.txt and stores it as a 2947x1 data frame named: subjtest;



  2. Merges the training and the test sets to create one data set.

      * the combination of trainX and testX results in: Xdt, a 10299x561 data frame.

      * the combination of trainY and testY results in: Ydt, a 10299x1 data frame.

      * the combination of subjtrain and subjtest results in: subjectdt, a 10299x1 data frame.



  3. Reads the features.txt file from the "/data" folder and stores it as a variable called feat.
     It results in a list with 66 indices used to subset the Xdt data frame.



  4. Cleans the column names of the subset removing "()" and "-" symbols.



  5. Reads activity_labels.txt, stores the data in a variable called activ, and applies descriptive activity names to the activities in the data set:

      * walking

      * walkingupstairs

      * walkingdownstairs

      * sitting

      * standing

      * laying



  6. Merges the data frame containing features (Xdt) with data frames containing activity labels (Ydt), and subject IDs (subjectdt).

     The result is saved as merged_dt.txt, a 10299x68 data frame in which the first column contains subject IDs, the second column activity names, and the last 66 columns are measurements.


  
  7. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
     The dataset contains 30 unique subjects and 6 unique activities resulting in a 180x68 data frame.


  8. Writes the resulting data set out to "tidy_dt.txt.

