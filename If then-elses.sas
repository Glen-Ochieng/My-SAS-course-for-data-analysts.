*1.First and foremost If can be used to filter a dataset according to a certain condition
data demo2 ;
set sashelp.heart;
if ageatstart >= 60;
run;
*This will return a dataset with all records that have the ageatstart of greater than or equal to 60.


*2.
data demo2 ;
set sashelp.heart;
*Creating new variables using conditionals;
if ageatstart >= 60 then senior=1;
if ageatstart < 60 then senior=0;
run;
*Alternatively using else ;
data demo3 ;
set sashelp.heart;
if ageatstart>= 60 then senior=1;
else senior =0;
run;

*Editing existing variables;
data demo2 ;
set sashelp.heart;
if deathcause="Unknown" then deathcause="";
run;

*If then - delete
*This is useful to delete records that met that criteria 
data demo ;
set sashelp.heart;
if deathcause="Unknown" then delete;
run;

*For multiple conditions then we use the else-if statements 
data demo2 ;
set sashelp.heart;
length smokingstatus $ 20; 
*Otherwise the column will truucate 
if smoking = 0 then smokingstatus = "Non-smoker";
else if 1<= smoking <= 5 then smokingstatus="Light smoker";
else if 6<= smoking <=15 then smokingstatus="Moderate smoker";
else smokingstatus ="Heavy smoker";
run;

*To create multiple variables we can use the if-then do statements, finishing with end;
data readings1;
set readings;
length tag1 $ 10 tag2 $ 10 tag3 $ 10; *Do not write commas in between these values;
if id < 100 then do
	tag1="Old1";
	tag2="Old2";
	tag3 ="Old3";
end;
else if id>=100 then do
	tag1="Unchecked1";
	tag2="Unchecked2";
	tag3 ="Unchecked3";
end; 
run;
