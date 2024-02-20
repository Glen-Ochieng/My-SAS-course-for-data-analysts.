# SAS-Notes

### Listing multiple variables
SAS has no commas basically. A list such as Age,Sex, Gender, Weight in SAS will be written as Age Sex Gender Weight. This applies to both variables and commands. However, when entering records under datalines or arguements in a function, commas are used.

### Missing values
Null numerics are recorded as dots. 

*Syntax*
A=.;

Null strings are recorded as empty white space between the quotation marks.

*Syntax*

B="";

## Naming convention for library, data set and variable

1.Library name should not exceed 8 characters in length

2.Dataset and Variable names must:

Start with a letter or underscore

Later characters can include letters, underscores, and numbers

Not exceed 32 characters in length

Not contain spaces

Not be the name of pre-existing SAS terminology (such as “_character_”)

For variable names, Upper/lowercase will be presented as such in output, BUT cat, Cat, and CAT would not be considered 3 separate variables in SAS.

### SAS Functions

Function is a pre-programmed routine that returns a value computed from one or more arguments.

#### Numeric functions

Character functions

Numeric Functions

ABS, MIN, MAX, MEAN, SUM, etc.

Ignores the missing values

##### Character Functions

|| - concatenation

STRIP - remove heading and trailing blanks

FIND - search for a string, if exists, return the position of first occurance, otherwise, return 0

SUBSTR(string, starting_pos, N) - extract a substring from a source string starting from the "starting_pos" for N number of characters

SCAN(string, N, delimiter) - extract the Nth word from the source string (that is delimited by "delimiter")

" " (a space) is considered as a string (as opposed to missing values)

## Mathematical operations
In SAS, addition, subtraction multiplication and division are all the same i.e.(+,-,*,/) but exponentiating isn't ^ but rather a double asterix(**)
thus 2 ** 3 =8

In place of the operators, we could use their designated functions

a=sum(2,3)

b=min(2,3)

c=mean(2,3)

### Do loops

Do loops must be finished with an end statement.


## Appending datasets hot tip


The reason why you might have some warnings when concatenating the 3 datasets are due to the different variable lengths of the same variables in across the 3 datasets. PROC IMPORT will evaluate the maximum length of a variable when importing the data, and this may lead to different variable length. There are two solutions provided here for your reference:

1) Always put the dataset with the longest variable length at first, so that the variable is initiated with that length: SET europe asia usa;

2) use LENGTH statement to define variable length first to make sure it's big enough to hold all the values.
