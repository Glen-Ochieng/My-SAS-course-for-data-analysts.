*The concatenate function can be performed in two ways.; 
*Using the cat functions;

data blanks;
a="No"
b="Blanks"
c= cat(a,b);
run;

*Using double seperators;
data blanks;
a="No"
b="Blanks"
c= a||b
run;
