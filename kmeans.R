library("cluster")
getwd()
setwd("C://Users//huzefa//OneDrive//Desktop")
getwd()

mul <- read.csv("multi.csv")
data <- mul[,-6]
scale_data <- scale(data)
scale_data
kmeans <- kmeans(scale_data, center = 3,nstart=25)
kmeans$cluster
final_data <- cbind(data,cluster=kmeans$cluster)
View(final_data)
table(data$Area_sqft,kmeans$cluster)
clusplot(scale_data,kmeans$cluster)