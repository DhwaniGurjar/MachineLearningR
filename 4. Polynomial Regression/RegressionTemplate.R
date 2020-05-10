#Regression Template

#Polynomial Regression

#Importing the dataset 
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#Fitting the Regression Model to the dataset
#Create your regressor here
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_reg = lm(formula = Salary ~ .,
              data = dataset)

#Predicting a new result
y_pred = predict(regressor, data.frame(Level = 6.5))

#Visualising the Regression Model results
#install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary), color = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(regressor, 
                                        newdata = dataset)),
            color = 'blue') +
  ggtitle('Regression Model') +
  xlab('Level') +
  ylab('Salary')

#Visualising the Regression Model results (for higher resolution and smoother curve)
#install.packages('ggplot2')
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level),0.1)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary), color = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, 
                                        newdata = data.frame(Level = x_grid))),
            color = 'blue') +
  ggtitle('Regression Model') +
  xlab('Level') +
  ylab('Salary')