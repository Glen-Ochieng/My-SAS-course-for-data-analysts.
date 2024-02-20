* There are two ways to append datasets-joins rows i.e the last row of the first dataset will come before the first row of the second dataset.(not merge-joins columns) .;

* 1. Using the set statement.;

*Syntax;

data somename;
set dataset1 dataset2;
run;

*2. Using the proc append statement.

/*Syntax
proc apend
base=dataset2 data=dataset1-that becomes edited to be the appended dataset;
run;
*/

proc append base = dead data = alive;
run;

*The disadvantage of this method is that you will lose the original dataset as it is edited.
