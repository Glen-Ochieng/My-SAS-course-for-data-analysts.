
*Do loop (stand-alone)
*Using counter/index;

data bweight;
set sashelp.bweight;
sum1_100=0;
do counter= 1 to 100 by 1;
sum1_100=sum_100+ counter;
end;









*If can only be followed by one then condition.This makes it very difficult, as for the same condition you have to rewrite the entire code if you want a new task to be performed;

data bweight;
set sashelp.bweight;
length weight_status $ 50;
if 2500 <= Weight <= 4200 then weight_status="Low Birth Weight";
else if 1000 <= weight < 2499 then weight_status="Very Low Birth Weight";
else if .< Weight <1000 then weight_status ="Extremely Low Birth Weight";
*Creating a much shorter acronymn column;
if 2500 <= Weight <= 4200 then WS_Code="LBW";
else if 1000 <= weight < 2499 then WS_Code="VLBW";
else if .< Weight <1000 then WS_Code="ELBW";
run;

*To save us from this tediousness, we can use do loops;
*Attach semicolons after everything.; 

data bweight1;
	set bweight;
if 2500 <= Weight <= 4200 then do;
	weight_status="Low Birth Weight";
	WS_Code="LBW";
	end;
else if 1000 <= Weight <= 2499 then do;
	weight_status="Very Low Birth Weight";
	WS_Code="VLBW";
	end;
else if .<= Weight < 1000 then do;
	weight_status="Extremely Low Birth Weight";
	WS_Code="ELBW";
	end;
