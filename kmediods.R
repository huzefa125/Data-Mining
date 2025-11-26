library("cluster")
getwd()
setwd("C://Users//huzefa//OneDrive//Desktop")
getwd()

set.seed(123)
mul <- read.csv("multi.csv")
mul <- mul[,1:5]
scaled_data <- scale(mul)
kmediods <- pam(scaled_data,k=3)
kmediods
kmediods$clustering
kmediods$mediods
table(mul$Area_sqft,kmediods$clustering)
clusplot(scaled_data,kmediods$clustering)