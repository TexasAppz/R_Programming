# R_Programming
You are given information about 60 stores (outlets of a restaurant chain) in the Stores.csv spreadsheet. The variables are (EARN is the dependent variable):
•	EARN (in $1,000) Operating earnings
•	K (in $1,000) Capital invested in the store
•	SIZE (in m^2) Size of store
•	EMPL Number of employees employed by the store
•	P15 Number of 15-24 year-olds in a 3km radius around the site
•	P25 Number of 25-34 year-olds in a 3km radius around the site
•	P35 Number of 35-44 year-olds in a 3km radius around the site
•	P45 Number of 45-54 year-olds in a 3km radius around the site
•	P55 Number of people above 55 in a 3km radius around the site
•	INC (in $1,000) Average income in town around site
•	COMP Number of competitors in a 1km radius around site
•	NCOMP Number of restaurants not considered competitors in a 1km radius
•	PRICE (in $/m^2/month) Monthly rent per square meter of the retail properties in the same area
•	CLI Cost of Living Index
Part 1: do in R
(a)	Split the data set into a training set (2/3 of the data or 40 stores) and a testing set (20 stores). Each instance must be assigned to the training set or testing set randomly. Consider the training set. Compute the correlation matrix, including the dependent variable. With which independent variable is EARN (operating earnings) most positively correlated? 
cor(StoreTrain)
cor(StoreTrain$EARN, StoreTrain$SIZE) 
EARN most positively correlated to SIZE at 0.6142104545
(b)	Plot the operating earnings as a function of the independent variable you identified in (a).
Answer located in the R and Excel file
(c)	Run a simple linear regression to predict operating earnings as a function of the independent variable you identified in (a). Check that the R^2 is the square of the coefficient of correlation. Are you satisfied with this model?
simple_linear = lm(EARN ~ SIZE, data = StoreTrain)
summary(simple_linear)
EARN = 14.2175 + 1.0245(SIZE) 
Multiple R-squared:  0.3773 = 37.7%. Low R^2 value
Refine it so that all coefficients are statistically significant at the 99% level or higher. What is your linear regression equation and what is its R^2?
simple_linear = lm(EARN ~ 0 +SIZE, data = StoreTrain)
summary(simple_linear)
Simple Linear Regression, EARN = SIZE(1.120)
Multiple R-squared:  0.806 = 80%. Better R^2
 
Compute the R^2 of the model you found in (c) on the testing set. Are you satisfied with your model?
1-SSE/SST = -0.4836929 = -48.3%. I am not satisfied with The R^2 value. It is negative. There is no 
correlation b/w my testing set and training set doing a simple linear regression.

(d)	Make predictions of operating earnings for the potential stores considered in PotentialStores.csv (because those stores have not opened yet, the number of employees in those stores is not yet available). Which store, if any, has a ratio of predicted operating earnings to capital higher than 0.26, which is the threshold management has selected to decide whether to open a store?
Stores D = 36. 32.82% and Store I = 28.58%.   have Ratio > threshold (0.26)

(e)	(i) Run a linear regression to predict EARN as a function of all the independent variables except K. What is the R^2? Which coefficients are statistically significant and at which level? 
At 95% or above, the Multiple R-squared is 0.8883= 80%
EARN = -3.437e+02 + STOR (7.245e-01) + SIZE (7.983e-01) + P35 (2.625e-02) + INC (8.436e+00) + NREST (1.488e+00)  + PRICE   (-2.218e+00)

(ii) Refine your model until all coefficients are statistically significant at the 99% level or higher. What is the new R^2 of your model? What is the linear equation predicting earnings as a function of the independent variables you selected? Comment on the sign of each coefficient. (Check that each sign makes sense.) 
At 99% or higher, Multiple R-squared:  0.848 = 84.8%
EARN =  -3.535e+02  + SIZE (7.985e-01)  + P35(2.709e-02 )+ INC (7.978e+00) + NREST(1.647e+00)  
Only the interception has a negative sign, but all the other independent variables are positive. The greater the independent variables, the greater the Operating Earnings.

(iii) Is the independent variable you had picked in your simple linear regression model highly correlated with some of the independent variables you selected in this linear regression with multiple independent variables? (if you don’t use that independent variable anymore, you want to understand why it’s no longer there)
It is. Size, from the simple linear regression model is correlated to all the independent variables since all of them are positive. Interception is the only negative coefficient.


(f)	Compute the R^2 of your model on the testing set. Comment. 
1-SSE/SST = 0.6750177 = 67.5%. I am not completely satisfied with the model since R^2 is just above 50%.


(g)	Generate predictions of operating earnings for the 10 potential stores described in PotentialStores.csv. Again, management only wants to open stores with a ratio of operating earnings (EARN) to invested capital (K) of at least 0.26 or 26%. Which store, if any, should it open? Is it the same store or stores as in (e)? 
Stores D = 36.97% and Store I = 28.13% have Ratio > threshold
Yes, Same Stores as in (e).

Part 2: repeat all questions in Excel using the same training set and testing set you used in Part 
1. (Use write.csv to export your training set and testing set to Excel, for instance write.csv(StoresTrain, “StoresTrain.csv”)  .) Check that you obtain the same answers. 

