## Introduction
- Get data from Github
- From R set working directory to point where run_analysis.R script is located
- Source and run script by typing run_analysis()
- Result will be generated under sub folder from your current working directiory named "./project/UCI HAR Dataset" folder named UCI_HAR_tidy_dataset.csv

## How the script works
The script perform the following high level tasks.
<pre>
- check for packages needed to run the script
- download data from the server, uncompress them and change working folder to "./project/UCI HAR Dataset"
- Merge training and test dataset
- Extract mean and standard deviation for the dataset
- Extract activities from the dataset
- Rename column to be more descriptive
- Combine extracted data into a new reduced data frame 
- Create independent tidy dataset
- Save tidy dataset into a CSV file in your current working folder.
</pre>

## How to run the script
You can run the script from either Rstudio or a R terminal.
Navigate to the folder where you cloned the repository
Source the script
call run_analysis()
Depending on your machine and network connection it may time sometime to fully execute.
The script will install required package if not installed.
Then download the data from the server is not already present in the sub folder.
Start processing data as described in "How the script works"

## Description of the tidy dataset generated
For reference and understand the full data set. [Here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) is the original description of the data we are working with.

Tidy dataset contains one observation per row with following columns of information
<pre>
1. "subjects"
2. "activities"	
3. "tBodyAcc-mean()-X"
4. "tBodyAcc-mean()-Y"
5. "tBodyAcc-mean()-Z"
6. "tBodyAcc-std()-X"
7. "tBodyAcc-std()-Y"
8. "tBodyAcc-std()-Z"
9. "tGravityAcc-mean()-X"
10. "tGravityAcc-mean()-Y"
11. "tGravityAcc-mean()-Z"
12. "tGravityAcc-std()-X"
13. "tGravityAcc-std()-Y"
14. "tGravityAcc-std()-Z"
15. "tBodyAccJerk-mean()-X"
16. "tBodyAccJerk-mean()-Y"
17. "tBodyAccJerk-mean()-Z"
18. "tBodyAccJerk-std()-X"
19. "tBodyAccJerk-std()-Y"
20. "tBodyAccJerk-std()-Z"
21. "tBodyGyro-mean()-X"
22. "tBodyGyro-mean()-Y"
23. "tBodyGyro-mean()-Z"
24. "tBodyGyro-std()-X"
25. "tBodyGyro-std()-Y"
26. "tBodyGyro-std()-Z"
27. "tBodyGyroJerk-mean()-X"
28. "tBodyGyroJerk-mean()-Y"
29. "tBodyGyroJerk-mean()-Z"
30. "tBodyGyroJerk-std()-X"
31. "tBodyGyroJerk-std()-Y"
32. "tBodyGyroJerk-std()-Z"
33. "tBodyAccMag-mean()"
34. "tBodyAccMag-std()"
35. "tGravityAccMag-mean()"
36. "tGravityAccMag-std()"	
37. "tBodyAccJerkMag-mean()"
38. "tBodyAccJerkMag-std()"
39. "tBodyGyroMag-mean()"
40. "tBodyGyroMag-std()"
41. "tBodyGyroJerkMag-mean()"
42. "tBodyGyroJerkMag-std()"
43. "fBodyAcc-mean()-X"
44. "fBodyAcc-mean()-Y"
45. "fBodyAcc-mean()-Z"
46. "fBodyAcc-std()-X"
47. "fBodyAcc-std()-Y"
48. "fBodyAcc-std()-Z"
49. "fBodyAccJerk-mean()-X"
50. "fBodyAccJerk-mean()-Y"
51. "fBodyAccJerk-mean()-Z"
52. "fBodyAccJerk-std()-X"
53. "fBodyAccJerk-std()-Y"
54. "fBodyAccJerk-std()-Z"
55. "fBodyGyro-mean()-X"
56. "fBodyGyro-mean()-Y"
57. "fBodyGyro-mean()-Z"
58. "fBodyGyro-std()-X"
59. "fBodyGyro-std()-Y"
60. "fBodyGyro-std()-Z"
61. "fBodyAccMag-mean()"
62. "fBodyAccMag-std()"
63. "fBodyBodyAccJerkMag-mean()"
64. "fBodyBodyAccJerkMag-std()"
65. "fBodyBodyGyroMag-mean()"
66. "fBodyBodyGyroMag-std()"
67. "fBodyBodyGyroJerkMag-mean()"
68. "fBodyBodyGyroJerkMag-std()"
</pre>
The tidy dataset contains 180 entries, that represents 30 subjects between age of 19-46 with each 6 activities which are:
<pre>
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING
</pre>
Each entries report x,y,z mean and standard deviation from multiple type of sensors and motions.
