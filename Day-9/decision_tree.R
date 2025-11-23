getwd()
setwd("C:/Users/huzefa/OneDrive/Desktop")

dia <- read.csv("diabetes.csv")
dia
dis$Outcome <- as.factor(dia$Outcome)

library("rpart")
library("rpart.plot")
set.seed(123)
train_index <- sample(1:nrow(dia),0.7 * nrow(dia))
train_data <- dia[train_index,]
test_data <- dia[-train_index,]
dim(train_data)
dim(test_data)

tree_model <- rpart(Outcome ~., data = train_data,method = "class")

rpart.plot(tree_model)

prediction <- predict(tree_model,test_data,type = "class")
conf_matrix <- table(Predicted = prediction,Actual = test_data$Outcome)
conf_matrix
accuracy <- mean(predictions == test_datas$Outcome)
accuracy