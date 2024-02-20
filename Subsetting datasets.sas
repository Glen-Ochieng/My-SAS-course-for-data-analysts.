* We already introduced the first technique of doing this. That was by using the if statement without a when.This works where a condition applies.;

data temp;
	set sashelp.heart;
if status = "Alive" and sex="Male" and smoking_status = "Very Heavy (>25)";
run;	

*The next method invloves using the set options (firstobs and obs). Here you hand pick the exact rows in your sub-dataset whereby firstobs=Beginning row index and obs =Last row index.
*All columns are brought back.;

data temp;
	set sashelp.heart (firstobs=1 obs=5);
run;	

*This will bring out records of the first 5 rows.


*----------------------------------------------------------------------------------------------------------------------------------------------------------------------;

* WHERE

/* A key thing to remember about the where statement is that unlike the if statement, it allows you to use between arguement. 
Also, the where statement subsets the dataset pre-buffer memory.Simply put, it filters the dataset before any other operations can be made. This is useful as it saves memory.
However, it can be disadvantageous if you wish to perform future operations. For example, your filtered dataset dropped the height column, the BMI formula wont work. 
In such cases, it is better to use the if statements in order to perform future operations as the original dataset is stored in memory whilst the filtering is occuring.

They both use and for writing multiple mandatory conditions and or for multiple optional conditions;
 20000 <= salary <= 50000 can be written as where salary between 20000 and 50000. Notice between statement in SAS is inclusive of lower and upper limits.*/

data temp;
	set sashelp.heart;
where status = "Alive" and sex="Male" and smoking_status = "Very Heavy (>25)";
run;	


 
