# CODEBOOK For Getting and Cleaning

This Tidydata.txt contains 180 rows and 82 columns
In which each row has averaged variables for each subject and each activity.

### Only mean and standard deviation (std) data were kept
  * mean() 
  * std()
  
## The data were averaged based on subject_id and activity_type
subject_id column is numbered sequentially from 1 to 30.
activity column has 6 types.
  1. WALKING
  2. WALKING_UPSTAIRS
  3. WALKING_DOWNSTAIRS
  4. SITTING
  5. STANDING
  6. LAYING
  
  
## Variables:
* `x_train`, `y_train`, `x_test`, `y_test`, `sub_train`, `sub_test` cantains train and
 test data `activity_labels` consist `activity_id` and `activity_type` all are readed in `data.frame` format.
* All the variable cantaining `mean` and `std` are numeric type and `activity_type' is factor type.
