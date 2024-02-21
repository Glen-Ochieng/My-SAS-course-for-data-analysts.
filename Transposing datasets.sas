
/*You must remember to sort these datasets first.

PROC APPEND
Syntax

Proc append data=data1;
by variable_that_should_collapsed;
id variable_whose_entries_become_columns;
var variable_whose_entries_will_form_ the_entries_for_the_newly_formed_columns_from_the_above_code;
run;
*/

data A;
input ID 1 Product $ Sales;
lines;
1 AAA 50
1 BBB 45
2 AAA 52
2 BBB 46
;
run;

proc sort data=A;
 by ID ;
 run;
 
proc transpose data= A out=trans_A;
by id;
id Product;
var Sales;
run; 
