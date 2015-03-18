## Content of this repository
This repository contains coursera assignment from course `Getting And Cleaning Data`.

- [README.md](https://github.com/rncoursera/GettingAndCleaningDataAssignment/blob/master/README.md): Provide high level information of the content on this repository
- [run_analysis.R](https://github.com/rncoursera/GettingAndCleaningDataAssignment/blob/master/run_analysis.R): R script that performs all task necessary to create the tidy data set.
- [CodeBook.md](https://github.com/rncoursera/GettingAndCleaningDataAssignment/blob/master/CodeBook.md): Describes tidy data set content.
- [UCI_HAR_tidy_dataset.txt](https://github.com/rncoursera/GettingAndCleaningDataAssignment/blob/master/UCI_HAR_tidy_dataset.txt): Text file containig the tidy data set. This is the output of run_analysis script.

## Introduction
To be able to recreate the result on another system you need to perform the following tasks.

- Get data from Github [here](https://github.com/rncoursera/GettingAndCleaningDataAssignment)
- Run either Rstudio or R in a terminal. Set working directory to point where run_analysis.R script is located
- Source and run the script by calling run_analysis() in the console.
- The ouput will be a textt file named `UCI_HAR_tidy_dataset.txt` in the same folder where run_analysis script is located.

## List of tastks performed by the script
The script performs the following major tasks.

- Check for packages needed to run the script
- Download data from the server, uncompress them and change working folder to "./project/UCI HAR Dataset"
- Merge training and test dataset
- Extract mean and standard deviation for the dataset
- Extract activities from the dataset
- Rename column to be more descriptive
- Combine extracted data into a new reduced data frame 
- Create independent tidy dataset
- Save tidy dataset into a text file in your current working folder.

## How to run the script

- You can run the script from either Rstudio or a R terminal.
- Navigate to the folder where you cloned the repository
- Set working folder to be where you have run_analysis script.
- Source the script
- call: run_analysis()

Depending on your machine and network connection it may take sometime to fully execute. 
The script will install required packages if not installed.
Then download the data from the server if not already present in the sub folder, uncompressed data and start processing as described in section "How the script works" 
