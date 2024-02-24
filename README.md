# SAS-Notes

### String variable hot take
Numbers separated by special characters are no longer numerical but rather they strings. ie. 074-53-9892 is a string variable and you should include the $ under the input or length statement. 

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

### How to Change the Format of Input Variables
Another frequently asked question about creating a dataset manually is how to format the input variables.

By default, SAS uses the BESTw. format for numeric variables and the $w. format for character variables. You can modify the default formats with the FORMAT statement.

The FORMAT statement consists of 3 parts, namely:

1.The FORMAT keyword.
2.The name of the variable to which you want to apply the format.
3.The format you want to apply and a semicolon.
So, for example, if you want to apply the DOLLAR12.2 format to the salary variable you need the following statement:

    FORMAT salary DOLLAR12.2;
    
If you want to apply a format to your input variables, you need to place the FORMAT statement after the INPUT statement. So, for example:

    data work.employees;	
    length employee $25;
    input employee $ salary;
    format salary dollar12.2;
    datalines;
    Smith 40000
    Williams 35000
    Jones 38000
    Hernandez 38500
    ;
    run;

![image](https://github.com/Glen-Ochieng/SAS-Notes/assets/155974295/2266ccd1-b2a5-4dfe-b13f-871df1a8e120)

So, if you have two columns (for example, salary and bonus) and you want to apply the DOLLAR12.2 format to both of them, then you need the following FORMAT statement:

    FORMAT salary bonus DOLLAR12.2;

    
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


However, you can use the LENGTH statement also to change the length of multiple variables at once.

Suppose you have a dataset with two columns, namely FirstName and LastName. To change the length of both columns to 25 characters, you use the following code.

    LENGTH FirstName LastName $25;

##### There exists a shortcut method as well

While writing the variables in the input statement follow them up by the number of character spaces they will ocuppy 

	data finance;
 	input Id $1-12 Name 13-37 Salary;

In this case the first 12 characters will automatically be put into the iD column,(the 12th will act like the separator: you can chose it to be a blank space,a comma, tab(be careful with Tab , despite it moving the same distance as three spaces it does still count as a single character space) etc.) the 13th to the 37th characters will be put into the name column and the 38 th to n will be put into the Salary column. This method though works if variables are of similar length or about similar length where by you can add a few spaces to occuppy the remaining character slots to match up to the fixed number i.e if the  one id is 23 characters long in stead of 25 you can add two white spaces to get it to 25. To do this method, it is advisable to write the datalines and observations first then count to see which is the longest and work around that.

*The advantage of this method is it allows you to use different delimiters as the delimiters will not be deifined as seperators but rather characters.* 

	data finance;
	input IdNumber$ 1-11 Name$ 13-37 Salary;
	lines;	
	074-53-9892 Vincent, Martina         35000
	776-84-5391 Phillipon, Marie-Odile   29750
	929-75-0218 Gunter, Thomas           27500
	029-46-9261 Rudelich, Herbert        35000	
	446-93-2122 Harbinger, Nicholas      33900
	228-88-9649 Benito, Gisela           28000
	442-21-8075 Sirignano, Emily         5000
	;
	run; 

![image](https://github.com/Glen-Ochieng/SAS-Notes/assets/155974295/047c1638-3b49-4f6e-b697-ae451fc4c9a0)


### How to Enter Date Variables
Besides character and numeric variables, SAS provides date variables.
A SAS date variable is stored as the number of days between January 1st, 1960, and the given date. So, how do you enter date variables when you create a SAS dataset manually?

To enter date values after the DATALINES statement you need to do two things:

1.In the INPUT statement, you need to provide the name of the variable (for example my_date) followed by the format of the values after the DATALINES statement. For example, if you enter the value 31AUG2020, then you need INPUT my_date DATE9. as INPUT statement.

2.You need a FORMAT statement to make the date value interpretable for humans. Otherwise, SAS will show the number of days between the entered date and January 1st, 1960 in the output dataset.

For example, we will add the column birthdate to our example dataset and enter the values in the DATE9. format.

    data work.employees;	
	length employee $25;
	input employee $ salary birthdate date9.;
	format salary dollar12.2 birthdate date9.;
	datalines;
    Smith 40000 30MAR1980
    Williams 35000 05SEP1994
    Jones 38000 15FEB1988
    Hernandez 38500 08DEC1991
    ;
    run;


![image](https://github.com/Glen-Ochieng/SAS-Notes/assets/155974295/eee7beb6-d3bb-41cb-a1f0-3fd1d96d64cd)


As you can see, it isn’t necessary to enter March 30th, 1980 as “30MAR1980″d. You directly enter 30MAR1980 in the DATALINES statement.

### Checking the details of your variables
Use the PROC CONTENTS statement

	proc contents data=work.employees;
	run;
 
![image](https://github.com/Glen-Ochieng/SAS-Notes/assets/155974295/7946c373-2b4c-492b-b5d9-132112a53e93)

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


## Transposition
This is what is meant by transposing a dataset-changing from long to wide format.

![image](https://github.com/Glen-Ochieng/SAS-Notes/assets/155974295/7a181794-0b24-4734-ad6a-9d94c391a38a)


## PROC PRINT AND PROC CONTENTS HOT TAKE
You can also save the outputs of these statements using the OUT=___ statements 

### PROC MEANS NB

![image](https://github.com/Glen-Ochieng/SAS-Notes/assets/155974295/6c617d0c-7227-4862-9b92-9ad033afa59a)

The N in the second column stands for number of non-missing observations.

### TWO SAMPLE TTEST RESULTS INTERPRETATION

![image](https://github.com/Glen-Ochieng/SAS-Notes/assets/155974295/40a55f1f-35e5-4e0a-ab80-65afeda12754)

Diff(1-2) is the difference in means between the two samples/populations. The two Diff(1-2) are the results of mean1 -mean2 using two methods which are dependant on the equality of the variance(i.e. pooled/satterthwaite).
Now, to the answer the question are the two sample means different , the answer lies in the second last table.

![image](https://github.com/Glen-Ochieng/SAS-Notes/assets/155974295/9f960e42-422a-4fd6-b05d-7734d658e466)

However, to understand which of the two p-values to use. We must first start at the last table. Here we look at the p-values of the equality of variances test. If the variances are equal then we will use the p-value of the pooled in the second last table. If the variances are not equal then we will the p-value in the satterthwaite column in the second last table. 

![image](https://github.com/Glen-Ochieng/SAS-Notes/assets/155974295/ecd898cb-4271-4cbd-87f8-29a4e465b53d)

In the above example the variances are not equal ; therefore we use the p-value of the satterthwaite test 0.9357

