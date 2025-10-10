#Normalization
library(dplyr)
data("iris")
View(iris)

iris_minmax <- iris%>%
  mutate(across(where(is.numeric),
                ~(.-min(.)) / (max(.)-min(.))))
View(iris_minmax)

iris_minmax_custom <- iris%>%mutate(across(c('Sepal.Length','Petal.Length'),~(.-min(.))/(max(.)-min(.))))
View(iris_minmax_custom)

irih_zscore <- iris%>%mutate(across(where(is.numeric),~(.-mean(.))/sd(.)))
View(irih_zscore)

irih_zscore_custom <- iris%>%mutate(across(c('Sepal.Length','Petal.Length'),~(.-mean(.)/sd(.))))
View(irih_zscore_custom)

iris_decimal <- iris%>%mutate(across(where(is.numeric),~./(10^ceiling(log10(max(abs(.)))))))
View(iris_decimal)

iris_decimal_custom <- iris%>%mutate(across(c('Sepal.Length','Petal.Length'),~./(10^ceiling(log10(max(abs(.)))))))
View(iris_decimal_custom)

iris_scale <- iris%>%mutate(across(where(is.numeric),scale))
View(iris_scale)

irih_scale_cutom <- iris%>%mutate(across(c('Sepal.Length','Petal.Length'),scale))
View(irih_scale_cutom)