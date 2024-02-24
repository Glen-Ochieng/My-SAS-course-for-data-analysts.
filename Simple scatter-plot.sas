/* WE use the PROC SGPLOT statement.

Syntax
PROC SGPLOT data=dataset_name;
SCATTER x=var1 y=var2;
run;

*Say we wanted to filter by sex

proc sgplot data=sashelp.heart;
scatter x=height y=weight/ group=sex;
run;
