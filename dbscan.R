library(dbscan)
library(cluster)

getwd()
setwd("C://Users//huzefa//OneDrive//Desktop")
getwd()

set.seed(123)
mul <- read.csv("multi.csv")
mul <- mul[,-6]
scale_data <- scale(mul)

model <- dbscan(scale_data,eps=0.8,minPts=5)
model
model$cluster
final_dataset <- cbind(mul,cluster=model$cluster)
View(final_dataset)
table(mul$Area_sqft,model$cluster)
clusplot(scale_data,model$cluster,shed=TRUE,labels = 2)