/* PROC FREQ provides basic descriptive information of categorical variables. The best out there really for categorical data analysis.
It returns one to n-way contigency tables.

Syntax

PROC FREQ data=dataset.name <options>;
TABLES var1 * var2 etc <options ie chi> OUT=___; -Here the out statement comes here alongside the TABLES statement. Also, if you dont include the asterix between the variables it will create two one-way tables.;
RUN;

*/
proc freq data =sashelp.heart ;
tables status * sex ;
run;

*If you wish to remove a certain cell entry say percent then backward slash then write nopercent. This works for other cell entries as well.

proc freq data =sashelp.heart ;
tables status * sex /nopercent;
run;

*To include the chi square test

proc freq data =sashelp.heart ;
tables status * sex /nopercent chisq;
run;

*Also the OUT statement comes in the same place

proc freq data =sashelp.heart ;
tables status * sex /nopercent chisq out=cross_tab;
run;
