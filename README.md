# SAS-Notes

### Listing multiple variables
SAS has no commas basically. A list such as Age,Sex, Gender, Weight in SAS will be written as Age Sex Gender Weight. This applies to both variables and commands.

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

## Mathematical operations
In SAS, addition, subtraction multiplication and division are all the same i.e.(+,-,*,/) but exponentiating isn't ^ but rather a double asterix(**)
thus 2 ** 3 =8
