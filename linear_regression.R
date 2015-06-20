#import data
library(car)
library(MASS)
setwd("~/Documents/Data Analytics")
house_prices <- read.csv(file="House_Prices.csv")
names(house_prices)
str(house_prices)
attach(house_prices)

#simple model
lm.1 <- lm(Price ~SqFt, data = house_prices)
summary(lm.1)

plot(SqFt, Price, main = "Scatter plot", xlab = "Square Feet", ylab ="Price")
abline(lm.1, col = "red", lwd=3)

#create dummy variables
house_prices$brick_d <- ifelse(house_prices$Brick =="yes", 1, 0)
house_prices$east <- ifelse(house_prices$Neighborhood == "East", 1, 0)
house_prices$north <- ifelse(house_prices$Neighborhood =="North", 1, 0)

#split dataset
set.seed(110)
sub <- sample(nrow(house_prices), floor(nrow(house_prices)*0.6))
training_data <- house_prices[sub,]
validation_data <- house_prices[-sub,]

#multiple regression with all variables
lm.fit1 <- lm(Price ~ SqFt+Bathrooms+Bedrooms+Offers+north+east+brick_d, data = training_data)
summary(lm.fit1)

#use stepwise regression to see if # of variables can be reduced
lm.fit1.step <- stepAIC(lm.fit1)
summary(lm.fit1.step)

#check for multicollinearity
vif(lm.fit1)

#predict values ontraining set
training_data$predict.price <- predict(lm.fit1)
training_data$error <- residuals(lm.fit1)

#predict values on validation set
validation_data$predict.price <- predict(lm.fit1,newdata=validation_data)
validation_data$error <- validation_data$predict.price - validation_data$Price

#check rsidual plots
hist(training_data$error)
hist(validation_data$error)

#correlation
a<-cor(training_data$Price,training_data$predict.price)
b<-cor(validation_data$Price,validation_data$predict.price)
a*a
b*b








