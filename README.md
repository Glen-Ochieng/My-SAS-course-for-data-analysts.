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

### How to Deal with Whitespace and Blanks
Until now, all our input variables were values without whitespaces (blanks). However, it might happen that the values in the DATALINES statement contain blanks.

In the examples above, the employee column contains the surname of the employee. In the code below, we try to change the value of the employee column such that it contains the first name and the surname, for example John Smith or Mike Williams.

    data work.employees;

    length employee $25;
    
    input employee $ salary birthdate date9.;
    
    monthly_salary = round(salary / 12, 1);
    
    age = intck("year", birthdate, today(), "c");
    
    format salary monthly_salary dollar12.2 birthdate date9.;
    
    datalines;
    
    John Smith 40000 30MAR1980
    Mike Williams 35000 05SEP1994
    Marta Jones 38000 15FEB1988
    Javi Hernandez 38500 08DEC1991
    ;
    run;

![image](https://github.com/Glen-Ochieng/SAS-Notes/assets/155974295/49663b76-5464-4c84-a9d1-cca48ce9c019)

The result of the code above is a table with missing values and notes in the SAS log (Note: Invalid data for X in line Y).
The cause of this problem is the way how SAS reads and processes the values after the DATALINES statement. As an example we use the following line of values.

*When SAS processes a line of values, it assumes that each blank indicates the beginning of the value of the next input variable. So, in our example, SAS copies the value John to the column employee. This isn’t a problem since John is a character value, just like the employee column (defined in the INPUT statement). Then, SAS tries to copy the value Smith to the salary column. This is a problem because SAS expects a numeric value, but Smith is a character value. Therefore, the salary column remains empty and SAS writes a note to the log. SAS continues processing the remaining values, but similar problems occur.*

To avoid this problem and to be able to enter values that contain blanks, we need to change the delimiter. By default, the value that separates the value of each input variable (i.e., the delimiter) is a blank. We can change this default behavior with the INFILE statement.

The INFILE statement consists of three parts and is the first statement after the DATA statement:

The INFILE keyword.
The DATALINES keyword to indicate that you enter raw data manually.
The DLM= option to define the delimiter and a semicolon. (DLM is an abbreviation of delimiter.)
You can choose the delimiter that suits you best, but the most common delimiters are a comma, a semicolon, or a tab. In the example below, we use the comma as a delimiter.

data work.employees;
    infile datalines dlm=',' dsd;	
    length employee $25;
    input employee $ salary birthdate :date9.;
    monthly_salary = round(salary / 12, 1);
    age = intck("year", birthdate, today(), "c");
    format salary monthly_salary dollar12.2 birthdate date9.;
    datalines;
John Smith, 40000, 30MAR1980
Mike Williams, 35000, 05SEP1994
Marta Jones, 38000, 15FEB1988
Javi Hernandez, 38500, 08DEC1991
;
run;

![image](https://github.com/Glen-Ochieng/SAS-Notes/assets/155974295/5a638d4f-fb89-4a1d-82ba-939a001a304e)


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
