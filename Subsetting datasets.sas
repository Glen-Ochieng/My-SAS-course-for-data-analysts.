/# We already introduced the first technique of doing this. That was by using the if statement without a when.This works where a condition applies.;

The next method invloves using the firstobs and obs. Here you hand pick the exact rows in your sub-dataset whereby firstobs=Beginning row index and obs =Last row index.
All columns are brought back.#/;

data temp;
	set sashelp.heart (firstobs=1 obs=5);
run;	
# This will bring out records of the first 5 rows.
