/* PROC UNIVARIATE provides  alot more information compared to the PROC MEANS. Such as the distributions of variables, central tendencies, outliers, plots(histograms, box plots,stem and leaf)

Syntax

PROC UNIVARIATE data=dataset_name;
VAR var1...;
run
*/

proc univariate data =sashelp.heart;
var ageatstart;
run;

*To check outliers/extreme observations we can add the option nextrobs=___. This will bring the 12 most extreme values from both ends.

proc univariate data =sashelp.heart nextrobs=12;
var ageatstart;
run;

*We can also bring up all related plots by including the plot/plots  option

proc univariate data =sashelp.heart nextrobs=12 plot;
var ageatstart;
run;

*To plot a histogram;

proc univariate data =sashelp.heart nextrobs= 20 ;
var ageatstart;
hist ageatstart;*specifying the variable is optional is its the same variable used in the VAR statement
run;

* To add a normal line to your histogram;

proc univariate data =sashelp.heart nextrobs= 20 ;
var ageatstart;
hist ageatstart/Normal;
run;

*For probplot;

proc univariate data =sashelp.heart ;
var ageatstart;
probplot ageatstart;
run;

*For qqplot which is the same as a probplot;

proc univariate data =sashelp.heart ;
var ageatstart;
qqplot ageatstart;
run;

