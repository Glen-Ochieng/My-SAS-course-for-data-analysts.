/* Merging combines two datasets based on a common variable(WHICH MUST BE OF SIMILAR CHARACTER LENGTH TO AVOID TRUNCATION). To do so first the two datsaets must be sorted using PROC SORT.

Syntax
data combined;
merge dataset1 dataset2;
by common_varaiable;
run;
*/

