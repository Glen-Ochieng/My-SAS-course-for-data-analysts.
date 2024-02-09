*Inserting data manually;

*Step 1.Use the data statement followed by the name you wish to name your dataset.Remember the semicolon after.;
data example1;
*Step 2.State the variable types using informat($ for characters). Syntax: infomat variable.name variable.length.;
*Step 3.State the variables using input(Again remember $ for characters). Syntax: input var1 var2 var3 etc.;
	infile datalines dsd firstobs=2 obs=5;
	informat name $20. hobby $10.;
	input age name $ hobby $;

* Step 4. Insert the actual data using datalines. In stead of typing datalines, you can use either lines or cards.;
*Remember to insert semicolons after the datalines and after the last observation input.;
datalines;
A=Age B=Name C=Hobby
25,joe,hoCkey
32,sArah Yu,Running
18,abigail,painting
47,Elizabeth Lafrance,baseball
A=Age B=name C=Hobby
;

*Step 5. Always remember to finish with run and the omnipresent semicolon;
run;

*---------------------------------------------------------------------------------------------------------------------------------------;

* external file;
* using proc import;

*Step 1. Name your output/dataset using 'out=';
*Step 2.State the location of your folder using datafile; 
*Step 3. If the data is an excel file specify that using database_management_system (dbms) = excel. 
*In this case the file is text file which is the default thus the replace statement can be ignored;
**NB**
*These three steps MUST be written without a semicolon between them i.e. as one line of code. The colon only comes after replace ;

proc import out=example3 datafile="G:\Project Jstarts\Courses\Statistical Data Analysis with SAS\data\L4.txt" replace /*dbms=excel*/;
*Step 3.State the delimiter i.e tab, space, comma..etc. 
DELIMITER=",";
*Step 4. Tell SAS to get column names;
getnames=yes;
*Step 5. Run;
run;

*---------------------------------------------------------------------------------------------------------------------------------------;
* To read in data from an existing dataset, use SET statement;
*Step 1. Call your existing dataset using data;
*Step 2. After the set statement write the location of the new dataset you want to add in;
*Run;
data lecture4;
	set sashelp.heart;
run;
*---------------------------------------------------------------------------------------------------------------------------------------;

* Create permanent dataset;
* Specify the physical location to store the dataset, quoted between the double quotation marks;
* The dataset file is stored in the extention of sas7bdat;

*Step 1. Write the data statement followed by the location of you want your dataset stored on your PC in double quotation marks;
data "G:\Project Jstarts\Courses\Statistical Data Analysis with SAS\data\test";
	set sashelp.humid;
run;
