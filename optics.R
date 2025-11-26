library(dbscan)
library(cluster)

setwd("C://Users//huzefa//OneDrive//Desktop")
mul <- read.csv("multi.csv")
mul <- mul[, -6]
scale_data <- scale(mul)

# Run OPTICS
opticss <- optics(scale_data, eps = 2, minPts = 5)

# Use the cluster field already inside the OPTICS object
clusters <- opticss$cluster

# Verify
length(clusters)
table(clusters)

# Final data
final_data <- cbind(mul, cluster = clusters)
View(final_data)

# Plot
clusplot(scale_data, clusters,
         shade = TRUE,
         labels = 2,
         main = "OPTICS Clustering Result")
