/*Facetting plots means splitting a plot into different plots based on a categorical variable or grouping.

It is perfomed using PROC SGPANEL and importantly the command panelby


*/

proc sgpanel data=sashelp.heart noautolegend;
title "Cholestrol distribution in Heart Study";
panelby sex;
histogram cholesterol;
density cholesterol;
run;
