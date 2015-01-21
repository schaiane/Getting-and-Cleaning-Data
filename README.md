# Getting and Cleaning Data Course Project

## Peer Assessment

This is a step-by-step on how to run the peer assessment code.


##### Step 1 - Downloading and saving the file

Click: 
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

Download and save the file in the folder chosen as the Working Directory.

Unzip the file.



##### Step 2 - Setting the Working Directory in RStudio

Open RStudio and submit the command setwd("your file path here") to define the Working Directory.

For MS Windows, follow the example:

setwd("D:\\Schazinha\\Cursos\\Getting and Cleaning Data\\courseR\\data\\UCI HAR Dataset")


The path should point to the same folder chosen in Step 1.

You may submit the command getwd() to verify if the directory was set correctly.



##### Step 3 - Running the code

Load the file run_analysis.R on RStudio and run the code.

Or use the command source("run_analysis.R") if the code is saved in the same folder as the data.



#####  Step 4 - Reading the tidy dataset created

Submit the following command to read the data:

data <- read.table("tidy_dt.txt",header = TRUE)

dim(data) #should be 180 68