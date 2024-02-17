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

