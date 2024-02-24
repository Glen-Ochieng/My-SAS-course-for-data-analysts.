/* 
A t-test is used to test whether a value is statistically significant from the mean,usually the test is "is the sample mean significantly different from 0". The underlying assumption is the sample is normally distributed and the variable is continuous.

There are three methods to perform a t-test. Using:
1.PROC MEANS
2.PROC UNVARIATE
3.PROC TTEST-official method
*/

/*PROC MEANS

Syntax
PROC MEANS data=datasetname t-which brings the test statistic probt-which brings the associated p-value of the test statistic.
var var1;
run;
*/

proc means data= sashelp.heart t probt;
var systolic;
run;

*Just to demonstrate the mean to better understand the hypothesis testing results 

proc means data= sashelp.heart mean t probt;
var systolic;
run;

*HOWEVER THE PROC MEANS CAN ONLY TEST HO=0 VS H1 != 0. 

*THIS IS CAN BE SOLVED BY USING PROC UNIVARIATE

*Syntax
proc univariate data= sashelp.heart mu0=136;
var systolic;
run;

*PROC TTEST
/*
Syntax
PROC TTEST data=dataset.name ho=136;
var var1;
run;

*/

proc ttest data=sashelp.heart h0=136.8;
var systolic;
run;
