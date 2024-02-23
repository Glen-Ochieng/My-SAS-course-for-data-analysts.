/* PROC MEANS is used to provide basic descriptive information about continuous variables. It produces statistics such as N,min,max,sd by default.
We could also specifiy specific measures using KEY words.i.e in the data statement we can type range,skeweness,kurtosis,sum,median,ULCM,LCLM,NMISS...

This would bring the specified stat only in stead of all those stats.

Syntax
proc means data=datasetname KEYWORDS;
by var1 - the by statement specifies the variable we wish to group the other variables by;
class var - works the same as the by statement, groups the other variables by that varaible;
var var1 var2 - the variables we want to focus on in the dataset;
output out=new_dataset_name - saves the new output into its own dataset;
run;
*/

proc means data =sashelp.heart;
class sex;
var height;
output out=means;
run;

/*The reason we opted for class in stead of BY is because BY statement requires the dataset to be sorted otherwise it returns an error.
Also the BY statement will return two tables for each gender unlike CLASS which returns 1 table. */

*Adding skewness, sum and kurtosis;
proc means data =sashelp.heart sum skewness kurtosis;
class sex;
var height;
output out=means;
run;

