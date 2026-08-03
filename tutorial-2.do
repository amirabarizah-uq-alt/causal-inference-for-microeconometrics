## Problem 1
## Given the wage2.dta:
## To estimate a simple regression to explain monthly salary (wage) in terms of IQ score (IQ)

## (1) Average salary and average IQ in the sample
sum wage IQ

## (2) Estimating simple regression model where an one-point increase in IQ changes wage by a constant dollar amount.
regress wage IQ
## Notation: regress (dependent variable) (independent variable)
## In this model, the predicted increase in wage if IQ increases by 15 points is $241.49

## (3) Estimate simple regression model where each one-point increase in IQ has the same percentage effect on wage. 
label variable lwage 
regress lwage IQ
## Apply lwage to obtain log(wage) - To obtain wage in percentage value
## If IQ increases by 15 points, the approximate percentage increase is 0.1321%

## Problem 2
## (1) Simple regression of log(wage) on IQ to obtain the slope coefficient
regress lwage IQ
## Slope coefficient: (+) 0.0088

## (2) Simple regression of log(wage) on educ to obtain the slope coefficient
regress lwage educ
## Slope coefficient: (+) 0.05984

## (3) Multiple regression of log(wage) on educ and IQ to obtain the new slope coefficients
regress lwage educ IQ
## Slope coefficient of educ: (+) 0.03912
## Slope coefficient of IQ: (+) 0.0059

## (4) Why are the coefficients of educ and IQ on wage smaller when they are included together in the wage eduation than separately? 
## The assumed full model is lwage = B0 + B1(educ) + B2(IQ) + u
## Since the multiple-regression coefficient on IQ is positive, B(IQ) = 0.0059 > 0, and according to command: regress educ IQ, educ is positively related to IQ therefore the omitted-variable bias is positive. Therefore, the simple education coefficient is larger (0.05984 > 0.03912) which represents the estimated upward bias caused by omitting IQ. 

## Problem 3: 
## Given the standard wage equation: 
## log(wage) = B0 + B1(educ) + B2(experience) + B3(tenure) + upward
## (1) Null hypothesis that another year of general workforce experience has the same effect on log(wage) as another year of tenure with the current employer:
## H0: B2 = B3
## H1: B2 =/ B3

## To test this hypothesis with F-statistics (Wald test for a single restriction)
regress lwage educ exper tenure
test exper = tenure
## As p-value is 0.6805 > 0.05, we fail to reject H0 that the coefficients on exper and tenure are equal. There is insufficients evidence to conclude that an additional year of general work experience has a different effect of log wages than an additional year of tenure with the current employer. 

## (2) Find the 95% confidence interval for educ, exper and tenure
regress lwage educ exper tenure
## Report from the table:
## 95% CI for educ: (0.062083, 0.087644)
## 95% CI for exper: (0.0087156, 0.021941)
## 95% CI for tenure: (0.0082974, 0.018452)

## (3) Consider a model where the return to education depends upon the amount of work experience: lwage = B0 + B1(educ) + B2(exper) + B3(educ*exper) + u
regress lwage educ exper c.educ##c.exper
## where c.educ#c.exper is the interaction term between education and experience 

## What is the return of another year of education, while holding experience fixed?
## Based on the output of the command above, holding experience fixed, the effect of one additional year of education is not constant. It depends on the worker's years of experience. Specifically, each additional year of experience increases the return to another year of education by 0.0032%. 
## Specifically, dlog(wage)/d(educ) = B1 + B3(experience) = 0.004405 + 0.003203(experience)

## (4) Using the estimation model in (3), state the null hypothesis that the return to education does not depend on the level of expertise. 
## For the return to education to not depend on the level of expertise, the interaction coefficient must be 0. 
## H0: B3 = 0
## H1: B3 =/ 0
regress lwage c.educ##c.exper
test c.educ#c.exper = 0
# As the p-value is 0.0365 < 0.05, we reject the H0 at the 5% level. Thus, the return to education depends significantly on experience and increases approximately by 0.32% for each additional year of experience. 
















 





