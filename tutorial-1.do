## Problem 2
## Load the data: 
use "C:\Users\s4945697\Downloads\wage3.dta" 

## To describe data in a file: showing variables, type and label (if any)
describe

## Tabulating a variable in a table of frequencies
tab educ

## To recode the negative values (indicating missing data)
recode educ -2 = .
tab educ

##  To create dummy variables 
tabulate educ, generate(educ)

## To check that the values in the dummy variables are correct, create a loop over the 10 dummy variables 
forvalue j=1(1)10{
	tab educ educ`j', m
}

## To generate a variable that for each level of education gives the average wage for that level of education across all people in the data that have that level of education
## i.e. For each person who went to school for 9 years wageXeduc will be equal to the avg. wage across people with 9 years of education
bysort educ: egen wageXeduc=mean(wage)
## Note: egen is creating extentions to generating

## To label the wageXeduc variable "mean wage by educ level"
label variable wageXeduc "Mean wage by educ level"

## To cross-tabulate education and wageXeduc. Observe how the wage vary with the level of education.
tab wageXeduc educ, m
## Observation: The avg. wage increases as the level of education increases

## To label a value within a variable (This occurs when the values are not obvious like categorical variables)
## Creating variables for the following dummies in the data: married black south urban.
label define yesno 1 "Yes" 0 "No"
local list "married black south urban"
foreach x of local list {
	label values of 'x' yesno
	tab 'x', m
}