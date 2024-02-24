/* This is a used to test if the means of two samples are significantly different from each other. Done using PROC TTEST.

Syntax
PROC TTEST data=datasetname;
class variable_that_differentiates_the_two_groups - THERE VARIABLE HERE MUST BE CATEGORICAL i.e gender;
var variable_to_test_its_means;
run;

*/

proc ttest data=sashelp.heart ;
class sex;
var systolic;
run;
