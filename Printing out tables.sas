/* The code to print out the your table is PROC PRINT.

Syntax
Proc Print data=dataset_name;
run;

However, if printing the whole dataset uses alot of memory and is rarely needed as most of our work requires subdatasets. Therefore the area to focus on with the PROC PRINT is its options.
*/

* (obs=). This data option prints only the number of rows you state;

proc print data=class.asia (obs= 10);
run;

*Prints the first 10 rows

*(firstobs= obs=) . This data option specifies the exact range of rows you want to print.

proc print data=class.asia (firstobs=2 obs= 10);
run;

*Returns the 2nd upto the 10th row

*If you had assigned lables to your observations then the label option would return the labels in stead of the raw observations.
*NB-label option does not have brackets. 

proc print data=class.asia (firstobs=2 obs= 10) label ;
run;

* noobs data option
*SAS automatically numbers the rows, to remove this index column we use the noobs option.

proc print data=class.asia (firstobs=2 obs= 10) label noobs ;
run;

/*WE MAY WISH TO JUST VIEW CERTAIN COLUMNS/VARIABLES. THIS CAN BE DONE USING THE VAR STATEMENT.

Syntax
proc print data=datasetname;
var var1 var2 var3;
run;

NB- VAR=VAR1, .. IS WRONG. DO NOT USE ANY EQUAL SIGNS. ALSO REMEMBER THE VARIABLES ARE NOT SEPERATED BY A COMMMA

*/

proc print data=class.asia (firstobs=2 obs= 10) label noobs ;
var make origin;
run;

