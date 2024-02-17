*The concatenate function can be performed in two ways.; 
*Using the cat functions;

data blanks;
a="No";
b="Blanks";
c= cat(a,b);
run;

*Using double seperators;
data blanks;
a="No";
b="Blanks";
c= a||b;
run;

*Note: The new variable created has no space in  between the first and second variables. To put a space, add the length statement with a length of one more than the number of characters of the first variable.;

data blanks;
length a $ 3;
a="No";
b="Blanks";
c= a||b;
run;

*This will return "No Blanks" in stead of "NoBlanks";

*A much simpler way though, is to include empty double quotation marks in between two pairs of seperators. Remember, no commas;

data blanks;
a="No";
b="Blanks";
c= a||""||b;
run;

*If, however, you have indicated the length of the variable earlier on and now it's not exactly one more that length of the variable the function split can be used to remove those trailing blanks;

data blanks;
length a $ 3;
a="No";
b="Blanks";
c= split(a)|| split(b);
run;

*Case sensitive functions;
*upcase-makes all letters of a word capital;
*lowcase-makes all letters of a word lowercase;
*propcase-makes the first letter of every word capital while the rest remain small;

data example1;
	infile datalines dsd firstobs=2 obs=5;
	informat name $20. hobby $10.;
	input age name $ hobby $;
datalines;
A=Age B=Name C=Hobby
25,joe,hoCkey
32,sArah Yu,Running
18,abigail,painting
47,Elizabeth Lafrance,baseball
A=Age B=name C=Hobby
;
run;

data example2;
  set example1;
NameUpper=upcase(name);
NameLower=lowcase(name);
NameProper=propcase(name);
run;

*We can create a flag that returns 1 or 0 if the string is located in that variable or if it is not respectively using the find function;

*Syntax*;

*find (Var_name, "string");

data example2;
  set example1;
NameUpper=upcase(name);
NameLower=lowcase(name);
NameProper=propcase(name);
Flag=find(NameProper,"Joe");
run;

* This function is case sesntive therefore "Joe" and "joe" are different and in the above case ,it will only return 1 if it is "Joe".;
*Create a vector to store the output.;
