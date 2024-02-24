/* Determines whether three or more means are significantly different from each other.  
  
  Hypothesis 
  Ho=mu1=mu2=mu3...
  Ha= atleast one pair of means are different 

Example
Is mean weight among populations in Canada,Usa and England different?

  Assumptions
  1. The samples are normally distributed.
  2. The data is  continuous.

  Syntax

  PROC ANOVA data=dataset_name;
  CLASS categorical_variable;
  MODEL dependent_varaiable= independent_variable(s);
  run;
  quit- IF YOU A RUNNING A MODEL YOU MUST INCLUDE QUIT , JUST LIKE IN ITERATION LOOPS;

  */

proc anova  data=sashelp.heart;
class bp_status;
model weight= bp_status;
run;
quit;

*HOWEVER, WITH THE ABOVE CODE WE DON'T KNOW EXACTLY WHICH PAIR OF THE THREE POSSIBLE PAIRS IS /ARE THE ONES WITH THE DIFFERENT MEAN. TO KNOW, WE ADD THE MEANS STATEMENT.

proc anova  data=sashelp.heart;
class bp_status;
model weight= bp_status;
means bp_status;
run;
quit;

*THERE ARE EXACT TESTS FOR COMPARING GROUP MEANS SUCH AS BONFERRONI T TEST, TUKEY'S Studentized Range (HSD) TEST, DUNCAN MULTIPLE RANGE TEST, SCHEFFE'S GROUPING. THESE TESTS CAN BE ADDED OPTIONS TO THE MEANS STATEMENT. THE DIFFERENCES BETWEEN THE METHODS IS THAT SOME CONTROL FOR TYPE I ERROR AND SOME CONTROL FOR TYTPE II ERROR.

proc anova  data=sashelp.heart;
class bp_status;
model weight= bp_status;
means bp_status/duncan tukey bon scheffe;
run;

proc anova  data=sashelp.heart;
class smoking_status;
model weight= smoking_status;
means smoking_status/duncan tukey bon scheffe;
run;
quit;
quit;
