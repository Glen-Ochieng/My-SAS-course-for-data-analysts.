/* This test is perfomed when two samples are deemed to be dependant on each other. They have correlation ie observations from the same individual such as in longitudinal studies.

Syntax

PROC TTEST data=dataset_name;
Paired var1*var2;
run;

*/

proc ttest data=sashelp.heart ;
paired systolic* diastolic;
run;

/*
Exercise 

Are exam 2 scores significantly different from exam 1 scores?

data quiz11; 
 input subject gender $ exam1 exam2 grade $;
datalines;
10 M 90   84 A
7  M  .   89 A
4  F 80   86 B
20 M 82    . B
25 F 94   94 A
14 F 68   84 C
;
run;

Solution
Since these are repeated measurements from the same individuals the test data is assumed to be correlated, therefore we perform a two-sample paired t-test.

proc ttest data=quiz11;
paired exam1*exam2;
run;

*/
