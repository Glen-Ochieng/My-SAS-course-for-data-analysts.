/* Merging combines two datasets based on a common variable(WHICH MUST BE OF SIMILAR CHARACTER LENGTH TO AVOID TRUNCATION).
To do so first the two datsaets must be sorted using PROC SORT.

Syntax
data combined;
merge dataset1 dataset2;
by common_varaiable;
run;
*/

data company;
	input Name $ 1-22 Age 24-25  Gender $ 27;
	datalines ;
Vincent, Martina      ,34,F
Phillipon, Marie-Odile,28,F
Gunten, Thomas        ,27,M
Harbinger, Nicholas   ,36,M
Benito ,Gisela        ,32,F
Rudelich, Herbert     ,39,M
Siriganano, Emily     ,12,F
Morrison, Michael     ,32,M
;
run; 

*YOU MUST ENSURE THE OBSERVATIONS IN THE KEY VARIABLES ARE STRICTLY IDENTCAL I.E. NO TYPOGRAPHICAL MISTAKES AND THEY ARE ALL OF THE SAME LENGTH 

data finance;
input IdNumber$ 1-11 Name$ 13-34 Salary;
lines;
074-53-9892 Vincent, Martina       35000
776-84-5391 Phillipon, Marie-Odile 29750
929-75-0218 Gunter, Thomas         27500
029-46-9261 Rudelich, Herbert      35000	
446-93-2122 Harbinger, Nicholas    33900
228-88-9649 Benito, Gisela         28000
442-21-8075 Sirignano, Emily       5000
;
run; 


proc sort
data = finance;
by Name;
run;


*one-to-one merge ;
data company_merged;
	merge company finance;
run;

/*THIS METHOD ID VERY FLAWED AS IT MERGES DEPENDING ON LOCATION RATHER THAN INFORMATION 
HENCE THE EMPHASIS ON SORTING FIRST. SPECIFICALLY THE INFORMATION ON THE SECOND DATASET
WILL OVERIDE THE INFORMATION ON THE FIRST DATASET UPON ENCOUNTERING A DIFFERENT OBSERVATION. 

HOWEVER, WHAT HAPPENS WHEN YOU DONT SORT BOTH TABLES/THERE IS A VALUE THAT IS NOT IN BOTH TABLES

IN THIS EXAMPLE Phillipon, Marie-Odile WHICH IS THE FOURTH OBSERVATION IN THE SECOND TABLE
WILL TAKE THE AGE AND GENDER OF Harbinger, Nicholas WHICH IS THE FOURTH OBSERVATION IN THE 
FIRST TABLE. 

THEREFORE THIS METHOD BECOMES USEFUL ONLY WHEN ALL THE RECORDS ARE SIMILARLY LOCATED. 
IN THIS EXAMPLE IF WE ODRERED THE FIRST TABLE AS WELL, MORISSON MICHAEL WILL CAUSE CHAOS AS 
IT ISN'T IN THE SECOND TABLE. ADDITIONALLY IT WILL BE SKIPPED. 

THUS THE SOLUTION BECOMES TO PLACE OBSERVATIONS IN THE FIRST AND SECOND TABLE IN THE SAME 
ORDER IN THE DATALINES.*/;
 
 data company1;
	input Name $ 1-22 Age 24-25  Gender $ 27;
	datalines ;
Vincent, Martina      ,34,F
Phillipon, Marie-Odile,28,F
Gunten, Thomas        ,27,M
Harbinger, Nicholas   ,36,M
Benito ,Gisela        ,32,F
Rudelich, Herbert     ,39,M
Siriganano, Emily     ,12,F
Morrison, Michael     ,32,M
;
run; 

data finance1;
input IdNumber$ 1-11 Name$ 13-34 Salary;
lines;
074-53-9892 Vincent, Martina       35000
776-84-5391 Phillipon, Marie-Odile 29750
929-75-0218 Gunten, Thomas         27500
029-46-9261 Rudelich, Herbert      35000	
446-93-2122 Harbinger, Nicholas    33900
228-88-9649 Benito, Gisela         28000
442-21-8075 Siriganano, Emily       5000
;
run; 


*one-to-one merge ;

data company_merged1;
	merge company1 finance1;
run;
 
/* OFCOURSE DOING THIS TAKES ALOT OF TIME, THAT'S WHY FOR MERGES THE BEST MERGE ISN'T A ONE-TO-ONE MERGE BUT A MATCH MERGE. 

Syntax

data somename;
merge dataset1 dataset2;
by common-variable(this is the KEY difference);
run;

THERE IS A CATCH THOUGH TO THIS SIMPLEE SHORTCUT. YOU MUST SORT BOTH DATASETS BEFORE HAND OTHERWISE THE MERGE MATCH CODE WILL 
RETURN AN ERROR.
*/

data company;
	input Name $ 1-22 Age 24-25  Gender $ 27;
	datalines ;
Vincent, Martina       34 F
Phillipon, Marie-Odile 28 F
Gunten, Thomas         27 M
Harbinger, Nicholas    36 M
Benito, Gisela         32 F
Rudelich, Herbert      39 M
Siriganano, Emily      12 F
Morrison, Michael      32 M
;
run; 

data finance;
input IdNumber$ 1-11 Name$ 13-34 Salary;
lines;
074-53-9892 Vincent, Martina       35000
776-84-5391 Phillipon, Marie-Odile 29750
929-75-0218 Gunten, Thomas         27500
029-46-9261 Rudelich, Herbert      35000	
446-93-2122 Harbinger, Nicholas    33900
228-88-9649 Benito, Gisela         28000
442-21-8075 Siriganano, Emily       5000
;
run; 


proc sort
data = company;
by Name;
run;

proc sort
data = finance;
by Name;
run;


data merged_dataset;
merge company finance;
	by Name;
run;

/* Additionally, you can perorm a left join(everything on the first dataset plus additional columns from second dataset) or a right join (everything on the second dataset plus additional columns from first dataset) using the in option.

The IN= option tells SAS to create a flag that has either the value 0 or 1. If the observation does not come from the dataset, then the flag returns 0. If the observation comes from the data set, then the flag returns 1.X and Y are temporary variables that hold these flags then using the if statement as a filter. If we wanted we could, create permanent variables indicating these flags in the dataset by adding codes below before the run command: 
name1=x; 
name2=y;

Again, you must remember to sort the datasets first by the common variable.*/

proc sort
data = company;
by Name;
run;

proc sort
data = finance;
by Name;
run;


*left join

data left_merged;
merge company(in= x) finance(in=y);
by Name;
if x;
run;

data right_merged;
merge company(in= x) finance(in=y);
by Name;
if y;
run;

*Adding the flag variables

data merged_dataset;
merge company(in=x) finance(in=y);
	by Name;
 right_flag=x;
 left_flag= y;
run;
