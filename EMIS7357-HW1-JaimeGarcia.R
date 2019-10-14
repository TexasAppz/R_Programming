Stores = read.csv("Stores.csv")
str(Stores) 
summary(Stores)
install.packages('caTools')
library(caTools)
set.seed(50)
# a) split data
spl <-sample.split(Stores$EARN, SplitRatio = 0.6666667)
StoreTrain <- subset(Stores, spl==TRUE)
#write.csv(StoreTrain, "StoreTrain.csv")
str(StoreTrain)

StoreTest<- subset(Stores, spl==FALSE)
#write.csv(StoreTest, "StoreTest.csv")



# a) Computer Correlation Matrix
cor(StoreTrain)
cor(StoreTrain$EARN, StoreTrain$SIZE) # EARN most positively correlated to SIZE at 0.6142104545




# b) plot chart
plot(StoreTrain$SIZE, StoreTrain$EARN)
simple_linear = lm(EARN ~ 0 + SIZE, data = StoreTrain)
summary(simple_linear)
#Simple Linear Regression, EARN = SIZE(1.120)
# Multiple R-squared:  0.806

linear_predict = predict(simple_linear, newdata = StoreTest)
SSE = sum((StoreTest$EARN - linear_predict)^2)
SST = sum((StoreTest$EARN - mean(StoreTrain$EARN))^2)
1-SSE/SST  #Testing the regression  -0.4836929




#  Linear Regression (initial)
Reg_StoreTrain_initial <- lm(EARN ~ STOR + K + SIZE + EMPL + total + P15 + P25 + P35 + P45 + P55 + INC + COMP + NCOMP + NREST + PRICE + CLI, data = StoreTrain )
summary(Reg_StoreTrain_initial)


#  Linear Regression (statistically significant at the 95% level or higher)
Reg_StoreTrain_95 <- lm(EARN ~ STOR + K + SIZE + P35 + INC + NREST, data = StoreTrain )
summary(Reg_StoreTrain_95)
# EARN = -3.635e+02 + 7.189e-01(STOR) + -8.660e-02(K) + 1.120e+00(SIZE) + 2.600e-02(P35) + 9.005e+00(INC) + 1.524e+00(NREST)
# R^2 =0.8889



# c) Linear Regression (statistically significant at the 99% level or higher)
Reg_StoreTrain_final_99 <- lm(EARN ~ SIZE + P35 + INC + NREST, data = StoreTrain )
summary(Reg_StoreTrain_final_99)


# c) Linear Regression is => EARN = -3.535e+02 + 7.985e-01(SIZE) + 2.709e-02(P35) + 7.978e+00(INC) + 1.647e+00(NREST)
# c) R^2:0.848

# d) Compute R^2 of the model on the testing set:
Store_Predictions = predict(Reg_StoreTrain_final_99, newdata = StoreTest)
SSE = sum((StoreTest$EARN - Store_Predictions)^2)
SST = sum((StoreTest$EARN - mean(StoreTrain$EARN))^2)
1-SSE/SST  #Testing the regression  0.6750177

PotentialStores <- read.csv("/Users/jaimegarcia/Desktop/DESKTOP_101/code/R_code/SMU/Assigments/Assigment1/PotentialStores.csv")
str(PotentialStores)
head(PotentialStores)
PotentialStores <-PotentialStores[,-5]
PotentialStores
PotentialStores$EMPL = c(0,0,0,0,0,0,0,0,0,0)
PotentialStores

PotentialStores_predictions = predict(Reg_StoreTrain_final_99, newdata = PotentialStores)
PotentialStores_predictions
# 34.120648  81.420552  70.226829 309.073726  38.659214 117.155938   4.878253  62.780018 164.304914 161.559590










