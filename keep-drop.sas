data demo;
set sashelp.heart;
keep sex status;
run;

data demo;
set sashelp.heart;
drop sex status;
run;

*Alternatively-keep/drop can be used on either the data or set statements but you must use an equals sign operator unlike before.;
data demo (drop= ageatstart);
set sashelp.heart;
run;

data demo (keep= ageatstart);
set sashelp.heart;
run;
