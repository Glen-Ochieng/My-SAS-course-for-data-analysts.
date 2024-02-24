/* To create a scatter plot we use the PROC SGPLOT statement.

Syntax

PROC SGPLOT data=dataset_name;
SCATTER x=var1 y= var2;
RUN;

*/ 

proc sgplot data=sashelp.heart;
scatter x=weight y=height;
run;

* If we wanted to filter by age

proc sgplot data=sashelp.heart;
scatter x=weight y=height/group=sex ;
run;

*A more advance method is the PROC SGSCATTER which gives a scatterplot matrix

proc sgscatter data=sashelp.iris;
title 'Scatter Matrix for Iris Data';
matrix sepallength petallength sepalwidth petalwidth/ group=species; 
run;
