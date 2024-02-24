/* Assumptions 
1. There exists a linear relationship between predictors and the response variable.
2. The variances are constant.
3. The errors are normally distributed.

Syntax

PROC REG data =dataset_name;
model dependent_var= independent_var;
run;
quit;

proc reg data=sashelp.heart;
model cholesterol= systolic;
run;
quit;

*The difference between using PROC REG and PROC ANOVA is that PROC REG aside from bringing the ANOVA table it calculates the coefficients and draws plots . 

/*N/B- despite the result of the ANOVA stating that the model id valid, The R2 is very low. Meaning only about 4% of the variation in cholesterol can be described by variation in systolic pressure. * The R2 has its own code PROC CORR. The syntax is similar. 
Thus if we used this model to preidct the values, the won't be as close together as much as we would like. No model is perfect, they say but this one far from perfect. A potential solution is to add more predictors.*/

* Multiple linear regression

proc reg data=sashelp.heart;
model cholesterol= systolic ageatstart;
run;
quit;

*Notice the adjusted R2 has increased than the former model. This is because a lot more of the cholesterol levels can be explained by ageatstart.


